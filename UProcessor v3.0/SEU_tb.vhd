--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:39 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/UTP.XXX/Documents/unicycleprocessor-master/SEU_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU
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
 
ENTITY SEU_tb IS
END SEU_tb;
 
ARCHITECTURE behavior OF SEU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         sign_next : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal sign_next : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm13 => imm13,
          sign_next => sign_next
        );

   -- Stimulus process
   stim_proc: process
   begin		
		imm13 <= "0000000100000";
      wait for 50 ns;	
			imm13 <= "1000000000001";
      wait;
   end process;

END;
