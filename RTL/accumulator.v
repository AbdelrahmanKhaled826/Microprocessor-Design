`timescale 1ns / 1ps

// La -> low to load data from WBus
// Ea ~> high to put accumulator content ot WBus


/*
if la low -->put data from bus to accumlator
and if high put 0 in accumlator
if ea high--> put  accumlator to pus
if not put zzzzzzzz

*/


module accumulator(
input	wire					clk,
input	wire					la_n,
input	wire					ea,

//inoutwire	[7:0]			w_bus,
input	 wire	[7:0]			w_bus_in,
output wire	[7:0]			w_bus_out,
output wire	[7:0]			alu
    );

reg			[7:0]			accumulator_reg=8'b0000_0000;

always @(posedge clk)
begin
	if(la_n==1'b0)
		begin
			accumulator_reg<=w_bus_in;
		end
	else
		begin
			accumulator_reg<=accumulator_reg;
		end
		
		
end

assign w_bus_out = (ea==1'b1)?	accumulator_reg:8'bzzzzzzzz;

assign   alu     = accumulator_reg;
endmodule
