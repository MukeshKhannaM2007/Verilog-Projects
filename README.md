Verilog Projects
A collection of digital design implementations in Verilog HDL, developed as part of the ECE curriculum at Chennai Institute of Technology.
Author
Mukesh Khanna M  
B.E. Electronics and Communication Engineering — II Year  
Chennai Institute of Technology
---
Repository Structure
```
verilog-projects/
│
├── combinational/        # Combinational logic designs
├── sequential/           # Sequential logic designs
└── spi/                  # SPI Protocol implementation
```
---
Combinational Designs
Module	Description
`mul.v`	4-bit multiplier
`FourBitAdder.v`	4-bit ripple carry adder
`CLAA.v`	Carry Lookahead Adder
`Comparators.v`	Digital magnitude comparator
`Full\_Subtractor.v`	Full subtractor circuit
`UniversalShift.v`	Universal shift register
`PriorityEncoder.v`	Priority encoder
Each design includes a corresponding testbench (`\_tb.v`) for functional verification.
---
Sequential Designs
Module	Description
`DFF.v`	D Flip-Flop
`TFF.v`	T Flip-Flop
`JKFF.v`	JK Flip-Flop
`ShiftRegister.v`	Serial shift register
`MOD5Counter.v`	MOD-5 synchronous counter
`AsyncUpDownCounter.v`	Asynchronous up/down counter
`SyncUpDownCounter.v`	Synchronous up/down counter
Each design includes a corresponding testbench (`\_tb.v`) for functional verification.
---
SPI Protocol
A complete implementation of the Serial Peripheral Interface (SPI) protocol in Verilog HDL.
Module	Description
`SPI\_protocol.v`	Full SPI master-slave implementation
`SPI\_protocol\_tb.v`	Functional verification testbench
Features:
Configurable clock polarity (CPOL) and clock phase (CPHA)
Supports all 4 SPI modes (Mode 0, 1, 2, 3)
Full-duplex serial communication
Master-slave architecture
---
Tools Used
Tool	Purpose
Xilinx Vivado 2023	RTL design, simulation and synthesis
Verilog HDL	Hardware description language
---
About
These designs were implemented as part of the digital design coursework at Chennai Institute of Technology. The projects cover RTL design and functional simulation using Xilinx Vivado.
