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
vlog  sl2.v tb_sl2.v

# Open testbench module for simulation
vsim work.tb_sl2

# Add all testbench signals to waveform diagram
add wave -radix binary sim:/tb_sl2/*

onbreak resume

# Run simulation
run -all

wave zoom full
