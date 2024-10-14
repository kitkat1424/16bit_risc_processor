`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 14:54:27
// Design Name: 
// Module Name: RISC_processor
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

module RISC_Processor(
    input clk, reset
);

    // Wires connecting different components
    wire [15:0] pc_in, pc_out, instruction, readData1, readData2, alu_result;
    wire reg_write, alu_src, mem_to_reg, mem_read, mem_write, beq, bne, jump;
    wire [1:0] alu_op;
    wire [2:0] ALUOp;

    // Program Counter
    ProgramCounter pc(
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Instruction Memory
    InstructionMemory im(
        .addr(pc_out),
        .instruction(instruction)
    );

    // Control Unit
    ControlUnit cu(
        .opcode(instruction[15:12]),
        .alu_op(alu_op),
        .jump(jump),
        .beq(beq),
        .bne(bne),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .reg_dst(reg_dst),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write)
    );

    // Register File
    RegisterFile rf(
        .clk(clk),
        .regWrite(reg_write),
        .readReg1(instruction[11:8]),
        .readReg2(instruction[7:4]),
        .writeReg(instruction[3:0]),
        .writeData(alu_result),
        .readData1(readData1),
        .readData2(readData2)
    );

    // ALU
    ALU alu(
        .A(readData1),
        .B(alu_src ? instruction[7:0] : readData2),
        .ALUOp(ALUOp),
        .result(alu_result)
    );

    // PC Increment
    assign pc_in = pc_out + 1;

endmodule
