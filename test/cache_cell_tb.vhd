library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_cell_tb is

end cache_cell_tb;

architecture test of cache_cell_tb is

component cache_cell
	port(
			din	: in  std_logic;
			en  : in  std_logic;
			rw_en	: in  std_logic;
			dout	: out std_logic);
end component;

for cache_cell_1: cache_cell use entity work.cache_cell(structural);

signal din1, rw_en1, en1, dout1 : std_logic;

procedure print_output is
   variable out_line: line;

   begin
   write (out_line, string'(" din1:"));
   write (out_line, din1);
   write (out_line, string'(" en1:"));
   write (out_line, en1);
   write (out_line, string'(" rw_en1:"));
   write (out_line, rw_en1);
   writeline(output, out_line);
   write (out_line, string'(" dout:"));
   write (out_line, dout1);
   writeline(output, out_line);
end print_output;

begin

cache_cell_1 : cache_cell port map (din1, en1, rw_en1, dout1);

io_process: process
   variable out_line: line;
   
begin
din1 <= '1';
en1 <= '1';
rw_en1<= '0';

wait for 10 ns;

print_output;

en1 <= '1';
rw_en1 <= '1';

wait for 10 ns;
print_output;

din1 <= '0';
en1 <= '1';
rw_en1 <= '0';

wait for 10 ns;

print_output;


en1 <= '1';
rw_en1 <= '1';

wait for 10 ns;

end process;
	
end test;
