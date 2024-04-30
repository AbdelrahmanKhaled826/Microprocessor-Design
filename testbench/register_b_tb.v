`timescale 1ns / 1ps



module register_b_tb;

	// Inputs
	reg clk;
	reg lb_n;
	reg [7:0] w_bus;

	// Outputs
	wire [7:0] alu;

	// Instantiate the Unit Under Test (UUT)
	register_b uut (
		.clk(clk), 
		.lb_n(lb_n), 
		.w_bus(w_bus), 
		.alu(alu)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		lb_n = 1;
		w_bus = 10;
		//alu=0
		#20
		lb_n = 0;
		//alu=10
		#20
		$stop;


	end
      always #5 clk=~clk;
endmodule

