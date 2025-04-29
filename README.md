# ALU Verilog Design

This project presents a simple **Arithmetic Logic Unit (ALU)** implemented in **Verilog**. The ALU performs a variety of arithmetic and logical operations on 32-bit input operands and produces a 64-bit output.

## Overview

An **ALU** is a core component of a CPU that performs arithmetic and logic operations. In this Verilog-based design, the ALU includes separate submodules for addition, subtraction, multiplication, shifting, and bitwise operations. It is designed with a control unit that interprets operation codes (opcodes) to select the appropriate function.

## Features

- **32-bit input operands** `a` and `b`
- **64-bit output**
- **Parametric design** (parameterizable bit-widths)
- **Synchronous operation** with clock, reset, and enable signals

## Supported Operations

| Opcode  | Operation                  |
|---------|----------------------------|
| 00001   | Add                        |
| 00010   | Subtract                   |
| 00011   | Multiply                   |
| 00100   | 1-bit Right Shift          |
| 00101   | 1-bit Left Shift           |
| 00110   | Bitwise AND                |
| 00111   | Bitwise OR                 |
| 01000   | Increment Input A by 1     |
| 01010   | Decrement Input A by 1     |

## Block Diagram

                    +-------------------+
                    |    Control Unit   |
                    |  (Opcode Decoder) |
                    +---------+---------+
                              |
                              v
                    +---------+-----------+
        a[31:0] --> |                     | ---> out[63:0]
        b[31:0] --> |        ALU          |
                    | (Arithmetic &       |
                    |  Logic Operations)  |
                    +---------------------+

*Note: The actual diagram is referenced in the report but not provided here.*

## Verilog Module Definition

```verilog
module alu (out, a, b, op_code, clk, rst, en);
  input clk, rst, en;
  input [31:0] a, b;
  input [4:0] op_code;
  output reg [63:0] out;

  // Implementation logic here...
endmodule
```

## Getting Started

To simulate and test this ALU:
1. Clone this repository.
2. Use any Verilog simulator like ModelSim, Cadence or EDA Playground.
3. Write a testbench to apply input values and verify outputs.
