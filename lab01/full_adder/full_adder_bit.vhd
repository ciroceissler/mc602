-- project: lab01 - mc602
-- company: unicamp
-- author : ciro.ceissler@gmail.com
-- brief  : full adder 1 bit

library ieee;
use ieee.std_logic_1164.all;

entity full_adder_bit is

  port 
  (
    a     : in  std_logic;
    b     : in  std_logic;
    cin   : in  std_logic;
    s     : out std_logic;
    cout  : out std_logic
  );

end entity;

architecture rtl of full_adder_bit is
begin

  s    <= a XOR b XOR cin;
  cout <= (a AND b) OR (cin AND a) OR (cin AND b);

end rtl;
