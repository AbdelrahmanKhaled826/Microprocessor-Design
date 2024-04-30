`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:09:44 11/17/2023
// Design Name:   memory_addres_register
// Module Name:   C:/example_verilog/SAP1/sap1/memory_addres_register_tb.v
// Project Name:  sap1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_addres_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_addres_register_tb;

	// Inputs
	reg clk;
	reg lm_n;
	reg [3:0] w_bus;

	// Outputs
	wire [3:0] ram_addres;

	// Instantiate the Unit Under Test (UUT)
	memory_addres_register uut (
		.clk(clk), 
		.lm_n(lm_n), 
		.w_bus(w_bus), 
		.ram_addres(ram_addres)
	);

	initial begin
	
		clk = 0;
		lm_n = 1;
		w_bus = 0;//out=xxxx
		#30
		lm_n=0; //out=0;
		#10
		w_bus = 4; //out 0100
	
		#10
		w_bus = 10; //out 1010
		#10
		w_bus = 15; //out 1111

		#10
		lm_n=1; //out=1111
		w_bus = 10;
		#10
		$stop;
		
		

	end
      
      always #5 clk=~clk;
endmodule

