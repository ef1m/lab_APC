`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2021 18:36:56
// Design Name: 
// Module Name: ALU_RISC_IV
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


module ALU_RISCIV(
input [3:0] ALUOp, [31:0] A, [31:0] B, 
output reg [31:0] Result,
output reg Flag
    );
    always @(*)
        begin
                case (ALUOp[3:0])
                    4'b0000 : 
                    begin
                        Result = A + B;
                        Flag=0;
                    end
                    
                    4'b0001 : 
                    begin
                        Result = A - B;
                        Flag=0;
                    end
                    
                    4'b0010 :
                    begin
                        Result = A << B;
                        Flag=0;
                    end
                    
                    4'b0011 :
                    begin
                        Result = A >> B;
                        Flag=0;
                    end
                    
                    4'b0100 :
                    begin
                        Result = ($signed(A) < $signed(B)) ? 1 : 0;
                        Flag=0;
                    end
                    
                    4'b0101 :
                    begin
                        Result = A ^ B;
                        Flag=0;
                    end
                    
                    4'b0110 :
                    begin
                        Result = $signed(A) >>> $signed(B);
                        Flag=0;
                    end
                    
                    4'b0111 :
                    begin
                        Result = A >> B;
                        Flag=0;
                    end
                    
                    4'b1000 : {Flag, Result} = A | B;
                    4'b1001 : {Flag, Result} = A & B;
                    4'b1010 : {Flag, Result} = (A == B);
                    4'b1011 : {Flag, Result} = (A != B);
                    4'b1100 : {Flag, Result} = (A < B);
                    4'b1101 : {Flag, Result} = (A >= B);
                    4'b1110 : {Flag, Result} = ($signed(A) < $signed(B));                    
                    4'b1111 : {Flag, Result} = ($signed(A) >= $signed(B));
                endcase
        end 
endmodule
