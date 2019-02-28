`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2019 17:11:17
// Design Name: 
// Module Name: RippleCarryAdder
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


module RippleCarryAdder(
    input [5:0] x,
    input [5:0] y,
    input sel,
    output overflow,
    output c_out,
    output [5:0] sum
    );
    
    wire c0, c1, c2, c3, c4;
    wire[5:0] y_ac;
    wire[5:0] sel_ext;
    assign sel_ext = {6{sel}};
    assign y_ac = sel_ext&(~y) | ~sel_ext&(y);
    
    FullAdder ad0(.a(x[0]), .b(y_ac[0]), .cin(sel), .s(sum[0]), .cout(c0));
    FullAdder ad1(.a(x[1]), .b(y_ac[1]), .cin(c0), .s(sum[1]), .cout(c1));
    FullAdder ad2(.a(x[2]), .b(y_ac[2]), .cin(c1), .s(sum[2]), .cout(c2));
    FullAdder ad3(.a(x[3]), .b(y_ac[3]), .cin(c2), .s(sum[3]), .cout(c3));
    FullAdder ad4(.a(x[4]), .b(y_ac[4]), .cin(c3), .s(sum[4]), .cout(c4));
    FullAdder ad5(.a(x[5]), .b(y_ac[5]), .cin(c4), .s(sum[5]), .cout(c_out));
    assign overflow = c_out ^ c4; 
endmodule
