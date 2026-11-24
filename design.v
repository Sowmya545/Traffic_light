module traffic_light_controller (
    input clk,
    input reset,
    output reg [1:0] NS_light,
    output reg [1:0] EW_light
);

    // State encoding
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state and output logic
    always @(*)
    begin
        next_state = S0;
        NS_light = 2'b00;
        EW_light = 2'b00;

        case (state)
            S0: begin
                NS_light = 2'b10;
                EW_light = 2'b00;
                next_state = S1;
            end

            S1: begin
                NS_light = 2'b01;
                EW_light = 2'b00;
                next_state = S2;
            end

            S2: begin
                NS_light = 2'b00;
                EW_light = 2'b10;
                next_state = S3;
            end

            S3: begin
                NS_light = 2'b00;
                EW_light = 2'b01;
                next_state = S0;
            end

            default: begin
                next_state = S0;
            end
        endcase
    end

endmodule
