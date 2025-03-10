module up_counter(
    input wire clear_b,
    input wire CLK,
    input wire Up,
   output wire [3:0]A
);
wire w1,w2,w3;
    and2 and2_1(Up,A[0],w1);
    and2 and2_2(w1,A[1],w2);
    and2 and2_3(w2,A[2],w3);
    // Instantiate T Flip-Flops
    t_flip_flop TFF0(Up,CLK,clear_b,A[0]);
    t_flip_flop TFF1(w1,CLK,clear_b,A[1]);
    t_flip_flop TFF2(w2,CLK,clear_b,A[2]);
    t_flip_flop TFF3(w3,CLK,clear_b,A[3]);
endmodule
