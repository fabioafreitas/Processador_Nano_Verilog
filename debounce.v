// tira a replicação da tecla ao ser pressionada
// este módulo evita que isto ocorra e faz com que a tecla pressionada gere apenas um sinal por clique

module debounce(input clk, input chave, output reg sinal);
   reg [19:0]cnt;
	reg chTemp;
	always @(posedge clk) begin
	   if (chTemp != chave) begin
		  cnt <= 20'h222e0;
		  chTemp <= chave;
		end else if (cnt==0) 
		          sinal <= chave;
				  else cnt = cnt-20'd1;	 
				 
	end
endmodule
