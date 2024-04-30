`timescale 1ns / 1ps



module adder_subtractor_tb;

	// Inputs
	reg su;
	reg eu;
	reg [7:0] accumlator_out;
	reg [7:0] register_b_out;

	// Outputs
	wire [7:0] w_bus;

	// Instantiate the Unit Under Test (UUT)
	adder_subtractor uut (
		.su(su), 
		.eu(eu), 
		.accumlator_out(accumlator_out), 
		.register_b_out(register_b_out), 
		.w_bus(w_bus)
	);

	initial begin
		// Initialize Inputs
		su = 0;
		eu = 0;
		accumlator_out = 5;
		register_b_out = 5; //out=zz
		#5
		eu=1;//out=10
		#5
		su=1;//out=0
		#5
		accumlator_out = 10;
		register_b_out = 5; //out=5
		#5
		accumlator_out = 5;
		register_b_out = 10; //out=-5( 11111011)
	end
      
endmodule

