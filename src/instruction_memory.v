`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 20:41:49
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(

    input [3:0] addr,
    output reg [7:0] instruction

);

always @(*)
begin

    case(addr)

        4'd0: instruction = 8'b00000011; // MOVI R0,3

        4'd1: instruction = 8'b00000110; // MOVI R1,2

        4'd2: instruction = 8'b00010001; // ADD

        4'd3: instruction = 8'b00100001; // SUB

        4'd4: instruction = 8'b00110001; // AND

        4'd5: instruction = 8'b01000001; // OR

        4'd6: instruction = 8'b01010001; // XOR

        4'd7: instruction = 8'b01100000; // JMP

        default:
              instruction = 8'b00000000;

    endcase

end

endmodule
