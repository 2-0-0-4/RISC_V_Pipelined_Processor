`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 19:43:43
// Design Name: 
// Module Name: MEM_WB_new
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


module MEM_WB_new
(
    input clk,
    input RegWrite, MemtoReg,
    input [63:0] ReadData, ALU_result,
    input [4:0] rd,

    output reg RegWrite_store, MemtoReg_store,
    output reg [63:0] ReadData_store, ALU_result_store,
    output reg [4:0] rd_store

);

always @(posedge clk) begin

    RegWrite_store = RegWrite;
    MemtoReg_store = MemtoReg;
    ReadData_store = ReadData;
    ALU_result_store = ALU_result;
    rd_store = rd;
end

endmodule // MEM_WB
