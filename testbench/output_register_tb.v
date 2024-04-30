`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:22:26 11/21/2023
// Design Name:   output_register
// Module Name:   C:/example_verilog/SAP1/sap1/output_register_tb.v
// Project Name:  sap1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: output_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module output_register_tb;

	// Inputs
	reg clk;
	reg lo_n;
	reg [7:0] w_bus;

	// Outputs
	wire [7:0] binary_display;

	// Instantiate the Unit Under Test (UUT)
	output_register uut (
		.clk(clk), 
		.lo_n(lo_n), 
		.w_bus(w_bus), 
		.binary_display(binary_display)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		lo_n = 0;
		w_bus = 10;
		//binary_display=0
		#20
		lo_n = 0;
		//binary_display=10
		#20
		$stop;


	end
      always #5 clk=~clk;
      
endmodule

