`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2019 18:33:26
// Design Name: 
// Module Name: BoardMap
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


module BoardMap(
    input [15:0] SW,
    input [4:0] BTN,
    input CLK,
    output wire[15:0] LED,
    output wire[3:0] SSEG_AN,
    output wire[7:0] SSEG_CA
    );
    wire[5:0] out;    
    reg[5:0] A, B;
    reg[2:0] fxn;
    reg[5:0] dispVal;
     
    Display disp(.CLK(CLK), .num(dispVal), .SSEG_AN(SSEG_AN), .SSEG_CA(SSEG_CA));
    ALUBase ALU(.A(A), .B(B), .fxn(fxn), .X(out));
    
    assign LED[15:10] = out;
    assign LED[2:0] = fxn;
    
    
    
    always@(posedge CLK)
    begin
        if(BTN[0])
        begin
            dispVal <= A;
        end
        else if(BTN[3])
        begin
            dispVal <= B;
        end
        else if(SW[15])
        begin
            //output
            dispVal <= out;
        end
        else
        begin
            dispVal <= SW[5:0];
        end

        if(BTN[1])
            A <= SW[5:0];
        else
            A <= A;

        if(BTN[2])
            B <= SW[5:0];
        else
            B <= B;

        if(BTN[4])
            fxn <= SW[2:0];
        else
            fxn <= fxn;
    end

    
    
    
    
endmodule
