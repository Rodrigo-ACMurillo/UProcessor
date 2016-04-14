----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:46 03/31/2016 
-- Design Name: 
-- Module Name:    PC - arqUProcessor 
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

entity PC is
    Port ( dataPC : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           dataOutPC : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture arqUProcessor of PC is

begin
	process(clk,rst,dataPC) 
		begin
			if (rst='1') then
				dataOut <= (others => '0');
			else 
				if (rising_edge(clk)) then
					dataOut <= data;
				end if;
			end if;
	end process;
end arqUProcessor;

