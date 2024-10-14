`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2024 14:53:45
// Design Name: 
// Module Name: ControlUnit
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

module ControlUnit(
    input [3:0] opcode,
    output reg [1:0] alu_op,
    output reg jump, beq, bne, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, reg_write
);

    always @(*) begin
        case (opcode)
            4'b0000:  // LW (Load Word)
            begin
                reg_dst = 1'b0;
                alu_src = 1'b1;
                mem_to_reg = 1'b1;
                reg_write = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b10;
                jump = 1'b0;
            end

            4'b0001:  // SW (Store Word)
            begin
                reg_dst = 1'b0;
                alu_src = 1'b1;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b10;
                jump = 1'b0;
            end

             4'b0010:  // ADD
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b0011:  // SUB
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b0100:  // INV (Invert)
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b0101:  // LSL (Logical Shift Left)
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b0110:  // LSR (Logical Shift Right)
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b0111:  // AND
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b1000:  // OR
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b1001:  // SLT (Set on Less Than)
           begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;   
           end
            
             4'b1011:  // BEQ (Branch on Equal)
           begin
                reg_dst = 1'b0;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b1;
                bne = 1'b0;
                alu_op = 2'b01;
                jump = 1'b0;   
           end
            
             4'b1100:  // BNE (Branch on Not Equal)
           begin
                reg_dst = 1'b0;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b1;
                alu_op = 2'b01;
                jump = 1'b0;   
           end
            
             4'b1101:  // J (Jump)
           begin
                reg_dst = 1'b0;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b1;   
           end
            
            default:  // Default case
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        endcase
    end

endmodule

