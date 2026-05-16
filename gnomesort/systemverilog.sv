module gnome_sort_sv #(parameter N=10) (
    input  logic        clk, rst_n,
    input  logic [31:0] arr_in [N],
    output logic [31:0] arr_out [N],
    output logic        done
);
    logic [31:0] arr [N];
    int i;
    logic [31:0] tmp;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            foreach (arr[k]) arr[k] <= arr_in[k];
            i <= 0;
            done <= 0;
        end else if (!done) begin
            if (i >= N) begin
                foreach (arr[k]) arr_out[k] <= arr[k];
                done <= 1;
            end else if (i == 0 || arr[i] >= arr[i-1]) begin
                i <= i + 1;
            end else begin
                tmp <= arr[i];
                arr[i] <= arr[i-1];
                arr[i-1] <= tmp;
                i <= i - 1;
            end
        end
    end
endmodule
