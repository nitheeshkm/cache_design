library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity hit_miss_test is

end hit_miss_test;

architecture test of hit_miss_test is

component hit_miss
  port (
    cache_tag_valid   : in  std_logic_vector(3 downto 0);
    cpu_tag   : in  std_logic_vector(2 downto 0);
    cpu_rw  : in std_logic;
    sm_en : in std_logic;
    w_m,r_m,w_h,r_h : out std_logic);
end component;

for hit_miss_1: hit_miss use entity work.hit_miss(structural);
signal cpu_rw1,sm_en1,w_m1,w_h1,r_m1,r_h1: std_logic;
signal cache_tag_valid1 :std_logic_vector(3 downto 0);
signal cpu_tag1 : std_logic_vector(2 downto 0);

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

hit_miss_1 : hit_miss port map (cache_tag_valid1,cpu_tag1,cpu_rw1,sm_en1,w_m1,r_m1,w_h1,r_h1);

io_process: process
   variable out_line: line;
   
begin

cache_tag_valid1 <= "1010";
cpu_tag1 <= "010";
cpu_rw1	<= '1';
sm_en1	<= '1';

wait for 10 ns;

print_output;

cache_tag_valid1 <= "1010";
cpu_tag1 <= "010";
cpu_rw1	<= '0';
sm_en1	<= '1';


wait for 10 ns;

print_output;


cache_tag_valid1 <= "1110";
cpu_tag1 <= "010";
cpu_rw1	<= '1';
sm_en1	<= '1';

wait for 10 ns;

print_output;


cache_tag_valid1 <= "1110";
cpu_tag1 <= "010";
cpu_rw1	<= '0';
sm_en1	<= '1';

wait for 10 ns;

cache_tag_valid1 <= "0010";
cpu_tag1 <= "010";
cpu_rw1	<= '1';
sm_en1	<= '1';

wait for 10 ns;


cache_tag_valid1 <= "0010";
cpu_tag1 <= "010";
cpu_rw1	<= '0';
sm_en1	<= '1';

wait for 10 ns;


print_output;

end process;
	
end test;
