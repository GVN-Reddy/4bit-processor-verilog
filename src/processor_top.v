`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 20:57:12
// Design Name: 
// Module Name: processor_top
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


module processor_top(

    input clk,
    input rst

);
wire movi;
wire [3:0] write_data;
wire [3:0] pc;
wire [7:0] instruction;

wire reg_write;
wire jump;
assign jump = 1'b0;

wire [2:0] alu_sel;

wire [3:0] reg_data1;
wire [3:0] reg_data2;

wire [3:0] alu_out;

wire zero;
wire carry;

wire [3:0] r0;
wire [3:0] r1;
wire [3:0] r2;
wire [3:0] r3;



assign write_data =
        (movi) ?
        {2'b00,instruction[1:0]}
        :
        alu_out;

program_counter PC(

    .clk(clk),
    .rst(rst),
    .jump(jump),
    .jump_addr(4'b0000),
    .pc(pc)

);

instruction_memory IM(

    .addr(pc),
    .instruction(instruction)

);

control_unit CU(

    .opcode(instruction[7:4]),

    .reg_write(reg_write),
    .jump(jump),
    .alu_sel(alu_sel),
    .movi(movi)

);

register_file RF(

    .clk(clk),
    .rst(rst),

    .we(reg_write),

    .write_addr(instruction[3:2]),
    .write_data(write_data),

    .read_addr1(instruction[3:2]),
    .read_addr2(instruction[1:0]),

    .read_data1(reg_data1),
    .read_data2(reg_data2),

    .r0(r0),
    .r1(r1),
    .r2(r2),
    .r3(r3)

);

alu ALU(

    .A(reg_data1),
    .B(reg_data2),

    .ALU_Sel(alu_sel),

    .ALU_Out(alu_out),
    .Zero(zero),
    .Carry(carry)

);

endmodule