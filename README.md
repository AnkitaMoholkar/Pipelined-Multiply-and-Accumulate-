# Pipelined-Multiply-and-Accumulate-

The aim of this mini project was to design the floating point MAC (Multiply and Accumulate) using pipelining for half-precision numbers. The test numbers were provided and the dot product of these numbers was supposed to be verified using the Verilog design. The data is as follows:
      Test the above models with the following 12-element dot product, A·B.
          A= (0.1, 0.2, 0.25, -0.3, 0.4, 0.5, 0.55, 0.6, -0.75, 0.8, 0.875, 0.9)
          B = (0.27, -0.95, 0.125, 0.8, 0.875, -0.75, 0.4, 0.6, 0.15, 0.25, -0.4, 0.55)
          
Design Specifications:
 Language used: Verilog
 Model: Bit accurate model for half precision numbers
 Design: 3 stage Pipelined design (Align- add- normalize)
 Software used: Vivado
 Input of the design: 24 numbers in the half precision IEEE 16 bit format
 Output of the design: 1 number in the half precision IEEE 16 bit format


