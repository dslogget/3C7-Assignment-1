`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2019 13:17:52
// Design Name: 
// Module Name: gt2
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


module gt2(input wire[1:0] a, input wire[1:0] b, output wire agtb);
    wire exp1, exp2, exp3;
    
    assign exp1 = ~b[0] & ~b[1] & a[1];
    assign exp2 = ~b[0] & a[0];
    assign exp3 = ~b[1] & a[0];
    assign agtb = exp1|exp2|exp3;
    
endmodule
