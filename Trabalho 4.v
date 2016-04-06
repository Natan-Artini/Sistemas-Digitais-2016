module calculo(
	input [9:0]p1x,
	input [9:0]p1y,
	input [9:0]p2x,
	input [9:0]p2y,
	input [9:0]p3x,
	input [9:0]p3y,
	output saida
);
	wire signed resultado;
	
	always @(p1x,p1y,p2x,p2y,p3x,p3y) begin
		resultado = p1x*(p2y-p3y) + p2x*(p3y-p1y) + p3x*(p1y-p2y);
	end
	
	assign saida = resultado;
	
endmodule

module principal(
	input [9:0]ptx,
	input [9:0]pty,
	input [9:0]p1x,
	input [9:0]p1y,
	input [9:0]p2x,
	input [9:0]p2y,
	input [9:0]p3x,
	input [9:0]p3y,
	output saida
);
	
	reg [23:0]valor;
	reg [23:0]valor1;
	reg [23:0]valor2;
	reg [23:0]valor3;
	
	calculo a(p1x,p1y,p2x,p2y,p3x,p3y,valor);
	calculo b(ptx,pty,p2x,p2y,p3x,p3y,valor1);
	calculo c(p1x,p1y,ptx,pty,p3x,p3y,valor2);
	calculo d(p1x,p1y,p2x,p2y,ptx,pty,valor3);
	
	if(valor == (valor1+valor2+valor3)) begin
		saida <= 1;
	end else begin
		saida <= 0;
	end
	
endmodule
