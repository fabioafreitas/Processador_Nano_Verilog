	 
module ctrl ( 	estado, 
					clk, 
					rst, 
					OP, 
					ResultULA, 
					selDtWr, 
					Wr, 
					LdPC, 
					SelJMP, 
					SelDesv, 
					CmdULA, 
					LdOUTPUT,
					SelRegWr
					);
  input clk, rst;
  input [3:0] OP;
  input [7:0] ResultULA;
  output reg SelRegWr;
  output reg selDtWr, Wr, LdPC, SelJMP, SelDesv, LdOUTPUT;
  output reg [2:0] CmdULA; 
  output reg [2:0] estado;
  
// opcode das instruções					
  localparam opNOP  =4'h0, 
				opADD  =4'h1,
				opAND  =4'h2,
				opOR   =4'h3,
				opSUB  =4'h4,
				opNEG	 =4'h5,
				opNOT  =4'h6,
				opCPY  =4'h7,
				opLRG  =4'h8, 
				opBLT  =4'h9, 
				opBGT  =4'hA, 
				opBEQ  =4'hB, 
				opBNE  =4'hC, 
				opJMP  =4'hD, 
				opINPUT=4'hE,
				opOUTPUT=4'hF;


  // comandos para a ULA				
  localparam cmdTSTR1 =3'd0, 
				cmdADD   =3'd1,
				cmdAND   =3'd2,
				cmdOR    =3'd3,
				cmdSUB   =3'd4,
				cmdNEG   =3'd5,
				cmdNOT   =3'd6;		
  
  always @ (posedge clk or negedge rst) begin
		if (rst==0) begin // reseta todos os sinais de controle
		   estado = 3'd0;
		   selDtWr <= 2'b00; 
		   Wr <= 1'b0;
		   LdPC <= 1'b0;
			SelJMP <= 1'b0;
			SelDesv <= 1'b0;
			    CmdULA <= cmdTSTR1;
			estado <= 3'd1;
			SelRegWr <= 1'b0;	
		end 
		else begin
		  case (estado)
		    0: begin // reseta todos os sinais de controle para proceder a carga de uma nova instrução
					selDtWr <= 2'b00; 
					Wr <= 1'b0;
					LdPC <= 1'b0;
					SelJMP <= 1'b0;
					SelDesv <= 1'b0;
					CmdULA <= cmdTSTR1;
					estado <= 3'd1;
					LdOUTPUT <= 1'b0;
					SelRegWr <= 1'b0;
				 end 	
			 1: estado <= 3'd2; // aguarda a leitura da instrução na memória
			 2: begin // decodifica a instrução e programa o caminho de dados
			      case (OP)
					  opNOP:begin // não efetua nenhum comando 
					  
							    end
					  opADD:begin 
								  CmdULA <= cmdADD;//envia comando para ula efetuar a operação ADD
								  Wr <= 1'b1; 		 // envia o sinal ativo para escrever no banco registrador 
							   end
					  opAND:begin
					           CmdULA <= cmdAND;//envia comando para ula efetuar a operação AND
								  Wr <= 1'b1; 
								end
								
					  opOR :begin
					           CmdULA <= cmdOR; //envia comando para ula efetuar a operação OR
								  Wr <= 1'b1;
								end
					  opSUB:begin
					           CmdULA <= cmdSUB; //envia comando para ula efetuar a operação SUB
								  Wr <= 1'b1; 
								end
					  opNEG:begin
					           CmdULA <= cmdNEG; //envia comando para ula efetuar a operação NEG
								  Wr <= 1'b1;
								end
					  opNOT:begin
					           CmdULA <= cmdNOT; //envia comando para ula efetuar a operação NOT
								  Wr <= 1'b1; 
								end
					  opCPY:begin
					           CmdULA <= cmdTSTR1;
								  Wr <= 1'b1;
								end  
					  opLRG: begin
					            SelRegWr <= 1'b1; //multiplexador libera o canal para o endereco 
					            selDtWr <= 2'b01; //
									Wr <= 1'b1;
								end
					  opBLT:;
 					  opBGT:;
					  opBEQ:;
					  opBNE:;	
					  opJMP:;
					  opINPUT:; // dúvida
					  opOUTPUT:begin
								  CmdULA <= cmdTSTR1;
								  selDtWr <= 0;
								  end
						default:;
					endcase  
				   estado <= 3'd3; //
				 end
			 3: begin  // prepara a carga da próxima instrução
					LdPC <= 1'b1;
					estado <= 3'd0; //
//			      Wr <= 1'b0;
//					estado <= 3'd4; 
					case (OP)
			        opJMP: SelJMP <= 1'b1;
					  opBLT: SelDesv <= (ResultULA[7] == 8'd1 ? 1'b1 : 1'b0);
					  opBGT: SelDesv <= (ResultULA[7] == 8'd0 ? 1'b1 : 1'b0);
					  opBEQ: SelDesv <= (ResultULA == 8'd0 ? 1'b1 : 1'b0);
					  opBNE: SelDesv <= (ResultULA != 8'd0 ? 1'b1 : 1'b0);
					  opINPUT:; // dúvida
					  opOUTPUT:  LdOUTPUT <= 1'b1; 
					  default: begin
									 SelJMP = 0;
									 SelDesv = 0;
								  end
			      endcase
				 end
//			 4: begin
//			      estado <= 3'd0; 
//					LdPC <= 1'b1;
//				 end																									
			 default:; 	 
		  endcase  
		end
  end
  
  
endmodule 