module  display7seg(dp, dado, leds);
input dp;
input [3:0] dado;
output reg [7:0] leds;
	always @(*) begin
		case (dado) // como o input é [3:0], a entrada deve ser caracterizada com 4 bits
			4'b0000: leds <= ~8'b00111111; // 0
			4'b0001: leds <= ~8'b00000110; // 1
			4'b0010: leds <= ~8'b01011011; // 2
			4'b0011: leds <= ~8'b01001111; // 3
			4'b0100: leds <= ~8'b01100110; // 4
			4'b0101: leds <= ~8'b01101101; // 5
			4'b0110: leds <= ~8'b01111101; // 6
			4'b0111: leds <= ~8'b00000111; // 7
			4'b1000: leds <= ~8'b01111111; // 8
			4'b1001: leds <= ~8'b01101111; // 9
			4'b1010: leds <= ~8'b01110111; // A ou 10
			4'b1011: leds <= ~8'b01111100; // B ou 11 
			4'b1100: leds <= ~8'b01011000; // C ou 12
			4'b1101: leds <= ~8'b01011110; // D ou 13
			4'b1110: leds <= ~8'b01111001; // E ou 14
			4'b1111: leds <= ~8'b01110001; // F ou 15
			default: leds <= ~8'b11111111; // default
		endcase
	end
	
endmodule
