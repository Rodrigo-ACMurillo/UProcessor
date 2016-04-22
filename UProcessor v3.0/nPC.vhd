----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:34 03/31/2016 
-- Design Name: 
-- Module Name:    nPC - arqUProcessor 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nPC is
    Port ( data : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture arqUProcessor of nPC is

begin
	process(data,clk,rst)
		begin
			if (rst='0') then
				dataOut <= (others => '0');
			else 
				if (rising_edge(clk)) then
					dataOut <= data;
				end if;
			end if;
	end process;
end arqUProcessor;

