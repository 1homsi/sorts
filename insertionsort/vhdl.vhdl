library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity insertion_sort is
    generic (N : integer := 8);
    port (
        clk  : in  std_logic;
        rst  : in  std_logic;
        din  : in  integer_vector(0 to N-1);
        dout : out integer_vector(0 to N-1);
        done : out std_logic
    );
end entity;

architecture behavioral of insertion_sort is
begin
    process(clk, rst)
        variable arr : integer_vector(0 to N-1);
        variable key : integer;
        variable j   : integer;
    begin
        if rst = '1' then
            done <= '0';
        elsif rising_edge(clk) then
            arr := din;
            for i in 1 to N-1 loop
                key := arr(i);
                j   := i - 1;
                while j >= 0 and arr(j) > key loop
                    arr(j+1) := arr(j);
                    j := j - 1;
                end loop;
                arr(j+1) := key;
            end loop;
            dout <= arr;
            done <= '1';
        end if;
    end process;
end architecture;
