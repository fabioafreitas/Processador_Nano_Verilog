module registrador (load, rst, dadoIn, dadoOut);
input load, rst;
input [7:0] dadoIn;
output reg [7:0] dadoOut;	
	always @(negedge rst or posedge load) begin
	
		if(rst == 0) begin
			dadoOut <= 8'b00000000; 
		end else begin
			dadoOut <= dadoIn;
		end
		
	end
endmodule
