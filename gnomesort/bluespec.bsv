package GnomeSort;

interface GnomeSortIfc;
    method Action start();
    method Bool done();
endinterface

module mkGnomeSort (GnomeSortIfc);
    Reg#(int) i <- mkReg(0);
    Reg#(Bool) isDone <- mkReg(False);
    int n = 10;
    Vector#(10, Reg#(int)) arr <- replicateM(mkReg(0));

    rule gnome_step if (!isDone && i < n);
        if (i == 0 || arr[i] >= arr[i-1])
            i <= i + 1;
        else begin
            int tmp = arr[i];
            arr[i] <= arr[i-1];
            arr[i-1] <= tmp;
            i <= i - 1;
        end
    endrule

    rule done_rule if (i >= n);
        isDone <= True;
    endrule

    method Action start();
        i <= 0;
        isDone <= False;
    endmethod

    method Bool done() = isDone;
endmodule

endpackage
