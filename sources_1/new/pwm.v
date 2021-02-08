`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2021 02:40:13 PM
// Design Name: 
// Module Name: pwm
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
// Create Date: 02/06/2021 06:10:04 PM
// Design Name: 
// Module Name: pwm
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

module pwm (
    input CLK,
    input [7:0] duty,
    //output reg pwm_out,
    output reg [2:0] RGB1 ,
    output reg [2:0] RGB2
    
    );
    integer i;

      reg [7:0] cnt = 8'b0;
    always @(posedge CLK)
     begin
       cnt <= cnt + 1;
    end

    always RGB1 = (cnt < duty);
    always RGB2 = (cnt < duty);

endmodule
