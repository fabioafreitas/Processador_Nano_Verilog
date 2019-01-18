module processador(
						input clk, 
						input rst,
						input [7:0] pINPUT,
						output [15:0] dadoMemoria, 
						output [7:0] enderecoMemoria, 
					   output [7:0] pOUTPUT,
						output SelJMP, 
						output SelDesv,
						output Wr, 
						output selDtWr,
					   output [7:0] dadoWr,
					   output [2:0] addRegWr,
					   output [2:0] addR1, addR2,  
						output [7:0]  R1, R2, 
					   output LdOUTPUT, 
					   output [7:0] ResultULA,
						output [2:0] estado	
						);
												
						

//wire SelJMP;
//wire SelDesv;
//wire Wr;
//wire selDtWr;
//wire [7:0] dadoWr;
//wire [2:0] addRegWr;
//wire [2:0] addR1, addR2;  
//wire [7:0]  R1, R2; 
//wire LdOUTPUT;
//wire [7:0] ResultULA;
 //wire [2:0] estado;
 
 wire [7:0] PC, PCDsv, newPC;
 wire [15:0] dado;
 wire [3:0] opcode;
 wire LdPC;
 wire [2:0] CmdULA; 
 wire [7:0] endJMP; 
 wire [7:0] endDsv;
 wire [7:0] imediato;
 wire SelRegWr;
 
 assign dadoMemoria = dado;
 assign enderecoMemoria = PC;
 assign endJMP = dado[7:0];
 assign endDsv = dado[7:0];
 assign addR1 = dado[11:9];
 assign addR2 = dado[8:6];

 assign imediato = dado[7:0];
 assign opcode = dado[15:12];

 rom rom  ( .address(PC),
				.clock(clk),
				.q(dado));	

 mux2x3 muxAddRegWr (.sel(SelRegWr), .in1(dado[5:3]), .in2(dado[11:9]), .out(addRegWr));
 
 mux2x8 muxSelDSV(.sel(SelDesv), .in1(PC+1), .in2(PC + 1 + endDsv), .out(PCDsv));
 
 mux2x8 muxSelJMP1(.sel(SelJMP), .in1(PCDsv), .in2(endJMP), .out(newPC));
 
 mux2x8 muxDtWr(.sel(selDtWr), .in1(ResultULA), .in2(imediato), .out(dadoWr));
 
				
 ctrl ctrl( .estado(estado),
				.clk(clk), 
				.rst(rst), 
				.OP(opcode), 
				.ResultULA(ResultULA), 
				.selDtWr(selDtWr), 
				.Wr(Wr), 
				.LdPC(LdPC), 
				.SelJMP(SelJMP), 
				.SelDesv(SelDesv), 
				.CmdULA(CmdULA), 
				.LdOUTPUT(LdOUTPUT),
				.SelRegWr(SelRegWr));
				
 ula ula (.portA(R1), 
          .portB(R2), 
			 .op(CmdULA),   
			 .resultado(ResultULA));
			  
 bancoRegistradores bancoRegistradores(.rst(rst), 
													.clk(clk), 
													.wrEn(Wr), 
													.addR1(addR1), 
													.addR2(addR2), 
													.addWr(addRegWr), 
													.dadoR1(R1), 
													.dadoR2(R2), 
													.dadoWr(dadoWr));
  
 
registrador regPC(.load(LdPC), .rst(rst), .dadoIn(newPC), .dadoOut(PC)); 

registrador regOUTPUT(.load(LdOUTPUT), .rst(rst), .dadoIn(ResultULA), .dadoOut(pOUTPUT)); 
 
endmodule
