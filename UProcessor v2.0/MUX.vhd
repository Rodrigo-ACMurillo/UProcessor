----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:30 04/01/2016 
-- Design Name: 
-- Module Name:    MUX - arqUProcessor 
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

entity MUX is
    Port ( CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           sign_next : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           MUXOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture arqUProcessor of MUX is

begin
	process(CRs2,sign_next,i)
		begin
			if(i = '0') then
				MUXOut <= CRs2;
			else 
				if (i = '1') then
					MUXOut <= sign_next;
				end if;
			end if;
	end process;
end arqUProcessor;