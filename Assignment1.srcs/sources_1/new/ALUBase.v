`timescale 1ns / 1ps
//implementation of the 6bit ALU


module ALUBase(
    input wire [5:0] A,
    input wire [5:0] B,
    input wire [2:0] fxn,
    output reg [5:0] X
    );

    reg[5:0] x, y;
    reg sel;
    wire c_out;
    wire overflow;
    wire[5:0] sum;
    wire gte;
    //instanciating the module
    RippleCarryAdder ad(.x(x), .y(y), .sel(sel), .overflow(overflow), .sum(sum), .c_out(c_out));

    
    always @*
    begin
        case(fxn)
        3'b001:
        begin
            //output B
            X = B;
        end
        3'b010:
        begin
            //output -A
            sel = 1'b1;
            x = 6'b000000;
            y = A;
            X = sum;   
        end
        3'b011:
        begin
             //output -B
            sel = 1'b1;
            x = 6'b000000;
            y = B;
            X = sum;   
        end
        
        3'b100:
        begin
             //output A >= B through the carry flag
            sel = 1'b1;
            x = A;
            y = B;
            X = c_out;
        end
        
        3'b101:
        begin
            //output A xor B
            X = A^B;
            x = 6'b000000;
            y = 6'b000000;
            sel = 1'b0;
        end
        
        3'b110:
        begin
            //output A + B
            sel = 1'b0;
            x = A;
            y = B;
            X = sum;
        end
        
        3'b111:
        begin
            //output A - B
            sel = 1'b1;
            x = A;
            y = B;
            X = sum; 
        end
        default:
            begin
            
            //default output A
                X = A;
                x = 6'b000000;
                y = 6'b000000;
                sel = 1'b0;
            end
        endcase
    
    end
    
    
    
endmodule
