`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2021 19:46:34
// Design Name: 
// Module Name: RF
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


module RF(
    input clk,
    input WE,
    input [4:0] rd1_addr, 
    output [31:0] RD1, 
    
    input [4:0] rd2_addr,
    output [31:0] RD2,
    
    input [4:0] wr_addr,
    input [31:0] wd3
    );
    reg [31:0] RAM [0:31];
    assign RD1= (rd1_addr != 5'b0)? RAM[rd1_addr]: 0;
    
    assign RD2= (rd2_addr != 5'b0)? RAM[rd2_addr]: 0;
    
    always @ (posedge clk) begin
        if (WE) RAM[wr_addr]<=wd3;
        
    end
endmodule

