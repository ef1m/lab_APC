`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2021 19:18:35
// Design Name: 
// Module Name: im
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


module im(
input clk, [5:0] adr, [31:0] wd, we,
output [31:0] rd
    );
    reg [31:0] RAM [0:63];
    initial $readmemb("D:/Users/Desktop/5semestr/apc/lab2/project_1/project_1.srcs/sources_1/new/ram.txt", RAM);
    assign rd=RAM[adr];
    always @ (posedge clk) begin
        if (we) RAM[adr]<=wd;
    end
endmodule
