module t_ff (   input t, Clear, Clk,
                output reg Q)
;

always @(posedge Clk or negedge Clear) begin
    if (!Clear) Q <= 1'b0;
    else if (t) Q <= ~Q;
end

endmodule

module bcd_cntr (   input clear, clk,
                    output [3:0] q)
;

wire clr = ~(q[3] & q[1]) & clear;

t_ff u0 (.t(1'b1),.Clear(clr),.Clk(clk),.Q(q[0]));
t_ff u1 (.t(1'b1),.Clear(clr),.Clk(q[0]),.Q(q[1]));
t_ff u2 (.t(1'b1),.Clear(clr),.Clk(q[1]),.Q(q[2]));
t_ff u3 (.t(1'b1),.Clear(clr),.Clk(q[2]),.Q(q[3]));

endmodule