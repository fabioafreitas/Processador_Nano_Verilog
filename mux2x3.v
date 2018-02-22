module mux2x3(input [2:0]in1, in2, output [2:0] out, input sel);
	assign out = (sel==0? in1: in2);
endmodule
