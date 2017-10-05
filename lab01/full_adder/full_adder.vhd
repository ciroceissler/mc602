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
  signal c : std_logic_vector(2 downto 0);

  component full_adder_unit
    generic
    (
      DATA_WIDTH : natural := 4
    );
    port
    (
      a    : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
      b    : in  std_logic_vector((DATA_WIDTH - 1) downto 0);
      cin  : in  std_logic;
      s    : out std_logic_vector((DATA_WIDTH - 1) downto 0);
      cout : out std_logic
    );
  end component;
begin
  STAGE0: full_adder_unit
        generic map
        (
          DATA_WIDTH => 4
        )
        port map
        (
          a    => a(3 downto 0),
          b    => b(3 downto 0),
          cin  => cin,
          s    => s(3 downto 0),
          cout => c(0)
        );

  STAGE1: full_adder_unit
        generic map
        (
          DATA_WIDTH => 4
        )
        port map
        (
          a    => a(7 downto 4),
          b    => b(7 downto 4),
          cin  => c(0),
          s    => s(7 downto 4),
          cout => c(1)
        );

  STAGE2: full_adder_unit
        generic map
        (
          DATA_WIDTH => 4
        )
        port map
        (
          a    => a(11 downto 8),
          b    => b(11 downto 8),
          cin  => c(1),
          s    => s(11 downto 8),
          cout => c(2)
        );

  STAGE3: full_adder_unit
        generic map
        (
          DATA_WIDTH => 4
        )
        port map
        (
          a    => a(15 downto 12),
          b    => b(15 downto 12),
          cin  => c(2),
          s    => s(15 downto 12),
          cout => cout
        );

end rtl;

