module bancoRegistradores(rst, clk, wrEn, addR1, addR2, addWr, dadoR1, dadoR2, dadoWr);
input clk, rst, wrEn;
input [2:0] addR1, addR2, addWr;
input [7:0] dadoWr;
output reg [7:0] dadoR1; 
output reg [7:0] dadoR2;

reg [7:0] dados [0:7];

	always @(negedge rst or posedge clk) begin
	
		if(rst == 0) begin
			dados[3'b000] <= 8'b10100000;
			dados[3'b001] <= 8'b10100001;
			dados[3'b010] <= 8'b10100010;
			dados[3'b011] <= 8'b10100011;
			dados[3'b100] <= 8'b10100100;
			dados[3'b101] <= 8'b10100101;
			dados[3'b110] <= 8'b10100110;
			dados[3'b111] <= 8'b10100111;
		end 
		
		else begin
		
			if(wrEn == 1) begin
				dados[addWr] <= dadoWr;
			end
			
			dadoR1 <= dados[addR1];
			dadoR2 <= dados[addR2];
			
		end
		
	end
	
endmodule
