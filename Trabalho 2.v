module valores(input clock,output led);
   
	reg [26:0] contador=0;
	reg led_reg=0;
   
	assign led = led_reg;
	
	always @(posedge clock) begin		
		if(contador == 50000000) begin
			led_reg = ~led_reg;
			contador = 0;
		end else begin
			contador <= contador+1;
		end
	end
   
endmodule
   
module test;
   
	reg clk;
	wire light;
   
   
	valores A(clk,light);
   
	always #1 clk = ~clk;
   
	initial begin
		$dumpvars(0,A);
		#0;
		clk <= 0;
		#150000000;
		$finish;   
		end
endmodule
