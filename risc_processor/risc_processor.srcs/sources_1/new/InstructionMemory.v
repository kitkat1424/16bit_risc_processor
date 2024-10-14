`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 14:36:32
// Design Name: 
// Module Name: instruction_mem
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
`timescale 1ns / 1ps

module InstructionMemory(
    input [15:0] addr, 
    output reg [15:0] instruction
);
    reg [15:0] memory[0:255];  // 256 memory locations

    initial begin
        $readmemb("program.txt", memory); // Load instructions from an external file
    end

    always @(*)
    begin
        instruction = memory[addr];
    end
endmodule
