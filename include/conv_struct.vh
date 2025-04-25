`ifndef __CONV_STRUCT__
`define __CONV_STRUCT__
package Conv;
    parameter WIDTH = 64;
    parameter LEN   = 4;

    typedef logic [WIDTH-1:0] data_t;
    //store only one integer
    typedef logic [WIDTH*2-1:0] result_t;
    //the result of the convolution

    typedef struct{
        data_t data [LEN-1:0];
        //this is an array storing four vectors
    } data_vector;
    //struct.data: logic [WIDTH-1:0] data [LEN-1:0]

endpackage
`endif