`timescale 1ns / 1ps



module accumulator_tb;

	// Inputs
	reg clk;
	reg la_n;
	reg ea;
	reg [7:0] w_bus_in;
	// Outputs
	wire [7:0] alu;
	wire [7:0] w_bus_out;

	// Bidirs
//	wire [7:0] w_bus;

	// Instantiate the Unit Under Test (UUT)
	accumulator uut (
		.clk(clk), 
		.la_n(la_n), 
		.ea(ea), 
		.w_bus_in(w_bus_in), 
		.w_bus_out(w_bus_out), 
		.alu(alu)
	);

	initial begin
		// Initialize Inputs
		w_bus_in=8'b11000110;
		clk = 0;
		la_n = 0;
		ea = 0;
		//alu=z,w_bus=z
		#10
		ea=1; //w_bus=z
		#10
		la_n = 1; //w_bus=0,alu=0


	end
      always #5 clk=~clk;
endmodule

