module selection_sort #(parameter N = 5, W = 8) (
    input  logic             clk, rst,
    input  logic [W-1:0]    arr_in [0:N-1],
    output logic [W-1:0]    arr_out [0:N-1],
    output logic             done
);
    logic [W-1:0] arr [0:N-1];
    int min_idx;
    logic [W-1:0] tmp;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            done <= '0;
        end else begin
            arr <= arr_in;
            for (int i = 0; i < N; i++) begin
                min_idx = i;
                for (int j = i+1; j < N; j++)
                    if (arr[j] < arr[min_idx]) min_idx = j;
                tmp = arr[i]; arr[i] = arr[min_idx]; arr[min_idx] = tmp;
            end
            arr_out <= arr;
            done <= '1;
        end
    end
endmodule
