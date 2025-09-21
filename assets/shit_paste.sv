reg [31:0] prng_state;

always @(posedge clk) begin
   
    prng_state <= {prng_state[30:0], prng_state[31] ^ prng_state[21] ^ prng_state[0]};

    if (prng_state[23:0] == 24'h000000) begin
        stealth_mode <= (prng_state[26:24] + ghost_counter[2:0]) & 7;
    end

end