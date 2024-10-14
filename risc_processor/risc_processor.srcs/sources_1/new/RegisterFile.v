`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 14:46:24
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile(
    input clk, regWrite, 
    input [3:0] readReg1, readReg2, writeReg, 
    input [15:0] writeData, 
    output [15:0] readData1, readData2
);
    reg [15:0] registers[0:15];  // 16 registers

    assign readData1 = registers[readReg1];
    assign readData2 = registers[readReg2];

    always @(posedge clk)
    begin
        if (regWrite)
            registers[writeReg] <= writeData;
    end
endmodule

