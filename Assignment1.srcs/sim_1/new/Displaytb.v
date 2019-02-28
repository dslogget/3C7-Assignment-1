`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2019 19:36:58
// Design Name: 
// Module Name: Displaytb
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


module Displaytb(
    output wire[5:0] num,
    output wire[3:0] SSEG_AN,
    output wire[7:0] SSEG_CA
    );
    reg clk;
    assign num = 0'b000000;
    
    
    Display disp(.CLK(clk), .SSEG_AN(SSEG_AN), .SSEG_CA(SSEG_CA));
    
    initial
        clk = 1'b0;
    
    always
        #1 clk = ~clk;
    
    
    
endmodule
