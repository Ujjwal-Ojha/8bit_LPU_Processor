# 8-bit LPU Processor

A custom **8-bit Logic Processing Unit (LPU)** designed and implemented from scratch using **Verilog HDL**. The project focuses on understanding processor architecture, instruction execution, RTL design, and simulation-based verification.

## Overview

This project implements a small instruction-based 8-bit processor capable of:

- Fetching instructions from instruction memory
- Decoding instructions
- Performing arithmetic and logical operations
- Reading and writing registers
- Accessing data memory
- Updating the Program Counter (PC)
- Halting execution when required

The processor is currently developed for **simulation and verification**, with FPGA implementation planned as a possible future extension.

## Architecture

```text
             ┌──────────────────┐
             │ Program Counter  │
             │       (PC)       │
             └────────┬─────────┘
                      │
                      ▼
             ┌──────────────────┐
             │ Instruction      │
             │ Memory           │
             └────────┬─────────┘
                      │
                      ▼
             ┌──────────────────┐
             │ Instruction      │
             │ Decoder /        │
             │ Control Unit     │
             └────────┬─────────┘
                      │
          ┌───────────┼───────────┐
          ▼           ▼           ▼
     ┌─────────┐ ┌─────────┐ ┌─────────┐
     │Register │ │   ALU   │ │  Data   │
     │  File   │ │         │ │ Memory  │
     └─────────┘ └─────────┘ └─────────┘
```

## Processor Components

### Program Counter

Stores the address of the instruction being executed and controls sequential instruction fetching.

### Instruction Memory

Stores the program instructions executed by the processor.

### Instruction Decoder

Interprets the instruction opcode and generates the required control signals.

### Register File

Provides temporary storage for processor data and intermediate results.

### ALU

Performs arithmetic and logical operations such as:

- ADD
- SUB
- AND
- OR
- XOR

### Data Memory

Provides storage for data used during program execution.

### Control Unit

Coordinates the processor components and controls instruction execution, register writes, memory operations, and processor halt behavior.

## 🔄 Instruction Flow

The processor follows a basic instruction execution cycle:

```text
Fetch → Decode → Execute → Memory → Write Back
                              ↓
                         Update PC
```

Not every instruction necessarily uses every stage.

## 🧾 Instruction Set

The processor uses a **custom instruction set architecture (ISA)** developed specifically for this project.

Instruction categories include:

| Category      | Function                               |
| ------------- | -------------------------------------- |
| Data Movement | Transfer data between registers/memory |
| Arithmetic    | Perform arithmetic operations          |
| Logical       | Perform bitwise logic                  |
| Memory        | Read/write data memory                 |
| Control       | Control program execution              |
| HALT          | Stop processor execution               |

The instruction set can be expanded as development continues.

## 🧪 Verification

A dedicated Verilog testbench is used to verify processor functionality.

Verification includes:

- Clock and reset testing
- Instruction fetching
- Instruction execution
- Register operations
- ALU operations
- Memory operations
- Program Counter behavior
- HALT behavior
- Waveform analysis

A basic **MOV instruction test has been successfully verified** through simulation.

## 🛠️ Tools

- **Verilog HDL** — RTL design
- **Icarus Verilog** — Simulation
- **GTKWave** — Waveform analysis
- **VS Code** — Development environment
- **VCD** — Simulation waveform output

## 📁 Repository Structure

```text
8bit-lpu-processor/
│
├── rtl/
│   ├── cpu.v
│   ├── alu.v
│   ├── register_file.v
│   ├── control_unit.v
│   ├── instruction_memory.v
│   └── data_memory.v
│
├── tb/
│   └── cpu_tb.v
│
├── sim/
├── waves/
├── docs/
│
└── README.md
```

The structure may change as the processor develops.

## 🚀 Running the Simulation

### Compile

```bash
iverilog -o cpu_sim rtl/*.v tb/cpu_tb.v
```

### Run

```bash
vvp cpu_sim
```

### View Waveforms

```bash
gtkwave cpu.vcd
```

Important signals such as `PC`, `INSTR`, registers, memory signals, and `HALT` can be inspected in the waveform viewer.

## 📈 Project Status

**Status:** In Development
**Architecture:** Custom 8-bit processor / LPU
**HDL:** Verilog
**Target:** Simulation & Verification

### Completed

- [x] Basic processor architecture
- [x] Instruction fetching
- [x] Program Counter
- [x] Register operations
- [x] ALU integration
- [x] Basic instruction execution
- [x] Verilog testbench
- [x] VCD waveform generation
- [x] MOV instruction verification

### Planned

- [ ] Expand instruction set
- [ ] Add branching instructions
- [ ] Add more comprehensive tests
- [ ] Improve verification
- [ ] Add assertions
- [ ] Add automated simulation
- [ ] Add Cocotb/SystemVerilog verification
- [ ] FPGA synthesis and implementation

## 📚 Learning Outcomes

This project provides practical experience in:

- Processor architecture
- RTL design
- Verilog HDL
- Combinational and sequential logic
- ALU design
- Register and memory design
- Instruction decoding
- Control-unit design
- Testbench development
- Simulation and debugging
- Waveform analysis

## 🎯 Goal

The goal is to build a **fully functional custom 8-bit processor from RTL design through instruction-level verification**, while documenting its architecture, ISA, implementation, and testing process.

## 📄 License

This project is intended as an educational and portfolio project. An open-source license such as the **MIT License** may be used to define reuse and distribution terms.
