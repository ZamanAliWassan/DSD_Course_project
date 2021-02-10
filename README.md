# DSD_Course_project

Topic: ...................................................................................................................................................................

In this project  I had to design and implement a hardware to ADC interface on NEXYS 4 DDR.
The system receive analog values and display the corresponding change in amplitude using pulse width modulation (PWM) on 16 bit user LEDs Bar, Seven segment displays and RGB LEDs.

Requirements:.............................................................................................................................................................

Computer with Vivado 2016.2 IDE for coding and programming logic.  
Nexys4 ddr FPGA board for monitoring and displaying output. 
Connecting cable to program the Nexys4 from PC. 
Function generator to set input. 
Biploar probe to connect the Function generator with ADC ports. 

Introduction:.............................................................................................................................................................

This task has been assigned as a class project. The prpoose of this project is to get familier with verilog and vhdl coding.
along with that this project provides the good knowledge about the Adc which is embedded in the nexys4 ddr board (JXADC).
the interfacing is done on the baisis of the modular approach. 
different modules are used separately to understand the internal structure of the program. 
the purpose of using moduler approach is to divide the tasks into different modules so that the debugging can be easier as compared to the single bigger porogram. 

Description:.............................................................................................................................................................

JXADC has been chosen with the help of the external swiches. Two user switches sw0, sw1 are instantiated for chosing which particular pmod we are using.
JXADC has four Pmod AD2, AD3, AD10, AD11. each is chosen by placing the switches on right position. 
if sw0 = 1 and sw1 = 0 the AD3 pmod will be selected to feed the ADC with input. similarly 
if sw0 = 0 and sw1 = 1 the AD11 pmod will be selected to feed the ADC with input.
if sw0 = 1 and sw1 = 1 the AD10 pmod will be selected to feed the ADC with input.
if sw0 = 0 and sw1 = 0 the AD2 pmod will be selected to feed the ADC with input.
In this project we have used the AD3 pmod. it has two input ports (JXADC1P, the 1st pin of JXADC) and (JXACD7N, the seventh pin of JXADC). 
The pin ADCvcc and ADCgroun are also used. 
To connect the pin VAUXP3 with ACD we also need a common ADC ground. 
All the other pins are grounded or left unconnected to avoid coupling. 
Signal generator (Function generator) is connected to JXADC1P to input the signal voltage (Analog). 
the JXADC7N is grounded with common ground of JXACD and function generator. 
once the signal is given to ADC it will generatr the 12 bit output because the nexys4 ddr board contains 12 bit adc. 
the achieved data is moved to the registers which are 15:0 bits which are 16 bits in total. 
the data achieved from ADC is transfered to the User LEDs and Seven segments and RGB Leds. 

Observation:..............................................................................................................................................................

Sine wave or the square wave is applied as an input to JXADC. The amplitude is set to 100mv and frequency is set to 0.5Hz. 
the exact 12 LEDs will be on when we supply the full 100mv. if we reduce the voltage to 40mv one LED will be off. 
when we reduce volts to 13mv the 10 LEDs will be on. and so on.
Each LED will need certain voltage to operate. which is to be calculated as follows. 

                                   ADC = 12 bits 
                                   possible samples of 12 bit ADC are = (2)^12 = 4096 samples 
                                   refrence voltas assumed = 0 to 1v
                                   
                                   Volts = Vref/(total possible samples)
                                   Volts = 1/ 4096 = 244uv
                                   Volts = 244uV
above calculaion shows that the single LED will require supply 244uV to operate. 
Vref for ADCs can be different in different boards. this ADC which is used by us has the input voltage of 1.5V to 3.3V as input and it can have 0 to 1V as a refrence voltage.

Programming code (Moduler Approach):................................................................................................................................


<img src = "https://github.com/ZamanAliWassan/DSD_Course_project/blob/main/modular_approach.PNG">





The proograming is done in Verilog and Vhdl language. 
the modular approach is used to divide the programs in to small pieces so that error can be detected easily. 
We have used the MIT refrence manual for code and logics. 
following picture represents the modules used in our project modular approach. 
there is one top module of this project which is XDC Demo. 








<img src = "https://github.com/ZamanAliWassan/DSD_Course_project/blob/main/projectFlow.PNG">











XADCdemo:.................................................................................................................................................................

module contains the instantiations of three sub modules. 
1) the ADC IP. we have generated the IP through the IP catalogue.
2) DegtoSeg. this module contains five other modules which contains different functions. 
3) RGBtop Module. this module contains the RGB code and the 6 pwms which are used to drive the RGB internal LEDs. 
All of the above files are instantiated in top level module (XADCdemo).
The common clock (CLK100MHz) is given to all of three modules from the top level module. 
This module contains the actual clock which is synchronised by the constraints file and the actual JXADC module. 
in generat the top level module has three sub divided modules which are listed above. 

JXADC IP Module:...........................................................................................................................................................

this module contains its own hierirchy. there is an other design module which is instantiated in it. 

1) xadc_wiz_0 module: In this module we generate the IP from ip cataloge. or it can also be imported from the opencores websites. which is builten. 
during generating IP we have to go to IP cataloge and after opening it following specfications are specfied. 

Basic >> DRP >> Continuous Mode>> Single chennel.
ADC Setup >> ADC offset and gain calibaration >> ADC sensor and gain calibration. 
Alarams >> no alaram is required at all. 
Single channel >> VAUXP3 VAUXN3 are chosen for temparature
generate the global and single polar IP. because it will take the unipolar input. 


DigtoSeg Module:..........................................................................................................................................................

this module contains following modules which are instantiated in in Digto Seg module. its hierarchy contains below  sub modules. 
this module is used major for the blinking the user leds and seven segments controll. with the help of the internal modules used. 

SevenSegmentDecoder: this module generates the seven outputs after getting the inputs. it is seven bit decoder. 
it actually decodes the data recieved in to pattern that the data can be sampled and represented by the seven segments on board. 
it is also called seven segment driver modules. 

SegClkDivider: this module divides the clock into the pattern so that it can be used by 2 four bit seven segment displays. 
actually each of the seven segment display represents seven outputs A,B,C, D, E, F, G. 
for all above outputs it will require the decoded data from driver and the clock signal. 

counter32 Module: this moodule contains the code of the counter which counts up to 32 bits samples. 
once it reaches the top value it is used in the condition conroll. it will be reset after ataining the highest value.

decoder3_8bits : this module will get the data feom  the ADC and will decode it into the pattern so that the seven segments can use it. 
also this decoder converts the binary data into 8 bits samples so that user leds can be activated. 

Mux: Mux is used for combining the all modules and run the condition according the programed data. 
The multiplexing also decides the clock uage in the modules. 


                       
                       




RGBtop Module: ............................................................................................................................................................

The above module has its own hierarchy which is used to control the the glow of RGB LEDs. 
this module contains six partial or sub modules in it hierarchy. which are slightly different with approximately same purposes. 

Six PWM Modules: these modules are neded to control the glow of the RGB leds. 
the color of LEDs can be toggled using these modules. 
actually PWM is an square wave with duty cycle. its duty cycle canbe controlled using and extra switch. 
because of these PWms the LEDs pattern change and the outputs cpomes simple and visible. 












