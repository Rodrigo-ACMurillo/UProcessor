--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:42 04/14/2016
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Documents/UProcessor/UProcessor v2.0/UProcessorSecondVersion_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UProcessorSecondVersion
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
 
ENTITY UProcessorSecondVersion_tb IS
END UProcessorSecondVersion_tb;
 
ARCHITECTURE behavior OF UProcessorSecondVersion_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UProcessorSecondVersion
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         UPOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal UPOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UProcessorSecondVersion PORT MAP (
          clk => clk,
          rst => rst,
          UPOut => UPOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '0';
      wait for 40 ns;	
		rst <= '1';
      wait;
   end process;

END;
