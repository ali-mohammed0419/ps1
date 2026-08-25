# PS1 FPGA Project

This project focuses on building the PS1 hardware on an FPGA. Right now, I'm working simulation only to get the main R3000A CPU up and running. This is my working area for the hardware, simulation, and test flow.

My main goal for thsi project is to be able to load a PS1 ROM on a real FPGA board, and be able to interact with and play it.

If you want to try it out today, you can follow the run directions below.

### System Component Status 

| Status      | System block                           |
| ----------- | -------------------------------------- |
| In Progress | CPU and memory                         |
| Not started | BIOS                                   |
| Not started | GPU and VRAM                           |
| Not started | SPU                                    |
| Not started | CD-ROM controller                      |
| Not started | DMA and interrupt handling             |
| Not started | Timers and counters                    |
| Not started | Memory controller and bus interconnect |
| Not started | SIO and controllers                    |
| Not started | Memory cards                           |
| Not started | MDEC                                   |
| Not started | Expansion and parallel I/O             |
| Not started | Clock generation and reset logic       |
| Not started | Video and audio output paths           |


## Try It Out

### Prerequisites

- `verilator`
- `mipsel-linux-gnu-as`
- `mipsel-linux-gnu-objcopy`
- `surfer` for waveform viewing

I have been using Surfer and Verilator. These are my personal run scripts, but if you have other software, they would work too.

### Build the sample hex image

This step is useful if you want to write your own MIPS assembly and compile it down

```bash
./scripts/build-hex program.asm sim/program.hex
```

### Run one of the testbenches

There are several testbenches available under ``` tests/```

```bash
./scripts/run-test tests/alu/test_alu.sv
./scripts/run-test tests/pc/test_pc.sv
./scripts/run-test tests/cpu/cpu_add.sv
```

### Run a waveform session

```bash
./scripts/run-wave tests/cpu/cpu_add.sv
```

## Repository Layout

| Path | Purpose |
| --- | --- |
| `rtl/` | SystemVerilog source for the CPU, ALU, register file, decoder, and instruction memory |
| `tests/` | Verilator testbenches for focused module and CPU checks |
| `scripts/` | Helper scripts for hex generation, simulation, and waveform viewing |
