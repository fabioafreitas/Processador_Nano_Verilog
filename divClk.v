module divClk(input clk_in, input [25:0] divisor, output reg clk_out);
reg [25:0] cnt;
  always @ (posedge clk_in)
    begin
	   if (cnt==0) begin
		  clk_out <= ~clk_out;
		  cnt <= divisor; 
		end
      else cnt<= cnt-26'd1;		
	 end
endmodule 
