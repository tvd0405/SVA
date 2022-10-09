--------------------------------------------------
--   DUT With assertions
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dut is
port(
  clk  : in  std_logic;
  req  : in  std_logic;
  reset  : in  std_logic;
  gnt  : out  std_logic);
end dut;
architecture rtl of dut is
  signal internal : std_logic;
  signal count : std_logic_vector(15 downto 0) := (others => '0');
begin
process(clk)
begin
 if rising_edge(clk) then
     internal <= req;
     gnt <= internal;
     count <= count + "10";
 end if;
end process;
end rtl;
