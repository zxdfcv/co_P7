`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:39:36 12/15/2022
// Design Name:   CP0
// Module Name:   C:/Users/10791/co_P7/P7_code/CP0_test.v
// Project Name:  co_P7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CP0
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CP0_test;

	// Outputs
	wire A;

	// Instantiate the Unit Under Test (UUT)
	CP0 uut (
		.A(A)
	);

	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

