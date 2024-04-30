`timescale 1ns / 1ps


module sap_tb;

	// Inputs
	reg clk;
	reg clr_n;

	// Outputs
	wire [3:0] pc_out;
	wire [3:0] mar_out;
	wire [7:0] ram_out;
	wire [3:0] address_ir;
	wire [3:0] opcode_ir;
	wire [7:0] accumlator_out;
	wire [7:0] accumlator_bus;
	wire [7:0] alu_out;
	wire [7:0] regb_out;
	wire [7:0] output_register;

	// Instantiate the Unit Under Test (UUT)
	sap uut (
		.clk(clk), 
		.clr_n(clr_n), 
		.mar_out(mar_out), 
		.alu_out(alu_out), 
		.pc_out(pc_out), 
		.ram_out(ram_out),
		.address_ir(address_ir),
		.opcode_ir(opcode_ir),
		.accumlator_out(accumlator_out),
		.accumlator_bus(accumlator_bus),
		.regb_out(regb_out), 
		.output_register(output_register)
	);

initial begin
		// Initialize Inputs
		clk = 0;
		clr_n = 0;
		#100
		clr_n=1;
		
		#10000
		$stop;

	end
	
	
	
	
integer f;
always #10  	$fmonitor(f, "time=%5d, program_counter =%b", $time, pc_out);
always #10  	$fmonitor(f, "time=%5d, memory address register output =%b", $time, mar_out);
always #10 		$fmonitor(f, "time=%5d, ram output =%b", $time, ram_out);
always #10 		$fmonitor(f, "time=%5d, address =%b", $time, address_ir);
always #10 		$fmonitor(f, "time=%5d, op code =%b", $time, opcode_ir);
always #10 		$fmonitor(f, "time=%5d, accumlator_to alu =%b", $time, accumlator_out);
always #10 		$fmonitor(f, "time=%5d, accumlator_bus =%b", $time,accumlator_bus );
always #10 		$fmonitor(f, "time=%5d, alu_out 	=%b", $time, alu_out);
always #10 	  	$fmonitor(f, "time=%5d, regb_out =%b", $time, regb_out);
always #10 		$fmonitor(f, "time=%5d, output_register =%b", $time, output_register);

	
	
	initial begin
	f = $fopen("output.txt");
	
   # 10000
	$fclose(f);
	end	
  
   
	
	always #10 if(output_register)
	begin
	
	$fmonitor(f, "======================================================================================");

	end
	
  always #5 clk=~clk;    
  
endmodule

