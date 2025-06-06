`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 13:23:58
// Design Name: 
// Module Name: Data_Memory_SS
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


module Data_Memory_SS(
    input [63:0] Mem_Addr,
    input [63:0] WriteData,
    input clk,
    input MemWrite,
    input MemRead,
    output reg [63:0] ReadData,
    output [63:0] n0,
    output [63:0] n1,
    output [63:0] n2,
    output [63:0] n3,
    output [63:0] n4, n5, n6);
    
reg [7:0] Memory [511:0]; 
integer k;
initial begin
    for (k = 0 ; k < 512 ; k = k + 1) begin
        Memory[k] = 0;
    end
    //storing the number in memory
    //[6,8,0,2,7,9,3]
    Memory[256] = 8'd6;
    Memory[260] = 8'd8;
    Memory[264] = 8'd0;
    Memory[268] = 8'd2;
    Memory[272] = 8'd7;
    Memory[276] = 8'd9;
    Memory[280] = 8'd3;
end 

assign n0 = {Memory[256]};
assign n1 = {Memory[260]};
assign n2 = {Memory[264]};
assign n3 = {Memory[268]};
assign n4 = {Memory[272]};
assign n5 = {Memory[276]};
assign n6 = {Memory[280]};

always@ (*) begin
    if (MemRead == 1'b1) begin //reading
         ReadData[15:0] <= Memory[Mem_Addr+0];
//         ReadData[15:8] <= Memory[Mem_Addr+1];
         ReadData[31:16] <= Memory[Mem_Addr+1];
//         ReadData[31:24] <= Memory[Mem_Addr+3];
         ReadData[47:32] <= Memory[Mem_Addr+2];
//         ReadData[47:40] <= Memory[Mem_Addr+5];
         ReadData[63:48] <= Memory[Mem_Addr+3];
//         ReadData[63:56] <= Memory[Mem_Addr+7];
    end
end
always@ (negedge clk) begin
    if (MemWrite == 1'b1) begin //writing //splits it into 8 what if we split into 4
//         Memory[Mem_Addr+7] <= WriteData[63:56];
//         Memory[Mem_Addr+6] <= WriteData[55:48];
//         Memory[Mem_Addr+5] <= WriteData[47:40];
//         Memory[Mem_Addr+4] <= WriteData[39:32];
//         Memory[Mem_Addr+3] <= WriteData[31:24];
//         Memory[Mem_Addr+2] <= WriteData[23:16];
//         Memory[Mem_Addr+1] <= WriteData[15:8];
//         Memory[Mem_Addr] <= WriteData[7:0];
            Memory[Mem_Addr] <= WriteData[15:0]; 
            Memory[Mem_Addr+1] <= WriteData[31:16]; 
            Memory[Mem_Addr+2] <= WriteData[47:32]; 
            Memory[Mem_Addr+3] <= WriteData[63:48]; 
    end
end
endmodule
