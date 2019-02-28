`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2019 18:14:52
// Design Name: 
// Module Name: ALUBase
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


module ALUBase(
    input wire [5:0] A,
    input wire [5:0] B,
    input wire [2:0] fxn,
    output reg [5:0] X
    );
    
    /*
    input [5:0] x,
        input [5:0] y,
        input sel,
        output overflow,
        output c_out,
        output [5:0] sum
    */
    reg[5:0] x, y;
    reg sel;
    wire c_out;
    wire overflow;
    wire[5:0] sum;
    wire gte;
    
    RippleCarryAdder ad(.x(x), .y(y), .sel(sel), .overflow(overflow), .sum(sum), .c_out(c_out));

    
    always @*
    begin
        case(fxn)
        3'b001:
        begin
            X = B;
        end
        3'b010:
        begin
            sel = 1'b1;
            x = 6'b000000;
            y = A;
            X = sum;   
        end
        3'b011:
        begin
            sel = 1'b1;
            x = 6'b000000;
            y = B;
            X = sum;   
        end
        
        3'b100:
        begin
            sel = 1'b1;
            x = A;
            y = B;
            X = c_out;
        end
        
        3'b101:
        begin
            X = A^B;
            x = 6'b000000;
            y = 6'b000000;
            sel = 1'b0;
        end
        
        3'b110:
        begin
            sel = 1'b0;
            x = A;
            y = B;
            X = sum;
        end
        
        3'b111:
        begin
            sel = 1'b1;
            x = A;
            y = B;
            X = sum; 
        end
        default:
            begin
                X = A;
                x = 6'b000000;
                y = 6'b000000;
                sel = 1'b0;
            end
        endcase
    
    end
    
    
    
endmodule
