module insertion_sort_sv #(parameter N = 8) (
    input  logic       clk,
    input  logic       rst_n,
    input  logic [7:0] data_in  [N],
    output logic [7:0] data_out [N],
    output logic       done
);
    logic [7:0] arr [N];
    logic [7:0] key;
    int i, j;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            done <= '0;
        end else begin
            arr = data_in;
            for (i = 1; i < N; i++) begin
                key = arr[i];
                j = i - 1;
                while (j >= 0 && arr[j] > key) begin
                    arr[j+1] = arr[j];
                    j--;
                end
                arr[j+1] = key;
            end
            data_out <= arr;
            done <= '1;
        end
    end
endmodule
