`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 14:49:17
// Design Name: 
// Module Name: ALU
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

module ALU(input [15:0] A, B, input [2:0] ALUOp, output reg [15:0] result);
    always @(*)
    begin
        case(ALUOp)
            3'b000: result = A + B;     // ADD
            3'b001: result = A - B;     // SUB
            3'b010: result = A & B;     // AND
            3'b011: result = A | B;     // OR
            3'b100: result = A << B;    // LSL
            3'b101: result = A >> B;    // LSR
            default: result = 16'b0;
        endcase
    end
endmodule

