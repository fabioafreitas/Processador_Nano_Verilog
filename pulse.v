module pulse(input clk, input chave, input [25:0] tempo, output  sinal);
   reg [25:0]cnt;
	reg chTmp;
	assign sinal = ~|cnt;
	always @(posedge clk) begin	   
	   if ( chave!= chTmp) begin 
		  chTmp <= chave;	
		  if (chave==0) 
		    cnt <= tempo;	 
		end if (cnt!=0) 
		       cnt <= cnt-26'b1;
	end
endmodule
 