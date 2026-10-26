module traffic_light (  input clk, clear,
                        output [2:0] light)
;

localparam IDLE = 3'b000, R = 3'b001, G = 3'b100, Y = 3'b010;
reg [2:0] next_state, current_state;

always @ (posedge clk) begin
    if (!clear) current_state <= IDLE;
    else current_state <= next_state;
end

always @ (current_state) begin
    next_state = current_state;
    case (current_state)
        IDLE : next_state = R;
        R : next_state = G;
        G : next_state = Y;
        Y : next_state = R;
        default : next_state = IDLE;
    endcase
end

assign light = current_state;

endmodule