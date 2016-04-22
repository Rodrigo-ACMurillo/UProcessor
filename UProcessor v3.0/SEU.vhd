----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:16 04/01/2016 
-- Design Name: 
-- Module Name:    SEU - arqUProcessor 
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

entity SEU is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           sign_next : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arqUProcessor of SEU is

begin
	process(imm13)
		begin
			if (imm13(12) = '0') then
				sign_next(12 downto 0) <= imm13;
				sign_next(31 downto 12) <= (others => '0');
			else
				sign_next(12 downto 0) <= imm13;
				sign_next(31 downto 13) <= (others => '1');
			end if;
	end process;		
end arqUProcessor;

