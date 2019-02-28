`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2019 13:41:31
// Design Name: 
// Module Name: gte8
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


module gte8(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire agteb
    );
    
    wire gt0, gt1, gt2, gt3;
    wire eq0, eq1, eq2, eq3;
    
    gt2 g0(.a(a[1:0]), .b(b[1:0]), .agtb(gt0));
    gt2 g1(.a(a[3:2]), .b(b[3:2]), .agtb(gt1));
    gt2 g2(.a(a[5:4]), .b(b[5:4]), .agtb(gt2));
    gt2 g3(.a(a[7:6]), .b(b[7:6]), .agtb(gt3));
    eq2 e0(.a(a[1:0]), .b(b[1:0]), .aeqb(eq0));
    eq2 e1(.a(a[3:2]), .b(b[3:2]), .aeqb(eq1));
    eq2 e2(.a(a[5:4]), .b(b[5:4]), .aeqb(eq2));
    eq2 e3(.a(a[7:6]), .b(b[7:6]), .aeqb(eq3));
    
    
    assign agteb = gt3 | eq3&(gt2 | eq2&(gt1 | eq1&(gt0 | eq0)));
      
endmodule
