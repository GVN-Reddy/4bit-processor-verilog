`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 20:17:39
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] A,
    input [3:0] B,
    input [2:0] ALU_Sel,

    output reg [3:0] ALU_Out,
    output Zero,
    output reg Carry
);

always @(*)
begin
    Carry = 0;

    case(ALU_Sel)

        3'b000:
        begin
            {Carry,ALU_Out} = A + B;
        end

        3'b001:
        begin
            {Carry,ALU_Out} = A - B;
        end

        3'b010:
        begin
            ALU_Out = A & B;
        end

        3'b011:
        begin
            ALU_Out = A | B;
        end

        3'b100:
        begin
            ALU_Out = A ^ B;
        end

        3'b101:
        begin
            ALU_Out = ~A;
        end

        default:
        begin
            ALU_Out = 4'b0000;
        end

    endcase
end

assign Zero = (ALU_Out == 4'b0000);

endmodule
