module Area(
	input CLOCK_50,
	input [10:0]ax,
	input [10:0]ay,
	input [10:0]bx,
	input [10:0]by,
	input [10:0]cx,
	input [10:0]cy,
	output [23:0]area);

	reg signed [23:0]valor;

	always @(posedge CLOCK_50) begin
		valor = (ax*(by-cy) + bx*(cy-ay)+ cx*(ay-by));
	end

	assign area = valor;
endmodule
  
module main(input CLOCK_50);

	reg resultado;
	wire [10:0]ax;
	wire [10:0]ay;
	wire [10:0]bx;
	wire [10:0]by;
	wire [10:0]cx;
	wire [10:0]cy;
	wire [10:0]dx;
	wire [10:0]dy;
	wire [23:0]valorA;
	wire [23:0]valorB;
	wire [23:0]valorC;
	wire [23:0]valorD;

	Area A(CLOCK_50,ax,ay,bx,by,cx,cy,valorA);
	Area B(CLOCK_50,dx,dy,bx,by,cx,cy,valorB);
	Area C(CLOCK_50,ax,ay,dx,dy,cx,cy,valorC);
	Area D(CLOCK_50,ax,ay,bx,by,dx,dy,valorD);
   
	always @(posedge CLOCK_50)begin
		if(valorA == (valorB+valorC+valorD))begin
			resultado = 1;
		end else begin
			resultado = 0;
		end	  
	end
   
endmodule
