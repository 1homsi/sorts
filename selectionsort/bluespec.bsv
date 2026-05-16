import Vector::*;

module mkSelectionSort(Empty);
    Vector#(5, Reg#(UInt#(8))) arr <- replicateM(mkReg(0));
    Reg#(Bool) done <- mkReg(False);
    
    rule init(!done);
        arr[0] <= 5; arr[1] <= 3; arr[2] <= 1; arr[3] <= 4; arr[4] <= 2;
        done <= True;
    endrule
    
    rule sort(done);
        for (Integer i = 0; i < 4; i = i + 1) begin
            Integer minIdx = i;
            for (Integer j = i+1; j < 5; j = j + 1) begin
                if (arr[j] < arr[minIdx]) minIdx = j;
            end
            UInt#(8) tmp = arr[i];
            arr[i] <= arr[minIdx];
            arr[minIdx] <= tmp;
        end
    endrule
endmodule
