library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity encoder4_2_test is

end encoder4_2_test;

architecture test of encoder4_2_test is

component encoder4_2
 port( i1 : in std_logic;
      i2 : in std_logic;
      i3 : in std_logic;
      o1 : out std_logic;
      o2 : out std_logic);
end component;

for encoder4_2_1: encoder4_2 use entity work.encoder4_2(structural);
signal i11,i21,i31,o11,o21: std_logic;

procedure print_output is
   variable out_line: line;

   begin
--   write (out_line, string'(" din1:"));
--   write (out_line, din1);
----   write (out_line, string'(" en1:"));
----   write (out_line, en1);
--   write (out_line, string'(" rw_en1:"));
--   write (out_line, rw_en1);
--   writeline(output, out_line);
--   write (out_line, string'(" dout:"));
--   write (out_line, dout1);
--   writeline(output, out_line);
end print_output;

begin

encoder4_2_1 : encoder4_2 port map (i11,i21,i31,o11,o21);

io_process: process
   variable out_line: line;
   
begin

i11<='0';
i21<='0';
i31<='0';

wait for 10 ns;

print_output;

i11<='0';
i21<='0';
i31<='1';


wait for 10 ns;

print_output;


i11<='0';
i21<='1';
i31<='0';

wait for 10 ns;

print_output;


i11<='1';
i21<='0';
i31<='0';


wait for 10 ns;


print_output;

end process;
	
end test;
