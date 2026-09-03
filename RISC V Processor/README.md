## How does the single cycle RISC V processor work in verilog?
The procesor consists of various modules integrated together to carry out different operations which are defined by a 32-bit binary instruction. These instructions are described by the RISC V Instructuction Set Architecture with different parts of those 32-bits pertaining to different things.

The whole process of executing a full instruction is divided into 5 stages namely-
- Instruction Fetch:- Process of getting the next instruction from the instruction memory. This stage might also update the program counter if the next value of program counter is the next instruction in instruction memory.

- Instruction Decode:- Defined as separating the various components of the instruction and alotting them where they are needed(register file, control signals, ALU, etc).

- Execute:- This stage involves the ALU calculating anything that it's sent from register file, immediate generator or control signals.

- Memory Access:- This stage comes in play when we need to STORE or LOAD something from the data memory. This is also often the longest stage in the whole single-cycle architecture.

- Write-Back:- Writing back to the register files the values from ALU / data memory.

## Modules of the single cycle RISC V processor
- Program Counter:-

- Control Logic:- 

- Instruction memory:- 

- Register file:- 

- Immediate Generator:- 

- Branch Comparator:-

- ALU:-

- Data memory:- 

and basic digital components like MUXes, decoders, etc.