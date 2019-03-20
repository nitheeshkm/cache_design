library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Dlatch_8b_test is

end Dlatch_8b_test;

architecture test of Dlatch_8b_test is

component Dlatch_8b
  port ( d   : in  std_logic_vector(7 downto 0);
         clk : in  std_logic;
         q   : out std_logic_vector(7 downto 0));
end component;

for Dlatch_8b_1: Dlatch_8b use entity work.Dlatch_8b(structural);

signal d1,q1 : std_logic_vector( 7  downto 0);
signal clk1 : std_logic;

procedure print_output is
   variable out_line: line;

   begin
--   write (out_line, string'(" din1:"));
--   write (out_line, din1);
--   write (out_line, string'(" en1:"));
--   write (out_line, en1);
--   write (out_line, string'(" rw_en1:"));
--   write (out_line, rw_en1);
--   writeline(output, out_line);
--   write (out_line, string'(" dout:"));
--   write (out_line, dout1);
--   writeline(output, out_line);
end print_output;

begin

Dlatch_8b_1 : Dlatch_8b port map (d1,clk1,q1);

io_process: process
   variable out_line: line;
   
begin

clk1<= '0';

wait for 10ns;

d1 <= "10101010";
clk1 <= '1';

wait for 10 ns;

print_output;

clk1 <= '0';
d1 <= "10101110";
wait for 10 ns;
print_output;

d1 <= "10101100";
clk1 <= '1';

wait for 10 ns;

print_output;
d1 <= "10101110";
clk1 <= '1';

wait for 10 ns;

clk1 <= '0';
wait for 10 ns;

clk1 <= '1';
wait for 10ns;
end process;
	
end test;
