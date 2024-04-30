# Microprocessor-Design
Simple as Possible (SAP) computers in general were designed to introduce beginners to some of the crucial ideas behind computer operations. SAP computers are classified into stages, each stage more evolved and considering more advanced concepts in computer architecture than the previous. 
The SAP-1 computer is the first stage in this evolution. Its primary purpose is to develop a basic understanding of how a computer works, interacts with memory and other parts of the system like input and output. The instruction set is very limited and is simple. 
> ## !The features in sap-1 computer are :
```
• W bus 8 bit. 
• 16 bytes memory. 
• Registers - are accumulator and B-register each of 8 bits. 
• Program counter. 
• Memory Address Register. 
• Adder/Subtracter. 
• Control Unit 
• Simple Output
```
> ## simulation:
the figure below shows the RTL simulation results for the sap1 when clear is low. 
![image](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/assets/66374409/8dc745a4-1449-4a8d-98a3-8edd1e61a16d)

And when clear is high. Output is 10100011 which is in accumulator and  appear at opcode 1110 .  

![image](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/assets/66374409/b0b98374-8de7-4be5-b19f-db7ab81c85d5)


When pc =0000 which pointer to the first location in ram and the out of ram is 0000101, The instruction register divide it to op code=0000 which indicate to load the data from  ram to accumulator. 

 ![image](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/assets/66374409/cef7bd48-e236-4b8b-a949-95e2e750a90a)

When pc =0001 which pointer to the second location in ram and the out of ram is 00011010, The instruction register divide it to op code=0001 which indicate to add. So the data at location 1010 load to reg b and added with accumulator data in alu and then store output in accumulator  
![image](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/assets/66374409/83a96c82-84a6-4077-9f50-99ab8509fda7)
When  pc =0010 which pointer to the third location in ram and the out of ram is 0010_1100, The instruction register divide it to op code=0010 which indicate to sub. So the data at location 1100 load to reg b and subtract with accumulator data in alu and then  store output in accumulator  
 ![image](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/assets/66374409/791d18db-3bcb-4720-b86c-17826beed7e8)

When  pc =0011 which pointer to the fourth location in ram and the out of ram is 1110_xxxx, The instruction register divide it to op code=1110 which indicate to output. So the data at  accumulator will be go to output register.

![image](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/assets/66374409/022d6c64-b420-4f1f-b082-51263917240d)

> [!TIP]
> #### In this project, we implement a SAP-1 computer using Verilog , write a testbench for each block  and check functionality of the design ,also analysis the timing  reports  and get the netlist viewer .

> [!NOTE]
> > #### the presentation amd decomentation in [documentation](https://github.com/AbdelrahmanKhaled826/Microprocessor-Design/tree/master/)
