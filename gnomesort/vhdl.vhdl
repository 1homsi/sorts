library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gnome_sort is
    generic (N : integer := 10);
    port (
        clk    : in std_logic;
        rst    : in std_logic;
        start  : in std_logic;
        done   : out std_logic
    );
end gnome_sort;

architecture behavioral of gnome_sort is
    type int_array is array (0 to N-1) of integer;
    signal arr : int_array := (5, 3, 8, 1, 9, 2, 7, 4, 6, 0);
    signal i   : integer := 0;
    signal tmp : integer;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            i <= 0;
            done <= '0';
        elsif rising_edge(clk) then
            if i >= N then
                done <= '1';
            elsif i = 0 or arr(i) >= arr(i-1) then
                i <= i + 1;
            else
                tmp <= arr(i);
                arr(i) <= arr(i-1);
                arr(i-1) <= tmp;
                i <= i - 1;
            end if;
        end if;
    end process;
end behavioral;
