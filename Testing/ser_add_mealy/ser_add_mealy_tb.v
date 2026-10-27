module ser_add_mealy_tb;

	reg clk, clear, X, Y;
	wire Z;
	
	ser_add_mealy u0 (clk, clear, X, Y, Z);

	always #5 clk = ~clk;
	
	initial begin

		{clear, clk} = 2'b00; #10;
		clear = 1'b1; 

        $monitor("time=%0t X=%b Y=%b Z=%b", $time, X, Y, Z);
        
		X = 1'b0; Y= 1'b0; #10;
		X = 1'b0; Y= 1'b1; #10;
		X = 1'b1; Y= 1'b0; #10;
		X = 1'b1; Y= 1'b1; #10;
		$finish;
	end

endmodule