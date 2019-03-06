`timescale 1ns / 1ps
//Daniel Sloggett
//This module is meant to map the ALU to the target board and its functions
//You select whether you show the output, or new input on the 7-segment display, by using switch 15. Up is the output
//you store the value into Register A by hitting the left button
//you store the value into Register B by hitting the right button
//you store the value into Register fxn by hitting the centre button
//you view the value in Register A by hitting the up button
//you view the value in Register B by hitting the down button
//The function is always displayed on the 3 rightmost LEDs
//The output is always displayed on the 6 leftmost LEDs


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
    //instanciating modules
    Display disp(.CLK(CLK), .num(dispVal), .SSEG_AN(SSEG_AN), .SSEG_CA(SSEG_CA));
    ALUBase ALU(.A(A), .B(B), .fxn(fxn), .X(out));
    //assigning permanant LED mappings
    assign LED[15:10] = out;
    assign LED[2:0] = fxn;
    
    
    
    always@(posedge CLK)
    begin
        //implementing the behaviour described at the top of the file
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
