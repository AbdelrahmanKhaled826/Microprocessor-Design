`timescale 1ns / 1ps


/**
* Control Unit (CU)
*
* CLK    = Clock
* CLR_n   = Clear (inversed)
* state  = T-State from RC
* opcode = From IR
*
* Control Signals:
* Cp     = Increment PC
* Ep     = Enable PC ouput to WBUS (1 = Enable)
* lm_n    = load in memory address register(0 = load)
* ce_n  = Enable output of RAM data to WBUS (0 = enable)
* Li_n    = Load Instruction Register from WBUS (0 = load)
* Ei_n    = Enable ouput of address from Instruction Register to lower 4 bits of WBUS (0 = enable)
* La_n    = Load data into the accumulator from WBUS (0 = load)
* Ea     = put ouput of accumulator to WBUS (1 = enable)
* Su     = ALU operation (0 = Add, 1 = Subtract)
* Eu     = Enable output of ALU to WBUS (1 = enable)
* Lb_n    = Load data into Register B from WBUS (0 = load)
* Lo_n    = Load data into Output Register (0 = load)
* enio   = Enable output from Input Register (1 = enable)
* HLT_n   = Inverse Halt operation. (0 = HALT)
*/



module controller_sequencer(
input	wire				clk,
input	wire				clr_n,
input	wire	[3:0]		op_code,


output reg				cp,
output reg				ep,
output reg				lm_n,
output reg				ce_n,
output reg				li_n,
output reg				ei_n,
output reg				la_n,
output reg				ea,
output reg				su,
output reg				eu,
output reg				lb_n,
output reg				lo_n,
output reg				hlt_n,
output wire	[5:0]		state

    );
    
ring_counter rc(
.clk(clk),
.clr_n(clr_n),
.state(state)
);

parameter 	T1=6'b000001;
parameter 	T2=6'b000010;
parameter 	T3=6'b000100;
parameter 	T4=6'b001000;
parameter 	T5=6'b010000;
parameter 	T6=6'b100000;

initial
begin
	cp=1'b0;
	ep=1'b0;
	lm_n=1'b1;
	ce_n=1'b1;
	li_n=1'b1;
	ei_n=1'b1;
	la_n=1'b1;
	ea=1'b0;
	su=1'b0;
	eu=1'b0;
	lb_n=1'b1;
	lo_n=1'b1;
	hlt_n=1'b1;
end

always @(posedge clk)
begin
	if(clr_n==1'b0)
		begin
			cp=1'b0;
			ep=1'b0;
			lm_n=1'b1;
			ce_n=1'b1;
			li_n=1'b1;
			ei_n=1'b1;
			la_n=1'b1;
			ea=1'b0;
			su=1'b0;
			eu=1'b0;
			lb_n=1'b1;
			lo_n=1'b1;
			hlt_n=1'b1;
		end
	else
		begin
			case(state)
				T1:
					begin
						ep=1;
						lm_n=0;
						
						cp=1'b0;
						//ep=1'b0;
						//lm_n=1'b1;
						ce_n=1'b1;
						li_n=1'b1;
						ei_n=1'b1;
						la_n=1'b1;
						ea=1'b0;
						su=1'b0;
						eu=1'b0;
						lb_n=1'b1;
						lo_n=1'b1;
						hlt_n=1'b1;
					end
					
				T2:
					begin
						cp=1;
												
						//cp=1'b0;
						ep=1'b0;
						lm_n=1'b1;
						ce_n=1'b1;
						li_n=1'b1;
						ei_n=1'b1;
						la_n=1'b1;
						ea=1'b0;
						su=1'b0;
						eu=1'b0;
						lb_n=1'b1;
						lo_n=1'b1;
						hlt_n=1'b1;
						
					end	
				
				T3:
					begin
						ce_n=0;
						li_n=0;
												
						cp=1'b0;
						ep=1'b0;
						lm_n=1'b1;
						//ce_n=1'b1;
						//li_n=1'b1;
						ei_n=1'b1;
						la_n=1'b1;
						ea=1'b0;
						su=1'b0;
						eu=1'b0;
						lb_n=1'b1;
						lo_n=1'b1;
						hlt_n=1'b1;
					
					end
					
				T4:
					begin
						case(op_code)
							4'b0000://LDA
									begin
										ei_n=0;
										lm_n=0;
										//lo_n=1'b0;	
		
		
										cp=1'b0;
										ep=1'b0;
										//lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										//ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
										
										
									end
							4'b0001://ADD
									begin
										ei_n=0;
										lm_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										//lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										//ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0010://SUB
									begin
										ei_n=0;
										lm_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										//lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										//ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1110://OUT
									begin
										lo_n=0;
										ea=1;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										//ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										//lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1111://HLT
									begin
										hlt_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										//hlt_n=1'b1;
									end		
						endcase
					end	
				T5:
					begin
						case(op_code)
							4'b0000://LDA
									begin
										la_n=0;
										ce_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										//ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										//la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0001://ADD
									begin
										lb_n=0;
										ce_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										//ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										//lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0010://SUB
									begin
										lb_n=0;
										ce_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										//ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										//lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1110://OUT
									begin
										//nop
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1111://HLT
									begin
										//nop
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end		
						endcase
					end
				T6:
					begin
						case(op_code)
							4'b0000://LDA
									begin
										//nop
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0001://ADD
									begin
										la_n=0;
										eu=1;
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										//la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										//eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0010://SUB
									begin
										la_n=0;
										eu=1;
										su=1;
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										//la_n=1'b1;
										ea=1'b0;
										//su=1'b0;
										//eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1110://OUT
									begin
										//nop
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1111://HLT
									begin
										//nop
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end		
						endcase
					end
			endcase	
		
		end
	
end


endmodule


/*
//==========================work for 5 clock cycle====================


module controller_sequencer(
input	wire				clk,
input	wire				clr_n,
input	wire	[3:0]		op_code,


output reg				cp,
output reg				ep,
output reg				lm_n,
output reg				ce_n,
output reg				li_n,
output reg				ei_n,
output reg				la_n,
output reg				ea,
output reg				su,
output reg				eu,
output reg				lb_n,
output reg				lo_n,
output reg				hlt_n,
output wire	[4:0]		state

    );
    
ring_counter rc(
.clk(clk),
.clr_n(clr_n),
.state(state)
);

parameter 	T1=5'b00001;
parameter 	T2=5'b00010;
parameter 	T3=5'b00100;
parameter 	T4=5'b01000;
parameter 	T5=5'b10000;
//parameter 	T6=6'b100000;

initial
begin
	cp=1'b0;
	ep=1'b0;
	lm_n=1'b1;
	ce_n=1'b1;
	li_n=1'b1;
	ei_n=1'b1;
	la_n=1'b1;
	ea=1'b0;
	su=1'b0;
	eu=1'b0;
	lb_n=1'b1;
	lo_n=1'b1;
	hlt_n=1'b1;
end

always @(posedge clk)
begin
	if(clr_n==1'b0)
		begin
			cp=1'b0;
			ep=1'b0;
			lm_n=1'b1;
			ce_n=1'b1;
			li_n=1'b1;
			ei_n=1'b1;
			la_n=1'b1;
			ea=1'b0;
			su=1'b0;
			eu=1'b0;
			lb_n=1'b1;
			lo_n=1'b1;
			hlt_n=1'b1;
		end
	else
		begin
			case(state)
				T1:
					begin
						ep=1;
						lm_n=0;
						cp=1;
						//cp=1'b0;
						//ep=1'b0;
						//lm_n=1'b1;
						ce_n=1'b1;
						li_n=1'b1;
						ei_n=1'b1;
						la_n=1'b1;
						ea=1'b0;
						su=1'b0;
						eu=1'b0;
						lb_n=1'b1;
						lo_n=1'b1;
						hlt_n=1'b1;
					end
					
				T2:
					begin
						//cp=1;
						ce_n=0;
						li_n=0;					
						cp=1'b0;
						ep=1'b0;
						lm_n=1'b1;
						//ce_n=1'b1;
						//li_n=1'b1;
						ei_n=1'b1;
						la_n=1'b1;
						ea=1'b0;
						su=1'b0;
						eu=1'b0;
						lb_n=1'b1;
						lo_n=1'b1;
						hlt_n=1'b1;
						
					end	
					
				T3:
					begin
						case(op_code)
							4'b0000://LDA
									begin
										ei_n=0;
										lm_n=0;
										//lo_n=1'b0;	
		
		
										cp=1'b0;
										ep=1'b0;
										//lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										//ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
										
										
									end
							4'b0001://ADD
									begin
										ei_n=0;
										lm_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										//lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										//ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0010://SUB
									begin
										ei_n=0;
										lm_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										//lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										//ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1110://OUT
									begin
										lo_n=0;
										ea=1;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										//ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										//lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1111://HLT
									begin
										hlt_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										//hlt_n=1'b1;
									end		
						endcase
					end	
				T4:
					begin
						case(op_code)
							4'b0000://LDA
									begin
										la_n=0;
										ce_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										//ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										//la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0001://ADD
									begin
										lb_n=0;
										ce_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										//ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										//lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0010://SUB
									begin
										lb_n=0;
										ce_n=0;
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										//ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										//lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1110://OUT
									begin
										//nop
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1111://HLT
									begin
										//nop
																														
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end		
						endcase
					end
				T5:
					begin
						case(op_code)
							4'b0000://LDA
									begin
										//nop
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0001://ADD
									begin
										la_n=0;
										eu=1;
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										//la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										//eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b0010://SUB
									begin
										la_n=0;
										eu=1;
										su=1;
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										//la_n=1'b1;
										ea=1'b0;
										//su=1'b0;
										//eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1110://OUT
									begin
										//nop
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end
							4'b1111://HLT
									begin
										//nop
																																								
										cp=1'b0;
										ep=1'b0;
										lm_n=1'b1;
										ce_n=1'b1;
										li_n=1'b1;
										ei_n=1'b1;
										la_n=1'b1;
										ea=1'b0;
										su=1'b0;
										eu=1'b0;
										lb_n=1'b1;
										lo_n=1'b1;
										hlt_n=1'b1;
									end		
						endcase
					end
			endcase	
		
		end
	
end


endmodule


*/
