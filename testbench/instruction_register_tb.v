`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:38:27 11/18/2023
// Design Name:   instruction_register
// Module Name:   C:/example_verilog/SAP1/sap1/instruction_register_tb.v
// Project Name:  sap1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_register_tb;

	// Inputs
	reg clk;
	reg clr_n;
	reg li_n;
	reg ei_n;
	reg [7:0] w_bus;

	// Outputs
	wire [3:0] address;
	wire [3:0] op_code;

	// Instantiate the Unit Under Test (UUT)
	instruction_register uut (
		.clk(clk), 
		.clr_n(clr_n), 
		.li_n(li_n), 
		.ei_n(ei_n), 
		.w_bus(w_bus), 
		.address(address), 
		.op_code(op_code)
	);

	initial begin

		clk = 0;
		clr_n = 0;
		li_n = 0;
		ei_n = 0;
		w_bus = 8'b0101_1010; //data=0000  opcode=0000
		#10
		clr_n = 1;
		li_n = 1;
		ei_n = 1; //data=zzzz opcode=0000
		#10
		clr_n = 1;
		li_n = 0;
		ei_n = 1; //data=zzzz opcode=0101
		#10
		clr_n = 1;
		li_n = 0;
		ei_n = 0; //data=1010 opcode=0101
		#10
		clr_n = 1;
		li_n = 1;
		ei_n = 0; //data=0000 opcode=0000
		#10
		clr_n = 0;
		li_n = 0;
		ei_n = 0; //data=0000 opcode=0000
		#20
		$stop;

	end
      
     always #5 clk=~clk; 
      
endmodule

