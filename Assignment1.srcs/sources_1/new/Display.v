`timescale 1ns / 1ps
//take the value from "num" and display to the 7seg


module Display(
    input wire[5:0] num,
    input wire CLK,
    output wire[3:0] SSEG_AN,
    output reg[7:0] SSEG_CA
    );
    
    reg[19:0] cntr = 19'b0;
    reg[3:0] nibble;
    
    //counter to delay change
    always@(posedge(CLK))
    begin
        cntr <= cntr + 1'b1;
    end
    
    assign SSEG_AN[3:2] = 2'b11;
    assign SSEG_AN[0] = cntr[19];//this makes it so the value only changes slower than every clock cycle
    assign SSEG_AN[1] = ~cntr[19];
     
     
    //pulling the correct nibble 
    always@*
    begin
	    case(SSEG_AN[1:0])
            2'b01: nibble = {2'b00,num[5:4]};
            2'b10: nibble = num[3:0];
            default: nibble = 4'b0000;
        endcase
    end
    //decoding said nibble
    always@*
    begin
        case(nibble)
            4'b0000: SSEG_CA = 8'b11000000;
            4'b0001: SSEG_CA = 8'b11111001;
            4'b0010: SSEG_CA = 8'b10100100;
            4'b0011: SSEG_CA = 8'b10110000;
            
            4'b0100: SSEG_CA = 8'b10011001;
            4'b0101: SSEG_CA = 8'b10010010;
            4'b0110: SSEG_CA = 8'b10000010;
            4'b0111: SSEG_CA = 8'b11111000;
            
            4'b1000: SSEG_CA = 8'b10000000;
            4'b1001: SSEG_CA = 8'b10011000;
            4'b1010: SSEG_CA = 8'b10001000;
            4'b1011: SSEG_CA = 8'b10000011;
            
            4'b1100: SSEG_CA = 8'b11000110;
            4'b1101: SSEG_CA = 8'b10100001;
            4'b1110: SSEG_CA = 8'b10000110;
            4'b1111: SSEG_CA = 8'b10001110;  
        endcase   
    end
    
    
    
    
endmodule
