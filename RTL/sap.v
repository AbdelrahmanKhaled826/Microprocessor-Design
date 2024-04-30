
`timescale 1ns / 1ps
 
module sap(
input	wire					clk,
input	wire					clr_n,
output wire  	[3:0] 	pc_out,
output wire 	[3:0] 	mar_out,
output wire		[7:0] 	ram_out,
output wire  	[3:0] 	address_ir,
output wire  	[3:0] 	opcode_ir,
output wire 	[7:0] 	accumlator_out,
output wire 	[7:0] 	accumlator_bus,
output wire 	[7:0] 	regb_out,
output wire		[7:0] 		alu_out,  
output wire		[7:0]	output_register
    );
    
//==========================================signal ================    
wire 	[3:0] 		mar_to_ram;
wire 	[7:0] 		ram_out_wire;
wire 	[7:0] 		acc_to_alu;
wire 	[7:0] 		regb_to_alu;  
wire	[7:0]		output_bus;
wire	[3:0]		op_code;
wire 	[3:0] 		address_ir_wire;
wire 	[3:0]  	pc_out_wire;
wire			cp;
wire			ep;
wire			lm_n;
wire			ce_n;
wire			li_n;
wire			ei_n;
wire			la_n;
wire			ea;
wire			su;
wire			eu;
wire			lb_n;
wire			lo_n;
wire			hlt_n;
wire	[5:0]		state;

    
    
    
  //============================================cs========
     
controller_sequencer C_S(
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
    
//=====================================pc==========    
reg[3:0] pc_or_ir_reg;
wire [3:0] pc_or_ir;
always @(*) begin
	if(ep==1'b1) begin  pc_or_ir_reg <= pc_out_wire;  end
	else if(ei_n==1'b0) begin  pc_or_ir_reg <= address_ir_wire;  end
	else begin  pc_or_ir_reg <= 4'bzzzz ;end
end   
    
assign pc_or_ir=pc_or_ir_reg;
    
  
    
 program_counter PC(
.clk_n(clk),
.cp(cp),
.ep(ep),
.clr_n(clr_n),
.w_bus(pc_out_wire)
    );
   //=======================================mar============= 
    
 memory_addres_register MAR(
.clk(clk),
.lm_n(lm_n),  
.w_bus(pc_or_ir),
.ram_addres(mar_to_ram)
    );
//=============================================ram===============


ram RAM(
.ce_n(ce_n),
.address(mar_to_ram),	
.w_bus(ram_out_wire)
    );

//===========================================ir==================

instruction_register ir(
.clk(clk),
.clr_n(clr_n),
.li_n(li_n),
.ei_n(ei_n),
.w_bus(ram_out_wire),
.address(address_ir_wire),
.op_code(op_code)
    );

//====================================accumlator==============
wire 	[7:0]	 	alu_out_wire;
reg	[7:0] 		w_bus_in_acc_reg;
wire 	[7:0] 		w_bus_in_acc;
wire  [7:0]		acc_bus;
always @(*) begin
	if(eu==1'b1) begin  w_bus_in_acc_reg <= alu_out_wire;  end
	else if(ce_n==1'b0) begin  w_bus_in_acc_reg <=ram_out_wire ;  end
	else begin  w_bus_in_acc_reg <= 8'bzzzzzzzz ;end
end   
    
    
assign w_bus_in_acc=w_bus_in_acc_reg;
    
    


accumulator ACC(
.clk(clk),
.la_n(la_n),
.ea(ea),
.w_bus_in(w_bus_in_acc),
.w_bus_out(acc_bus),
.alu(acc_to_alu)
    );
    
 //=========================================regb==============   
    
    
 register_b  REGB(
 .clk(clk),
. lb_n(lb_n),
.w_bus(ram_out_wire),
.alu(regb_to_alu)
    );   
    
    //=====================================alu================
  adder_subtractor ALU(
.su(su),
.eu(eu),
.accumlator_out(acc_to_alu),
.register_b_out(regb_to_alu),
.w_bus(alu_out_wire) //will go to output register
    );
    
    
 output_register  OUTREG(
.clk(clk),
.lo_n(lo_n),
.w_bus(acc_bus),
.binary_display(output_bus)
    );
    
   
    
    
assign pc_out=pc_out_wire;
assign mar_out=mar_to_ram;
assign ram_out=ram_out_wire;
assign address_ir=address_ir_wire;
assign opcode_ir=op_code;
assign accumlator_out=acc_to_alu;
assign accumlator_bus=acc_bus;
assign alu_out=alu_out_wire;
assign regb_out=regb_to_alu;
assign output_register=output_bus;   
    
    
endmodule





