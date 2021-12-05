`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2021 18:34:42
// Design Name: 
// Module Name: tb_alu
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


module tb_alu(
);
   reg [4:0] ALUOp;
   reg [31:0] A;
   reg [31:0] B; 
   wire [31:0] Result;
   wire Flag;
   ALU_RISCIV dut(ALUOp, A, B, Result);
   initial begin
        add_op(5,8);
        add_op(8,15);
        add_op(1,1);
        add_op(20,20);
        $stop;
   end
   task add_op;
   input [31:0] Aop, Bop;
        begin
            A=Aop;
            B=Bop;
            ALUOp=5'b0;
            #100;
            if (Result==(A+B))
                $display("good");
            else
                $display("bad");
        end
   endtask 
endmodule
