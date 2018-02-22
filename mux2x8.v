module mux2x8(input [7:0]in1, in2, output [7:0] out, input sel);
	assign out = (sel==0? in1: in2);
endmodule
