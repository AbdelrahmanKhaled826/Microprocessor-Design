`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:21:26 11/18/2023
// Design Name:   ram
// Module Name:   C:/example_verilog/SAP1/sap1/ram_tb.v
// Project Name:  sap1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram_tb;

	// Inputs
	reg ce_n;
	reg [3:0] address;

	// Outputs
	wire [7:0] w_bus;

	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.ce_n(ce_n), 
		.address(address), 
		.w_bus(w_bus)
	);

	initial begin
		
		ce_n = 1;
		address = 0; //out=zzzz_zzzz;
		#5
		ce_n=0;	//out=0000_01111;
		#5
		address = 10; //out=xxxx_xxxx;
		#5
		address = 6; //out=0010_1010;

	end
      
endmodule

