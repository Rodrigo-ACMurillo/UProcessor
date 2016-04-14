----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:56 04/14/2016 
-- Design Name: 
-- Module Name:    UProcessorSecondVersion - arqUProcessor 
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

entity UProcessorSecondVersion is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           UPOut : out  STD_LOGIC_VECTOR (31 downto 0));
end UProcessorSecondVersion;

architecture arqUProcessor of UProcessorSecondVersion is
	COMPONENT ALU
	PORT(
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		opALU : IN std_logic_vector(5 downto 0);          
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT nPC
	PORT(
		data : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		dataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SUM
	PORT(
		cFour : IN std_logic_vector(31 downto 0);
		nPCOut : IN std_logic_vector(31 downto 0);          
		SUMOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT IM
	PORT(
		address : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT CU
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		opALU : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT SEU
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		sign_next : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MUX
	PORT(
		CRs2 : IN std_logic_vector(31 downto 0);
		sign_next : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		MUXOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT registerFile
	PORT(
		reset : IN std_logic;
		registerSource1 : IN std_logic_vector(4 downto 0);
		registerSource2 : IN std_logic_vector(4 downto 0);
		registerDestination : IN std_logic_vector(4 downto 0);
		dataToWrite : IN std_logic_vector(31 downto 0);          
		contentRegisterSource1 : OUT std_logic_vector(31 downto 0);
		contentRegisterSource2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	signal nPCSalida, SUMSalida, PCSalida, IMSalida, MUXSalida, ALUSalida, RFSalida_1, RFSalida_2, SEUSalida : std_logic_vector(31 downto 0);
	signal CUSalida : std_logic_vector(5 downto 0);
begin
	Inst_nPC: nPC PORT MAP(
		data => SUMSalida,
		clk => clk,
		rst => rst,
		dataOut => nPCSalida
	);
	
	Inst_PC: nPC PORT MAP(
		data => nPCSalida,
		clk => clk,
		rst => rst,
		dataOut => PCSalida
	);
	
	Inst_SUM: SUM PORT MAP(
		cFour => x"00000001",
		nPCOut => nPCSalida,
		SUMOut => SUMSalida
	);
	
	Inst_ALU: ALU PORT MAP(
		CRs1 => RFSalida_1,
		CRs2 => MUXSalida,
		opALU => CUSalida,
		ALUResult => ALUSalida
	);
	
	Inst_IM: IM PORT MAP(
		address => PCSalida,
		rst => rst,
		outInstruction => IMSalida
	);
	
	Inst_CU: CU PORT MAP(
		op => IMSalida(31 downto 30),
		op3 => IMSalida(24 downto 19),
		opALU => CUSalida
	);
	
	Inst_SEU: SEU PORT MAP(
		imm13 => IMSalida(12 downto 0),
		sign_next => SEUSalida
	);
	
	Inst_MUX: MUX PORT MAP(
		CRs2 => RFSalida_2,
		sign_next => SEUSalida,
		i => IMSalida(13),
		MUXOut => MUXSalida
	);
	
	Inst_registerFile: registerFile PORT MAP(
		reset => rst,
		registerSource1 => IMSalida(18 downto 14),
		registerSource2 => IMSalida(4 downto 0),
		registerDestination => IMSalida(29 downto 25),
		dataToWrite => ALUSalida,
		contentRegisterSource1 => RFSalida_1,
		contentRegisterSource2 => RFSalida_2
	);
	UPOut <= ALUSalida;
end arqUProcessor;

