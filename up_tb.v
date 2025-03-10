module testbench;
    reg clear_b;
    reg CLK;
    reg Up;
    wire [3:0]A;

up_counter UUT (clear_b, CLK, Up, A);

// Generate clock signal (10 ns period)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

// Test stimulus
    initial begin
        $dumpfile("up_counter.vcd"); 
        $dumpvars(0, testbench);
       $monitor("CLK = %b | clear_b = %b | Up = %b | A = %b",CLK,clear_b,Up,A);
        clear_b = 0; Up = 0;
        #10 clear_b = 1; // Release reset

        // Count up
        Up = 1; 
        #200; // Count for a few cycles
        // Reset the counter
        clear_b = 0;
        #10 clear_b = 1;
        // Count up again
        Up = 1;
        #100;

       // End the simulation
        $finish;
    end
endmodule
