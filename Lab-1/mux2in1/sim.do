###########################
# Simple modelsim do file #
###########################

# Delete old compilation results
if { [file exists "work"] } {
    vdel -all
}

# Create new modelsim working library
vlib work

# Compile all the Verilog sources in current folder into working library
vlog  mux2in1.v tb_mux2in1.v

# Open testbench module for simulation
vsim work.tb_mux2in1

# Add all testbench signals to waveform diagram
add wave -radix unsigned sim:/tb_mux2in1/*

onbreak resume

# Run simulation
run -all

wave zoom full
