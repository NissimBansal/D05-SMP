module traffic_light_tb;

reg clear, clk;
wire [2:0] light;

traffic_light u0 (.clk(clk),.clear(clear),.light(light));

always #5 clk = ~clk;

initial begin
    {clk, clear} = 2'b00;
    #10 clear = 1'b1;

    $monitor("time=%0t light=%b", $time, light);

    #100 $finish;
end

initial begin
    $dumpfile ("traffic_light.vcd");
    $dumpvars (0,traffic_light_tb);
end

endmodule