library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity tag_valid_test is

end tag_valid_test;

architecture test of tag_valid_test is

component tag_valid
port ( din :  in std_logic_vector(3 downto 0);
       blk_en0, blk_en1,blk_en2,blk_en3,blk_en4,blk_en5,blk_en6,blk_en7 : in std_logic;
       rw_en : in std_logic;
       dout : out std_logic_vector(3 downto 0));
end component;

for tag_valid_1: tag_valid use entity work.tag_valid(structural);
signal rw_en1,blk_en01, blk_en11,blk_en21,blk_en31,blk_en41,blk_en51,blk_en61,blk_en71 : std_logic;
signal din1, dout1 :std_logic_vector(3 downto 0);

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

tag_valid_1 : tag_valid port map (din1,blk_en01, blk_en11,blk_en21,blk_en31,blk_en41,blk_en51,blk_en61,blk_en71, rw_en1, dout1);

io_process: process
   variable out_line: line;
   
begin

din1 <= "1010";
rw_en1 <= '0';
blk_en01	<= '1';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '0';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';

wait for 10 ns;

print_output;

rw_en1 <= '0';
blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '1';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';

wait for 2 ns;
din1 <= "1010";
wait for 10 ns;

print_output;


rw_en1 <= '0';
blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '0';
blk_en51	<= '1';
blk_en61	<= '0';
blk_en71	<= '0';
wait for 2 ns;
din1 <= "1100";
wait for 10 ns;

print_output;


rw_en1 <= '0';

blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '1';
blk_en41	<= '0';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';

wait for 2 ns;
din1 <= "1110";
wait for 10 ns;

print_output;
rw_en1 <= '1';

blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '0';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';
wait for 10 ns;


blk_en01	<= '1';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '0';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';
wait for 10 ns;

print_output;

rw_en1 <= '1';

blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '1';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';
wait for 2 ns;

wait for 10 ns;

print_output;

rw_en1 <= '1';

blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '0';
blk_en41	<= '0';
blk_en51	<= '1';
blk_en61	<= '0';
blk_en71	<= '0';

wait for 10 ns;

print_output;

rw_en1 <= '1';
blk_en01	<= '0';
blk_en11	<= '0';
blk_en21	<= '0';
blk_en31	<= '1';
blk_en41	<= '0';
blk_en51	<= '0';
blk_en61	<= '0';
blk_en71	<= '0';

wait for 10 ns;

print_output;

end process;
	
end test;
