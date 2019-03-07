`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2019 15:49:11
// Design Name: 
// Module Name: ALU testbench
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


module ALUtestbench(

    );
    
    reg[5:0] A, B; 
    wire[5:0] out;
    reg[2:0] fxn;
    ALUBase UUT(.A(A), .B(B), .fxn(fxn), .X(out));
    
    initial
    begin
        A = 6'd24;
        B = 6'd30;
        for(fxn = 3'b2_000; fxn < 3'b2_111; fxn = fxn + 3'b001)
        begin
            #1;
        end
        fxn = fxn + 1;
        #1
        
        $stop;
    end
    
    
    
endmodule
