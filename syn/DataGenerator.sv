`include"conv_struct.vh"
module DataGenerator(
    input clk,
    input rstn,
    input next_test,
    output reg valid,
    input ready,
    output [63:0] in_data,
    output Conv::data_vector kernel
);
    `include"initial_file.vh"
    reg [63:0] data [7:0];
    initial begin
        data[0] = 64'h7a0d84a592178378;
        data[1] = 64'h3c2ba266bbd58ebc;
        data[2] = 64'he159ba49caa49eb6;
        data[3] = 64'h6347f8232a14ffe4;
        data[4] = 64'hc49c33df7d6ff3b7;
        data[5] = 64'hfbc5cf60fcc47153;
        data[6] = 64'h21ebe1ff6f9e1721;
        data[7] = 64'hc45161128a9a7de1;
    end
    
    assign kernel.data[0]=64'h0040942c797673c4;
    assign kernel.data[1]=64'hf10010250b1e5d9c;
    assign kernel.data[2]=64'hed57acb99efdd502;
    assign kernel.data[3]=64'hc11de29c48c2e0e4;

    reg [2:0] index;
    always@(posedge clk or negedge rstn)begin
        if(~rstn) index <= 3'b111;
        else if(next_test) index <= index+3'b001;
    end

    always@(posedge clk or negedge rstn)begin
        if(~rstn) valid <= 1'b0;
        else if(next_test) valid <= 1'b1;
        else if(valid & ready) valid <= 1'b0;
    end

    assign in_data = data[index];

endmodule