----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:12:16 03/31/2016 
-- Design Name: 
-- Module Name:    ALU - arqUProcessor 
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
use IEEE.STD_LOGIC_UNSIGNED.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           opALU : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arqUProcessor of ALU is

begin
	process(CRs1,CRs2,opALU)
		begin
			case opALU is 
				when "000000" => ALUResult <= (CRs1 + CRs2); --Suma
				when "000100" => ALUResult <= (CRs1 - CRs2); --Resta
				when "000001" => ALUResult <= (CRs1 and CRs2); --And
				when "000010" => ALUResult <= (CRs1 or CRs2); --Or
				when "000110" => ALUResult <= (CRs1 nor CRs2); --OrN
				when "000011" => ALUResult <= (CRs1 xor CRs2); --Xor
				when "000111" => ALUResult <= (CRs1 xnor CRs2); --Xnor
				when "000101" => ALUResult <= (CRs1 nand CRs2); --AndN
				when others => ALUResult <= (others => '0');
			end case;
	end process;
end arqUProcessor;

