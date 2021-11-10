`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Assignment Number: 7 [KGP-RISC]
// Module: Top Module
// Semester Number: 5
// Group Number: G1
// Group Members: Animesh Jha (19CS10070) and Nisarg Upadhyaya (19CS30031)
//////////////////////////////////////////////////////////////////////////////////

module KGP_RISC(
    input clk,
    input rst,
	output [31:0] retReg
    );

    // Wires
	wire [31:0] pc, pc_next;
	wire [31:0] instr;
	wire [1:0] branch;
	wire mem_read;
	wire mem_write;
	wire [1:0] mem_reg_pc;
	wire [2:0] alu_op;
	wire alu_source;
	wire [1:0] write_reg;
	wire [3:0] alu_control_signal;
	wire [31:0] alu_out, data_out;
	wire [31:0] write_data;
	wire [31:0] reg1Out;
	wire [31:0] reg2Out;
	wire [31:0] branch_address;
	wire [2:0] flags;
	wire [31:0] immediate;
	wire [31:0] alu_in2;
	wire [31:0] pc_ref;


	// sign extend instr[15:0] to 32 bits (immediate)
	assign immediate = { {16{instr[15]}}, instr[15:0] };

    // sign extend instr[20:6] to 32 bits (branch_address)
	assign branch_address= { {17{instr[20]}}, instr[20:6]};

    // alu 2nd input selector
	assign alu_in2 = alu_source ? reg2Out : immediate;

	mem_reg_pc_selector WDS (
		.mem_reg_pc(mem_reg_pc),
		.mem_in(data_out),
		.reg_in(alu_out),
		.pc_in(pc_ref),
		.write_data(write_data)
	);

	main_control MCU (
		.opcode(instr[31:26]), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.mem_reg_pc(mem_reg_pc), 
		.alu_op(alu_op), 
		.alu_source(alu_source), 
		.write_reg(write_reg)
	);
	
	data_memory DM (
		.address(alu_out),
		.clk(clk),
		.enable(mem_read),
		.write_enable(mem_write),
		.write_data(reg2Out),
		.data_out(data_out)
	);

	instruction_fetcher IF (
		.pc(pc_next), 
		.clk(clk), 
		.instr(instr)
	);

	program_counter PC (
		.pc_in(pc_next),
		.pc_out(pc),
		.clk(clk),
		.rst(rst)
	);

	alu_control ACU (
		.alu_op(alu_op), 
		.func_code(instr[5:0]), 
		.alu_control_signal(alu_control_signal)
	);

	alu ALU (
		.input1(reg1Out), 
		.input2(alu_in2), 
		.shamt(instr[10:6]), 
		.control(alu_control_signal), 
		.out(alu_out), 
		.flags(flags)
	);
	
	branching_mechanism BM (
		.pc_in(pc),
		.dest_addr(branch_address), 
		.reg1(reg1Out),
		.branch_control_signal(branch),
		.ins_func_code(instr[5:0]),
		.alu_flag(flags),
		.rst(rst),
		.clk(clk),
		.pc_out(pc_next),
		.ref(pc_ref)
	);
	
	register_file RF (
		.reg1Addr(instr[25:21]), 
		.reg2Addr(instr[20:16]), 
		.writeReg(write_reg), 
		.writeData(write_data), 
		.reg1Out(reg1Out), 
		.reg2Out(reg2Out), 
		.clk(clk), 
		.rst(rst),
		.retReg(retReg)
	);


endmodule
