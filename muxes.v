module mux2x3(input [2:0]in1, in2, output [2:0] out, input sel); // se (sel==0) out=in1
	// utilizando comando ternário no multiplexador
	assign out = (sel==0? in1: in2);
endmodule

module mux2x8(input [7:0]in1, in2, output [7:0] out, input sel); // se (sel==0) out=in1
	assign out = (sel==0? in1: in2);
endmodule
