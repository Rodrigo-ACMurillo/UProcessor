----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:36:55 03/31/2016 
-- Design Name: 
-- Module Name:    CU - arqUProcessor 
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

entity CU is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           opALU : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture arqUProcessor of CU is

begin
	process(op,op3)
		begin
			if (op = "10") then
				case op3 is
					when "000000" => opALU <= "000000"; --Suma
					when "000100" => opALU <= "000100"; --Resta
					when "000001" => opALU <= "000001"; --And
					when "000010" => opALU <= "000010"; --Or
					when "000110" => opALU <= "000110"; --OrN
					when "000011" => opALU <= "000011"; --Xor
					when "000111" => opALU <= "000111"; --Xnor
					when "000101" => opALU <= "000101"; --AndN
					--Instrucciones ..cc
					when "001001" => opALU <= "001001"; --Addcc
					when "001100" => opALU <= "001100"; --Subcc
					when "001111" => opALU <= "001111"; --Andcc*
					when "010001" => opALU <= "010001"; --Orcc*
					when "010010" => opALU <= "010010"; --OrNcc*
					when "010110" => opALU <= "010110"; --Xorcc*
					when "010100" => opALU <= "010100"; --Xnorcc*
					when "010000" => opALU <= "010000"; --Nandcc*
					--Instrucciones ..x[cc]?
					when "001010" => opALU <= "001010"; --Addx
					when "001011" => opALU <= "001011"; --Addxcc
					when "001101" => opALU <= "001101"; --Subx
					when "001110" => opALU <= "001110"; --Subxcc
					when others   => opALU <= "111111"; --Otros valores
				end case;
			end if;
	end process;
end arqUProcessor;

