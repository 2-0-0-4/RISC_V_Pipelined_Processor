`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 19:30:17
// Design Name: 
// Module Name: ID_EX_new
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


module ID_EX_new(
    input clk, Flush,
    input [63:0] PC_addr,
    input [63:0] read_data1, read_data2,
    input [63:0] imm_val,
    input [3:0] funct_in,
    input [4:0] rd_in, rs1_in, rs2_in,
    input MemtoReg, RegWrite,
    input Branch, MemWrite, MemRead,
    input ALUSrc,
    input [1:0] ALU_op,

    output reg [63:0] PC_addr_store,
    output reg [63:0] read_data1_store, read_data2_store,
    output reg [63:0] imm_val_store,
    output reg [3:0] funct_in_store,
    output reg [4:0] rd_in_store, rs1_in_store, rs2_in_store,
    output reg MemtoReg_store, RegWrite_store,
    output reg Branch_store, MemWrite_store, MemRead_store,
    output reg ALUSrc_store,
    output reg [1:0] ALU_op_store

);

always @(posedge clk) begin
    if (Flush) begin //Piepeline Register is cleared
    PC_addr_store = 0;
    read_data1_store = 0;
    read_data2_store = 0;
    imm_val_store = 0;
    funct_in_store = 0;
    rd_in_store = 0;
    rs1_in_store = 0;
    rs2_in_store = 0;
    RegWrite_store = 0;
    MemtoReg_store = 0;
    Branch_store = 0;
    MemWrite_store = 0;
    MemRead_store = 0;
    ALUSrc_store = 0;
    ALU_op_store = 0;
    end 
    else begin
    //the data from ID is transferred to pipeline register
    PC_addr_store = PC_addr;
    read_data1_store = read_data1;
    read_data2_store = read_data2;
    imm_val_store = imm_val;
    funct_in_store = funct_in;
    rd_in_store = rd_in;
    rs1_in_store = rs1_in;
    rs2_in_store = rs2_in;
    RegWrite_store = RegWrite;
    MemtoReg_store = MemtoReg;
    Branch_store = Branch;
    MemWrite_store = MemWrite;
    MemRead_store = MemRead;
    ALUSrc_store = ALUSrc;
    ALU_op_store = ALU_op;
    end
end

endmodule
