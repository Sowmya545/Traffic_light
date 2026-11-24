module tb_traffic_light();

    reg clk;
    reg reset;

    wire [1:0] NS_light;
    wire [1:0] EW_light;

    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .NS_light(NS_light),
        .EW_light(EW_light)
    );

    // Generate clock (10 ns period)
    always #5 clk = ~clk;

    // Generate waveform for EPWave
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light);
    end

    // Test sequence
    initial begin
        clk = 0;
        reset = 1;

        #10 reset = 0;

        // Run for 100 ns
        #100 $finish;
    end



endmodule
