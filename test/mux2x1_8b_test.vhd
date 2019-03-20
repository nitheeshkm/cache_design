library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mux2x1_8b_test is

end mux2x1_8b_test;

architecture test of mux2x1_8b_test is

component mux2x1_8b
  port (
    A  : in  std_logic_vector(7 downto 0);
    B   	: in  std_logic_vector(7 downto 0);
    sel      : in  std_logic;
    X   : out std_logic_vector(7 downto 0)
);
end component;

for mux2x1_8b_1 : mux2x1_8b use entity work.mux2x1_8b(structural);

signal A1 : std_logic_vector(7 downto 0);
signal B1 : std_logic_vector(7 downto 0);
signal X1 : std_logic_vector(7 downto 0);
signal sel1 : std_logic;

procedure print_output is
   variable out_line: line;

   begin
--   write (out_line, string'(" Memory "));
--   write (out_line, mem);
--   writeline(output, out_line);
   
--   write (out_line, string'(" CPU "));
--   write (out_line, cpu);
--   writeline(output, out_line);
   
--   write (out_line, string'(" Select "));
--   write (out_line, selectbit);
--   writeline(output, out_line);
   
--   write (out_line, string'(" Output "));
--   write (out_line, outb);
--   writeline(output, out_line);
   
end print_output;

begin

mux2x1_8b_1 : mux2x1_8b port map (A1, B1, sel1, X1);

io_process : process
   variable out_line: line;
   
begin
A1 <= "01010101";
B1 <= "10101010";
sel1 <= '0';

wait for 10 ns;

print_output;

A1 <= "01010101";
B1 <= "10101010";
sel1 <= '1';

wait for 10 ns;
print_output;

end process io_process;
	
end test;