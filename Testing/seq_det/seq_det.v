module seq_det (input X, clk, clear,
                output reg Y, Z)
;

localparam IDLE = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
reg [2:0] next_state, current_state;
reg z;

initial z = 0;

always @ (posedge clk or negedge clear) begin
    if (!clear) begin 
        current_state <= IDLE;
        z <= 1'b0;
    end
    else begin 
        current_state <= next_state;
        if (current_state == S6) z <= 1'b1;
    end
end

always @ (*) begin
    next_state = current_state; Y=1'b0; Z=1'b0;
    case (current_state)
        IDLE : next_state = X ? S1 : S4;
        S1 : next_state = X ? S1 : S2;
        S2 : next_state = X ? S3 : S4;
        S3 : begin 
                next_state = X ? S6 : S2;
                if (!z) Y = 1'b1;
            end
        S4 : next_state = X ? S5 : S4;
        S5 : next_state = X ? S6 : S2;
        S6 : begin 
                next_state = X ? S1 : S2;
                Z = 1'b1;
            end
        default : next_state = IDLE;
    endcase
end

endmodule