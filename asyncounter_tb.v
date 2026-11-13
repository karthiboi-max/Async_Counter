

module async_counter_tb;

reg clk;
reg reset;

wire [3:0] count;

// Instantiate DUT
async_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test sequence
initial begin

    $monitor("Time=%0t | Reset=%b | Count=%b (%d)",
              $time, reset, count, count);

    // Apply reset
    reset = 1;
    #10;

    reset = 0;

    // Run counter
    #200;

    // Apply reset again
    reset = 1;
    #10;

    reset = 0;

    #50;

    $finish;
end

endmodule
