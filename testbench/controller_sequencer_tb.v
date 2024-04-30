`timescale 1ns / 1ps


module controller_sequencer_tb;

	// Inputs
	reg clk;
	reg clr_n;
	reg [3:0] op_code;

	// Outputs
	wire cp;
	wire ep;
	wire lm_n;
	wire ce_n;
	wire li_n;
	wire ei_n;
	wire la_n;
	wire ea;
	wire su;
	wire eu;
	wire lb_n;
	wire lo_n;
	wire hlt_n;
	wire [5:0] state;

	// Instantiate the Unit Under Test (UUT)
	controller_sequencer uut (
		.clk(clk), 
		.clr_n(clr_n), 
		.op_code(op_code), 
		.cp(cp), 
		.ep(ep), 
		.lm_n(lm_n), 
		.ce_n(ce_n), 
		.li_n(li_n), 
		.ei_n(ei_n), 
		.la_n(la_n), 
		.ea(ea), 
		.su(su), 
		.eu(eu), 
		.lb_n(lb_n), 
		.lo_n(lo_n), 
		.hlt_n(hlt_n), 
		.state(state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr_n = 0;
		op_code = 0;
		
		#40
		clr_n=1;
		#50
		$stop;
	
		#50
		op_code = 1;
		
		
		#50
		op_code = 2;
		
		
		#50
		op_code = 14;
		
		
		#50
		op_code = 15;
		
		#100
		$stop;

	end
     always #5 clk=~clk; 
endmodule

