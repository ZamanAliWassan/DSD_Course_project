`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 01:43:51 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 06:06:38 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RGBtop(CLK100MHZ, Pwm_out1 , Pwm_out2);
    
       input  CLK100MHZ;
       output  [2:0] Pwm_out1;
       output [2:0] Pwm_out2;

    pwm RGB1_B (.CLK(CLK100MHZ), .duty(0),   .RGB1(Pwm_out1[0]));
    pwm RGB1_G  (.CLK(CLK100MHZ), .duty(64), .RGB1(Pwm_out1[1]));
    pwm RGB1_R  (.CLK(CLK100MHZ), .duty(64), .RGB1(Pwm_out1[2]));
 
 
        pwm RGB2_B (.CLK(CLK100MHZ), .duty(0),   .RGB2(Pwm_out2[0]));
        pwm RGB2_G  (.CLK(CLK100MHZ), .duty(64), .RGB2(Pwm_out2[1]));
        pwm RGB2_R  (.CLK(CLK100MHZ), .duty(64), .RGB2(Pwm_out2[2]));
      
endmodule
