module topPlaca(
				input CLK_28, 
				input [17:0] SW, 
				input [3:0] KEY,
				output [17:0] LEDR, 
				output [7:0] LEDG, 
				output [7:0] HEX0_D, 
				output [7:0] HEX1_D, 
				output [7:0] HEX2_D, 
				output [7:0] HEX3_D, 
				output [7:0] HEX4_D,  
				output [7:0] HEX5_D, 
				output [7:0] HEX6_D, 
				output [7:0] HEX7_D,
				output teste
				 
				);
	
	localparam STEP=0, AUTO=1;
	
	wire clk, clkCPU, btStep, btRst, swModo, swDisplay;  
	wire [7:0] enderecoMemoria, pOUTPUT, pINPUT;
	wire [15:0] dadoMemoria;
	
	assign clkCPU = swModo == 1'b0 ? clk : btStep;// seleciona entre o clock automático ou manual
													
	assign pINPUT=SW[7:0];
	
	assign LEDG[0]=clk;
	
	assign LEDG[1]=btStep;
	
	assign LEDG[2]=btRst;
	
	//divClk dvck(.clk_in(CLK_28), .divisor(26'h0), .clk_out(clk)); // remover comentario para simular
	divClk dvck(.clk_in(CLK_28), .divisor(26'h6ACFC0), .clk_out(clk)); // clock de 1 segundo - comentar para simular
	
	//pulse pRst(.clk(CLK_28), .chave(KEY[0]), .tempo(26'h1), .sinal(btRst)); // remover comentario para simular
	pulse pRst(.clk(CLK_28), .chave(KEY[0]), .tempo(26'h1AB3F00), .sinal(btRst)); // comentar para simular

	
	debounce dbModo(.clk(CLK_28), .chave(SW[17]), .sinal(swModo));
	
	debounce dbDisplay(.clk(CLK_28), .chave(SW[16]), .sinal(swDisplay));
																			
	pulse pStep(
				.clk(CLK_28), 
				.chave(KEY[3]), 
				.tempo(26'hD59F80), 
				.sinal(btStep)
				);
						
   processador processador(
						.clk(clkCPU), 
						.rst(btRst),
						.pINPUT(pINPUT),
						.dadoMemoria(dadoMemoria), 
						.enderecoMemoria(enderecoMemoria), 
					   .pOUTPUT(pOUTPUT)
						);		
	
	display7seg display0(.dp(1), .dado(dadoMemoria[3:0]),     .leds(HEX0_D));
	display7seg display1(.dp(1), .dado(dadoMemoria[7:4]),     .leds(HEX1_D));
	display7seg display2(.dp(1), .dado(dadoMemoria[11:8]),    .leds(HEX2_D));
	display7seg display3(.dp(1), .dado(dadoMemoria[15:12]),   .leds(HEX3_D));	
	display7seg display4(.dp(1), .dado(enderecoMemoria[3:0]), .leds(HEX4_D));
	display7seg display5(.dp(1), .dado(enderecoMemoria[7:4]), .leds(HEX5_D));
	display7seg display6(.dp(1), .dado(pOUTPUT[3:0]), 			 .leds(HEX6_D));
	display7seg display7(.dp(1), .dado(pOUTPUT[7:4]), 			 .leds(HEX7_D));
	
	assign LEDR = SW;
	
endmodule

