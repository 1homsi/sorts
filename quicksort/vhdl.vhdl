library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity quicksort_tb is
end quicksort_tb;

architecture sim of quicksort_tb is
    type int_array is array (0 to 6) of integer;
    signal arr : int_array := (3, 6, 8, 10, 1, 2, 1);

    procedure partition(variable a : inout int_array; low, high : in integer; p : out integer) is
        variable pivot, tmp, i : integer;
    begin
        pivot := a(high); i := low;
        for j in low to high - 1 loop
            if a(j) <= pivot then
                tmp := a(i); a(i) := a(j); a(j) := tmp;
                i := i + 1;
            end if;
        end loop;
        tmp := a(i); a(i) := a(high); a(high) := tmp;
        p := i;
    end procedure;

    procedure quicksort(variable a : inout int_array; low, high : in integer) is
        variable p : integer;
    begin
        if low < high then
            partition(a, low, high, p);
            quicksort(a, low, p - 1);
            quicksort(a, p + 1, high);
        end if;
    end procedure;
begin
    process
        variable v_arr : int_array := (3, 6, 8, 10, 1, 2, 1);
    begin
        quicksort(v_arr, 0, 6);
        for i in 0 to 6 loop
            report integer'image(v_arr(i));
        end loop;
        wait;
    end process;
end sim;
