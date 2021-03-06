--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:56:23 03/31/2016
-- Design Name:   
-- Module Name:   C:/Users/utp.CRIE/Documents/ProcesadorMonociclo/UProcessor/nPC_tb.vhd
-- Project Name:  UProcessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nPC
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
 
ENTITY nPC_tb IS
END nPC_tb;
 
ARCHITECTURE behavior OF nPC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPC
    PORT(
         data : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPC PORT MAP (
          data => data,
          clk => clk,
          rst => rst,
          dataOut => dataOut
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
		rst <= '1';
      wait for 50 ns;	
		rst <= '0';
		data <= "00000000000000000000000001000000";
		wait for 50 ns;
		data <= "00000000000000000000000001000100";
		wait for 50 ns;
		data <= "00000000000000000000010001000000";
      -- insert stimulus here 

      wait;
   end process;

END;
