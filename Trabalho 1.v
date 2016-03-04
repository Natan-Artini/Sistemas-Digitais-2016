module teste(

	input clock,
	output saida
	
);

	assign saida = clock;
	
endmodule

module executa;

	reg clock;
	
	always #2 clock <= ~clock;
	
	teste led(clock,saida);
	
	initial begin
        $dumpvars(0, led);
        #2;
		clock <= 0;
        #50;
        $finish;
    end
endmodule
