
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_32b_tb is

end cache_32b_tb;

architecture test of cache_32b_tb is

component cache_32b
port ( din :  in std_logic_vector(7 downto 0);
       by_en0,by_en1,by_en2,by_en3 :in std_logic;
       blk_en : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(7 downto 0));
end component;

for cache_32b_1: cache_32b use entity work.cache_32b(structural);

signal rw_en1, by_en01,by_en11,by_en21,by_en31, blk_en1: std_logic;
signal din1, dout1 :std_logic_vector(7 downto 0);

procedure print_output is
   variable out_line: line;

   begin
   write (out_line, string'(" din1:"));
   write (out_line, din1);
--   write (out_line, string'(" en1:"));
--   write (out_line, en1);
   write (out_line, string'(" rw_en1:"));
   write (out_line, rw_en1);
   writeline(output, out_line);
   write (out_line, string'(" dout:"));
   write (out_line, dout1);
   writeline(output, out_line);
end print_output;

begin

cache_32b_1 : cache_32b port map (din1,by_en01,by_en11,by_en21,by_en31, blk_en1, rw_en1, dout1);

io_process: process
   variable out_line: line;
   
begin

din1 <= "10100000";
by_en01 <= '1';
by_en11 <= '0';
by_en21 <= '0';
by_en31 <= '0';
blk_en1 <= '1';
rw_en1<= '0';

wait for 10 ns;

by_en01 <= '0';
by_en11 <= '1';
by_en21 <= '0';
by_en31 <= '0';
blk_en1 <= '1';
rw_en1<= '0';

wait for 2 ns;
din1 <= "11111111";
wait for 10 ns;

by_en01 <= '0';
by_en11 <= '0';
by_en21 <= '1';
by_en31 <= '0';
blk_en1 <= '1';
rw_en1<= '0';

wait for 2 ns;
din1 <= "11000110";
wait for 10 ns;

print_output;

by_en01 <= '0';
by_en11 <= '0';
by_en21 <= '0';
by_en31 <= '1';
blk_en1 <= '1';
rw_en1<= '0';

wait for 2 ns;
din1 <= "11101010";
wait for 10 ns;


print_output;

--din1 <= "11010111";
by_en01 <= '1';
by_en11 <= '0';
by_en21 <= '0';
by_en31 <= '0';
blk_en1 <= '1';
rw_en1<= '1';
wait for 10 ns;

print_output;
rw_en1<= '1';
--din1 <= "11010111";
by_en01 <= '0';
by_en11 <= '1';
by_en21 <= '0';
by_en31 <= '0';
blk_en1 <= '1';

wait for 10 ns;

print_output;
rw_en1<= '1';
--din1 <= "11010111";
by_en01 <= '0';
by_en11 <= '0';
by_en21 <= '1';
by_en31 <= '0';
blk_en1 <= '1';


wait for 10 ns;

print_output;

--din1 <= "11010111";
by_en01 <= '0';
by_en11 <= '0';
by_en21 <= '0';
by_en31 <= '1';
blk_en1 <= '1';
rw_en1<= '1';

wait for 10 ns;

print_output;
end process;
	
end test;
