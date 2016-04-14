--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:49:58 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/UTP.XXX/Documents/unicycleprocessor-master/ALU_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         CRs1 : IN  std_logic_vector(31 downto 0);
         CRs2 : IN  std_logic_vector(31 downto 0);
         opALU : IN  std_logic_vector(5 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal opALU : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          CRs1 => CRs1,
          CRs2 => CRs2,
          opALU => opALU,
          ALUResult => ALUResult
        );

   -- Stimulus process
   stim_proc: process
   begin		
		CRs1 <= "00000000000000000000000000000011";
		CRs2 <= "00000000000000000000000000000010";
      wait for 50 ns;	
				opALU <= "000000";  -- => ALUResult <= (CRs1 + CRs2); Suma
		wait for 50 ns;
				opALU <= "000100"; -- => ALUResult <= (CRs1 - CRs2); Resta
		wait for 50 ns;
				opALU <= "000001";  -- => ALUResult <= (CRs1 and CRs2); And
		wait for 50 ns;
				opALU <= "000010";  -- => ALUResult <= (CRs1 or CRs2); Or
		wait for 50 ns;
				opALU <= "000110";  -- => ALUResult <= (CRs1 nor CRs2); OrN
		wait for 50 ns;
				opALU <= "000011";  -- => ALUResult <= (CRs1 xor CRs2); Xor
		wait for 50 ns;
				opALU <= "000111";  -- => ALUResult <= (CRs1 xnor CRs2); Xnor
		wait for 50 ns;
				opALU <= "000101";  -- => ALUResult <= (CRs1 nand CRs2); AndN
      wait;
   end process;

END;
