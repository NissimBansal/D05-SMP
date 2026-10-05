module d_latch_tb;

reg d, en;
wire q;

d_latch u0 (.d(d),.en(en),.q(q));

initial begin
    {en, d} <= 0;

    $monitor("en=%0b d=%0b q=%0b", en, d, q);

    #5 d=1;            
    #5 en=1;           
    #5 d=0; 
    #5 d=1;
    #5 en=0; 
    #5 d=0;
    #5 $finish;
end

initial begin
    $dumpfile ("d_latch.vcd");
    $dumpvars (0,d_latch_tb);
end

endmodule