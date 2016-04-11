module calculo(
	input [10:0] p1x,
	input [10:0] p1y,
	input [10:0] p2x,
	input [10:0] p2y,
	input [10:0] p3x,
	input [10:0] p3y,
	input CLOCK,
	output saida
);

	reg signed [23:0] mult1;
	reg signed [23:0] mult2;
	
	always @(posedge CLOCK) begin
		mult1 <= (p1x - p3x) * (p2y - p3y);
		mult2 <= (p2x - p3x) * (p1y - p3y);
	end
	assign saida = mult1 < mult2;
		
endmodule

module Trabalho(
	input [10:0]x,
	input [10:0]y,
	input CLOCK,
	input reset,
	output saida,
	output disponivel
);

	reg [10:0]x1;
	reg [10:0]x2;
	reg [10:0]x3;
	reg [10:0]y1;
	reg [10:0]y2;
	reg [10:0]y3;
	reg [10:0]px;
	reg [10:0]py;
	reg [3:0]state;
	reg controle;
	reg saida;
	wire result;
	wire valor1;
	wire valor2;
	wire valor3;

	calculo A(px, py, x1, y1, x2, y2,CLOCK,valor1);
	calculo B(px, py, x2, y2, x3, y3,CLOCK,valor2);
	calculo C(px, py, x3, y3, x1, y1,CLOCK,valor3);
	
	assign result = valor1 == valor2 & valor2 == valor3;
	
	assign disponivel = controle;
	
	always @(posedge CLOCK) begin
		if(reset) begin
			state <=0;
		end else begin
			case (state)
				0: begin
					x1 <= x;
					y1 <= y;
					controle <=0;
					state <=1;
				end
				1: begin
					x2 <= x;
					y2 <= y;
					state <=2;
				end
				2: begin
					x3 <= x;
					y3 <= y;
					state <=3;
				end
				3: begin
					px <= x;
					py <= y;
					state <=4;
				end
				4: begin
					saida <= result;
					controle <=1;
					state <=0;
				end
			endcase
		end
	end
endmodule
