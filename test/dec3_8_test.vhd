
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity dec3_8_test is

end dec3_8_test;

architecture test of dec3_8_test is

component dec3_8
port(s0,s1,s2: in std_logic;
y0,y1,y2,y3,y4,y5,y6,y7 : out std_logic);
end component;

for dec3_8_1: dec3_8 use entity work.dec3_8(structural);
signal s01,s11,s21,y01,y11,y21,y31,y41,y51,y61,y71 : std_logic;

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

dec3_8_1 : dec3_8 port map (s01,s11,s21,y01,y11,y21,y31,y41,y51,y61,y71);


io_process: process
   variable out_line: line;
   
begin
       
--en1<='0';
s01 <= '0';
s11 <= '0';
s21 <= '0';


wait for 10 ns;
--en1<='1';
s01 <= '0';
s11 <= '0';
s21 <= '1';


wait for 10 ns;	  
--en1<='1';
s01 <= '0';
s11 <= '1';
s21 <= '0';


wait for 10 ns;
--en1<='1';
s01 <= '0';
s11 <= '1';
s21 <= '1';


wait for 10 ns;
--en1<='1';
s01 <= '1';
s11 <= '0';
s21 <= '0';


wait for 10 ns;
--en1<='1';
s01 <= '1';
s11 <= '0';
s21 <= '1';


wait for 10 ns;
--en1<='1';
s01 <= '1';
s11 <= '1';
s21 <= '0';


wait for 10 ns;
--en1<='1';
s01 <= '1';
s11 <= '1';
s21 <= '1';


wait for 10 ns;


print_output;

end process;
	
end test;

