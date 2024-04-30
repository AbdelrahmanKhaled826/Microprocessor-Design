`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:59:28 11/17/2023
// Design Name:   program_counter
// Module Name:   C:/example_verilog/SAP1/sap1/program_counter_tb.v
// Project Name:  sap1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: program_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module program_counter_tb;

	// Inputs
	reg clk_n;
	reg cp;
	reg ep;
	reg clr_n;

	// Outputs
	wire [3:0] w_bus;

	// Instantiate the Unit Under Test (UUT)
	program_counter uut (
		.clk_n(clk_n), 
		.cp(cp), 
		.ep(ep), 
		.clr_n(clr_n), 
		.w_bus(w_bus)
	);

	initial begin
		clk_n = 0;
		cp = 0;
		ep = 0;
		clr_n = 0;
		
		#30
		clr_n = 1;
		
		#10
		
		cp=1;
		
		#10
		
		ep=1;  //out must be 0010
		
		#5
		clr_n = 0; //out =0000
		#10
		clr_n = 1;
		
		#160  
		
		$stop;

	end
     
     
 always #5 clk_n=~clk_n;
endmodule

