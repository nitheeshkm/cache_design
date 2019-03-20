
library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine_test is

end state_machine_test;

architecture test of state_machine_test is

component state_machine
port ( clk : in  std_logic; 
       reset : in std_logic;
	   start : in std_logic;
	   r_m,r_h,w_m,w_h : in std_logic);
end component;

for state_machine_1: state_machine use entity work.state_machine(structural);
signal clk1,reset1,start1,r_m1,r_h1,w_m1,w_h1,clock: std_logic;

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

  clk1 <= clock;
state_machine_1 : state_machine port map (clk1,reset1,start1,r_m1,r_h1,w_m1,w_h1);

  clking : process
  begin
    clock<= '1', '0' after 5 ns;
    wait for 10 ns;
  end process clking;

io_process: process
   variable out_line: line;
   
begin
       
reset1 <= '1';
start1 <= '0';
r_m1 <= '0';
r_h1 <= '0';
w_m1 <= '0';
w_h1 <= '0';
wait for 20 ns;

reset1 <= '1';

wait for 10 ns;

reset1 <= '0';

wait for 15 ns;

start1 <= '1';
r_m1 <= '1';
wait for 10 ns;

start1 <= '1';
wait for 10 ns;
start1 <= '1';
r_m1 <= '1';
wait for 10 ns;
start1 <= '0';
r_m1<='0';
wait for 200 ns;
reset1 <= '1';
wait for 10 ns;
reset1 <= '0';

wait for 50 ns;
	  
print_output;

end process;
	
end test;
