# FPGA Funky Calculator

This repo contains the sources and tcl script needed to build the Vivado project for my "Funky Calculator" demo.

The project is designed to run on a Basys-3 board from Digilent, but should be easily modifiable to run on any alternative that has 16 switches + LEDs and a 7-Segment display. The project should be able to run on boards with a smaller (or larger) number of outputs but the modifications you will need to make will be more involved (changing some vector widths).

The project puts the switches into two groups, each group of switches can be toggled to input a binary number (the corresponding LEDs by the switches will also illuminate to show which switches are toggled).

With this version the maximum value that can be entered for each argument to the addition is 255 = (11111111). Consequently the highest displayed result is 510 = (11111111 + 11111111) = (111111110).

The calculated value is generated by the mainAdder module, but this feeds into the mainDelay module before reaching the 7-segment display, this module steps the displayed value up or down to create a pleasing visual effect. Since the seven segment display has four digits and we need at most three, the left most digit has a corresponding spinning pattern.

To build this, check out the project to a new location and within the Vivado TCL console run `source ./funkycalc.tcl`

Tested with Vivado 2017.2 and a Basys-3 board.
