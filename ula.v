module ula (portA, portB, op, resultado);
	input [7:0]portA; 
	input [7:0]portB; 
	input [2:0]op; 
	output reg [7:0]resultado; 
		always @(*) begin
			case (op)
				3'd0: resultado <= portA;
				3'd1: resultado <= portA + portB; 
				3'd2: resultado <= portA & portB;
				3'd3: resultado <= portA | portB;
				3'd4: resultado <= portA - portB;
				3'd5: resultado <= -portA;
				3'd6: resultado <= ~portA;
				default: resultado <= 8'd0;
			endcase
		end
endmodule
