--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:10:07 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/UTP.XXX/Documents/unicycleprocessor-master/CU_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU
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
 
ENTITY CU_tb IS
END CU_tb;
 
ARCHITECTURE behavior OF CU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         opALU : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal opALU : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          op => op,
          op3 => op3,
          opALU => opALU
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op <= "10";
      wait for 50 ns;	
			op3 <= "000000";  -- => ALUResult <= (CRs1 + CRs2); Suma
		wait for 50 ns;
			op3 <= "000100"; -- => ALUResult <= (CRs1 - CRs2); Resta
		wait for 50 ns;
			op3 <= "000001";  -- => ALUResult <= (CRs1 and CRs2); And
		wait for 50 ns;
			op3 <= "000010";  -- => ALUResult <= (CRs1 or CRs2); Or
		wait for 50 ns;
			op3 <= "000110";  -- => ALUResult <= (CRs1 nor CRs2); OrN
		wait for 50 ns;
			op3 <= "000011";  -- => ALUResult <= (CRs1 xor CRs2); Xor
		wait for 50 ns;
			op3 <= "000111";  -- => ALUResult <= (CRs1 xnor CRs2); Xnor
		wait for 50 ns;
			op3 <= "000101";  -- => ALUResult <= (CRs1 nand CRs2); AndN
      wait;
   end process;

END;
