library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SelectionSort is
    port (
        clk : in std_logic;
        done : out std_logic
    );
end SelectionSort;

architecture Behavioral of SelectionSort is
    type arr_type is array (0 to 4) of integer;
    signal arr : arr_type := (5, 3, 1, 4, 2);
begin
    process(clk)
        variable min_idx, tmp : integer;
    begin
        if rising_edge(clk) then
            for i in 0 to 3 loop
                min_idx := i;
                for j in i+1 to 4 loop
                    if arr(j) < arr(min_idx) then
                        min_idx := j;
                    end if;
                end loop;
                tmp := arr(i);
                arr(i) <= arr(min_idx);
                arr(min_idx) <= tmp;
            end loop;
            done <= '1';
        end if;
    end process;
end Behavioral;
