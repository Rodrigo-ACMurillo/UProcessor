----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:55 04/01/2016 
-- Design Name: 
-- Module Name:    SUM - arqUProcessor 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUM is
    Port ( cFour : in  STD_LOGIC_VECTOR (31 downto 0);
           nPCOut : in  STD_LOGIC_VECTOR (31 downto 0);
           SUMOut : out  STD_LOGIC_VECTOR (31 downto 0));
end SUM;

architecture arqUProcessor of SUM is

begin
	process(cFour,nPCOut)
		begin
			SUMOut <= cFOur + nPCOut;
	end process;
end arqUProcessor;

