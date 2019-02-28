`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2019 18:19:21
// Design Name: 
// Module Name: gteflags
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


module gteflags(
    input wire v,
    input wire n,
    output wire gte
    );
    
    assign gte = n == v;
    
endmodule
