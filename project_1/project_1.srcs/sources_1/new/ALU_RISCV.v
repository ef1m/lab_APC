`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2021 20:29:48
// Design Name: 
// Module Name: ALU_RISCV
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


module ALU_RISCV(
input [4:0] ALUOp, [31:0] A, [31:0] B, 
output reg [31:0] Result, reg Flag
    );
   
    always @(*)
        begin
            if (ALUOp[4]==0) begin
                case (ALUOp[2:0])
                    3'd0 :Result = ALUOp[3] ? (A - B) : (A + B);
                    3'd1 :Result = (A << B);
                    3'd2 :Result = A < B;
                    3'd3 :Result = ($signed(A) < $signed(B)) ? 1 : 0;
                    3'd4 :Result = A ^ B;
                    3'd5 :Result = ALUOp[3] ?  ($signed(A) >>> $signed(B)) : (A >> B);
                    3'd6 :Result = A | B;
                    3'd7 :Result = A & B;
                endcase
                Flag=0;
            end
            else begin
            if (ALUOp[3]) begin
                case (ALUOp[2:0])
                    3'd0 :
                    begin
                        Result = (A == B);
                        Flag = Result;
                    end
                    
                    3'd1 :
                    begin
                        Result = (A != B);
                        Flag = Result;
                    end
                    
                     3'd4 :
                    begin
                        Result = (A < B);
                        Flag = Result;
                    end
                    
                     3'd5 :
                    begin
                        Result = (A >= B);
                        Flag = Result;
                    end
                    
                    3'd6 :
                    begin
                        Result = ($signed(A) < $signed(B));
                        Flag = Result;
                    end
                    
                    3'd7 :
                    begin
                        Result = ($signed(A) >= $signed(B));
                        Flag = Result;
                    end
                    
                endcase
            end
            end
        end
    
endmodule
