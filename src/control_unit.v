`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 20:43:20
// Design Name: 
// Module Name: control_unit
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


module control_unit(

    input [3:0] opcode,

    output reg reg_write,
    output reg jump,
    output reg [2:0] alu_sel,
    output reg movi

);

always @(*)
begin

    reg_write = 0;
    jump      = 0;
    movi      = 0;
    alu_sel   = 3'b000;

    case(opcode)

        4'b0000:
        begin
            reg_write = 1;
            movi      = 1;
        end

        4'b0001:
        begin
            reg_write = 1;
            alu_sel = 3'b000;
        end

        4'b0010:
        begin
            reg_write = 1;
            alu_sel = 3'b001;
        end

        4'b0011:
        begin
            reg_write = 1;
            alu_sel = 3'b010;
        end

        4'b0100:
        begin
            reg_write = 1;
            alu_sel = 3'b011;
        end

        4'b0101:
        begin
            reg_write = 1;
            alu_sel = 3'b100;
        end

        4'b0110:
        begin
            jump = 1;
        end

    endcase

end

endmodule