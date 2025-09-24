# Lecture 1 - Digital Arch & Design - 24/09/2025

## Th1: Intro to VHDL

### Logic Circuits

two logic circuits classes:
- **Combinatorial**: use logic gates or Truth Tables, but do not have feedback and/or memory  
- **Sequential** - async and **sync**: with feedback/memory (we will only focus on synchronous, because FPGAs)  

#### Combinatorial Logic Circuits

minterm ($F=1$), maxterm ($F=0$)  
**logic function $F$** (the plus sign is OR (actually XOR here), the dot is AND) is a sum of minterms  
this expression is **not optimal**, we can **optimize** it using many methods: Boolean axioms/theorems, Karnaugh Maps, Quine-McCluskey, Espresso (done by computer), etc.  
> we won't do K-maps in this course because we won't do this by hand  

Sum-of-Products (SoP) and Product-of-Sums (PoS).  
All logic functions can be expressed in a set of AND and a single OR gate (SoP).  
This is **two-level logic**: circuit delay is divided in two stages: first delay of AND stage, then delay of OR gate.  
Today's logic circuits are implemented using multi-level logic, a series of AND/OR gates.  

#### Sequential Logic Circuits

Output (O) depends on input (I) AND **system state (S)**  
Same comination of inputs can lead to different outputs depending on the state of the system.  
**Future state ($S^+$)** is calculated from previous state ($S^-$) and inputs (I).  
...  

State tables, state diagrams, etc.  
Two types in sequential systems: Mealy (input and state) machines or Moore (only state) machines.  

### Logic circuit design or **sythesis**
can be wuite complex  

- Formal specification: translate spec into some kind of formal model of digital circuit  
- Logic optimization: logic description transformation to reach certain objectives  
- Logic functions implementation: circuit assembly  

complex to design  
we need a way to automatize this  
=> HDLs (hardware description languages) and EDA, the subject of these lectures  

Slide 18: many different options to choose from to implement logic circuits: Full-Custom, ASICs (using standard cells), PLAs, FPGAs (etc?)  
we will focus on FPGAs only, but will mention ASICs a bit too.  

#### PLAs (Programmable Logic Arrays)
we won't work with these  
implements SoP expressions in hardware  
regular structure of AND & OR gates (planes) with programmale connectivity  
limited to approx 100 IOs and relatively simple logic functions  

as CMOS integration evolved, ... FPGAs

#### FPGAs (Field Programmable Gate Arrays)
Slide 21  

Regular (typically mesh) structure of:
- **Logic Cells (LCs)**: (CLE CLB, slice LC...), implements logic functions using memories to store truth tables (logic function output) as function of input (addresses)  
- **Programmable interconnect**: can connect any two (or more) arbitrary points unside the circuit  
- **I/O blocks**: off-chip connection  
- **Memories** (SRAMs): any digital design needs a memory, often half of the resources could be used for storage (and even more)  
- soemtimes even dedicated logic CPUs, DSPs, etc  

#### Typical Logic Cell (LC) architecture
Slide 22  

it's never gonna be a logic gate, always gonna be truth tables  
Each LC has at least one LUT, i.e a memory that stores the truth table of a logic function to be implemented  

LUT is SRAM: 1-bit data with few address bits ($addr<10$)  
Thus the SRAM is small, so it can have fast READ times  

LUT output is either connected to combinatorial LC output, or through FF (flip-flop) for a senquetial (registered) output.  

Some LCs have supplementary logic resources to perform certain functionality, typically carry generation logic (CY).  

#### Input/Output (IO) blocks
slide 23  

communication bewteen FPGA and outside world through a connection: pad  

can be configured to be an input or output, or even bidirectional  

Enables synchrinization of inputs with internal logic using internal Flip-Flops  


> we will have an efficiency to our use of our FPGA resources.  

#### Programmable interconnect
Slide 24  

enbales connectivity between different LCs  
each LC has something called **Programmable Switch Matrix (PSM)**  
it's sort of a crossbar  

#### FPGA manufacturing technologies & usage
vendors, manufacturing technology used.  

- FPGA can be programmable once - anti-fuse  
- FPGA can be re-programmable - LUTs implemented using SRAMs: most common today - reconfigurable computing  

FPGA vs ASIC: lower operating frequencies, but not necessarily lower performance, they are **les area/power efficient, but easier to design & recoverable if errors in HW**  

FPGA uses: low volume production, prototyping, reconfigurable systems  

#### ASIC vs FPGA
(slide 26)  

optimized logic function will be decomposed using **Factoring, Shannon, Boolean** decomposition theorem that enables multi-level logic.  
For more inputs for example, this will get a lot more complicated, which will be needed for ASICs, but for FPGAs we can just use LUTs as they will work the same if decomposed or not.  


### HDLs - Hardware Description Languages

Formalize verbal specifications of circuits  

HDLs allow **automated synthesis** of logic circuits (using some SW)  
- Synthesis  
- ..  
- gate-level netlist  

#### HDLs and simulations

**automated simulations** to verify functional properties of the design before physical implementation.  
Useful for **model verification**  
HDLs can be used to **automatically** generate the physical design description for a given target tech: FPGA or ASIC of a given CMOS tech node.  

HDLs have great structuring  
Complex systems can be done within a reasonable amount of time (like a week)  

#### Abstraction levels
HDLs can describe logic circuits at **various abstraction levels**  

we can describe an ALU that performs addition without necessarily describing how this operation will be done  
ALU can be described and simulated by computer  
but we need to choose wich adder architecture to use (ripple-carry, carry-lookahead, etc)  
Then only after we can choose how to effectively implement the adder circuit (or let the tool do the synthesis)  

#### Practical HDL languages
(SystemC)  
**VHDL**, **Verilog** (or SystemVerilog) - mainly used for physical circuit simulation & implementation: we'll use VHDL.  
Attention! a part of VHDL is not synthesizable: some constructs can be used for simulation only  

#### VHDL origins and usage
slide 36  

-----------------------
> end of lecture




