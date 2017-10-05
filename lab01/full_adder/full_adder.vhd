-- project: lab01 - mc602
-- company: unicamp
-- author : ciro.ceissler@gmail.com

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity full_adder is

  generic
  (
    DATA_WIDTH : natural := 16 
  );

  port 
  (
    a    : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
    b    : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
    cin  : in  std_logic;
    s    : out std_logic_vector((DATA_WIDTH - 1) downto 0);
    cout : out std_logic
  );

end entity;

architecture rtl of full_adder is
  signal sum : std_logic_vector(4 downto 0);
begin

  sum  <= ('0' & a) + b + cin;
  s    <= sum(3 downto 0);
  cout <= sum(4);

end rtl;

