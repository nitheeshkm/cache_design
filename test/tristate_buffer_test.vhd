library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity tristate_buf_test is

end tristate_buf_test;

architecture test of tristate_buf_test is

component tristate_buf
	Port ( A    : in  STD_LOGIC; 
         EN   : in  STD_LOGIC;    
         Y    : out STD_LOGIC); 
end component;

for tristate_buf_1: tristate_buf use entity work.tristate_buf(structural);

signal A1,EN1,Y1 : std_logic;

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

tristate_buf_1 : tristate_buf port map (A1,EN1,Y1);

io_process: process
   variable out_line: line;
   
begin
A1 <= '1';
EN1 <= '1';

wait for 10 ns;

print_output;

A1 <= '0';
EN1 <= '1';

wait for 10 ns;
print_output;

A1 <= '1';
EN1 <= '0';

wait for 10 ns;

print_output;

A1 <= '0';
EN1 <= '0';

wait for 10 ns;

end process;
	
end test;
