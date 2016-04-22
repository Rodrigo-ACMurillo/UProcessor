----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:08 04/22/2016 
-- Design Name: 
-- Module Name:    PSR - arqUProcessor 
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

entity PSR is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture arqUProcessor of PSR is

begin
	process(clk,rst,nzvc)
		begin
			if (rising_edge(clk))then
				if(rst='0') then
					c <= '0';
				else
					c <= nzvc(3);
				end if;
			end if;
	end process;
end arqUProcessor;

