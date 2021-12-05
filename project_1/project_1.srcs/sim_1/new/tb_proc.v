`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2021 17:48:54
// Design Name: 
// Module Name: tb_proc
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




module tb_proc();

reg clk = 0;
reg rst;
reg SW;
wire [7:0] LED;

localparam CLK = 80;

always #(CLK/2) clk = ~clk;

processor dut (.clk(clk), .rst(rst), .SW(SW), .LED(LED)); 

initial
begin
    rst = 1;
    #100;
    rst = 0;
    SW = 16'b1100011001001000;
    #2000;
    $stop;
end

endmodule

