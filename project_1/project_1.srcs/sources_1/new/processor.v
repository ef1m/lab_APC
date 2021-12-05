`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2021 18:53:43
// Design Name: 
// Module Name: processor
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


module processor(
            input clk, rst, [15:0] SW,
            output [7:0] LED
    );
wire [31:0] instr;
reg [31:0] PC;
wire we;
wire [31:0] res;
wire [31:0] RD1;
wire [31:0] RD2;
wire mult2;
reg [31:0] mult3;
reg[31:0] wd;
wire flag;

im im_DUT(.clk(clk),.adr(PC),.rd(instr));
RF ddd(.clk(clk), .rd1_addr(instr[22:18]), .rd2_addr(instr[17:13]), .wr_addr(instr[12:8]), .wd3(mult3), .WE(instr[29]), .RD1(RD1), .RD2(RD2));
ALU_RISCIV aaa(.ALUOp(instr[26:23]), .A(RD1), .B(RD2), .Result(res), .Flag(flag));


always @(posedge clk)
begin
    if(rst)
        PC = 32'b0;
    else
    begin
        if (!mult2)
            PC <= PC + 1;
        else
            PC <= PC + {{24{instr[7]}}, instr[7:0]};
    end
    case(instr[28:27])
        2'd0: mult3 = {{24{instr[7]}}, instr[7:0]};
        2'd1: mult3 = {{16{SW[15]}}, SW[15:0]};
        2'd2: mult3 = res[31:0];
    endcase
end
assign mult2 = instr[31] | instr[30] & flag;
assign LED[7:0] = RD1[7:0];
endmodule
