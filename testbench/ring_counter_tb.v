`timescale 1ns / 1ps



module ring_counter_tb;

	// Inputs
	reg clk;
	reg clr_n;

	// Outputs
	wire [5:0] state;

	// Instantiate the Unit Under Test (UUT)
	ring_counter uut (
		.clk(clk), 
		.clr_n(clr_n), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr_n = 0;
		// Wait 100 ns for global reset to finish
		#100;
		clr_n=1;
		#1000
		$stop;
        
		// Add stimulus here

	end
      
     always #5 clk=~clk; 
endmodule




/*
module ring_counter_tb;

	// Inputs
	reg clk;
	reg clr_n;

	// Outputs
	wire [4:0] state;

	// Instantiate the Unit Under Test (UUT)
	ring_counter uut (
		.clk(clk), 
		.clr_n(clr_n), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr_n = 0;
		// Wait 100 ns for global reset to finish
		#100;
		clr_n=1;
		#1000
		$stop;
        
		// Add stimulus here

	end
      
     always #5 clk=~clk; 
endmodule
*/