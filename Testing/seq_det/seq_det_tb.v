module seq_det_tb;

reg X, clear, clk;
wire Y, Z;

seq_det u0 (.X(X), .clk(clk), .clear(clear), .Y(Y), .Z(Z));

always #5 clk = ~clk;

initial begin
    {clk, clear} = 2'b00;
    #10 clear = 1'b1;

    $monitor("time=%0t X=%b Y=%b Z=%b", $time, X, Y, Z);

    X = 1'b1; #10;
	X = 1'b0; #10;
	X = 1'b1; #10;
	X = 1'b1; #10;
	X = 1'b0; #10;
	X = 1'b1; #10;
	$finish;

end

initial begin
    $dumpfile ("seq_det.vcd");
    $dumpvars (0,seq_det_tb);
end

endmodule