--
--	core.vhd
--
--	cpu core of JOP3
--	
--	stack, pc connections
--	decode
--
--	resources on ACEX1K30-3
--
--	
--		 596 LCs, 54.3 MHz	hirarchy preserve, opt. delay
--
--		 917 LCs, 44.4 MHz	hirarchy preserve, opt. delay
--
--		1069 LCs, xx.x MHz	jtbl, no opt.
--		1045 LCs, xx.x MHz	cp removed
--		1019 LCs, 26.4 MHz	2001-12-05 (???)
--		1030 LCs, 29.4 MHz	instruction set change
--
--	todo:
--
--
--	2001-05-14	first version
--	2001-05-16	first instructions working, download of a blinking LED to ACEX
--	2001-05-26	delayed branch!!!
--	2001-07-03	adapted for jop3
--	2001-10-28	ldjpc, stjpc
--	2001-10-31	stbc (write content of jbc)
--	2001-12-04	cp removed
--	2001-12-08	instruction set changed to 8 bit
--	2002-03-24	shifter to stack
--	2003-08-14	movved bcfetch from fetch to core
--


library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity core is

generic (
	width		: integer := 32;	-- one data word
	addr_width	: integer := 8;		-- address bits of internal ram (sp,...)
	ioa_width	: integer := 3;		-- address bits of internal io (or 5/4)
	jpc_width	: integer := 10;	-- address bits of java byte code pc
	pc_width	: integer := 10;	-- address bits of internal instruction rom (upper half)
	i_width		: integer := 8		-- instruction width
);

port (
	clk, reset	: in std_logic;

-- memio connection

	bsy			: in std_logic;
	din			: in std_logic_vector(width-1 downto 0);
	addr		: out std_logic_vector(ioa_width-1 downto 0);
	rd, wr		: out std_logic;

-- interrupt from io
	irq			: in std_logic;
	irq_ena		: in std_logic;

	dout		: out std_logic_vector(width-1 downto 0)
);
end core;

architecture rtl of core is

--
--	components:
--
component bcfetch is
generic (jpc_width : integer; pc_width : integer);
port (
	clk, reset	: in std_logic;

	jpc_out		: out std_logic_vector(jpc_width-1 downto 0);	-- jpc read
	din			: in std_logic_vector(31 downto 0);				-- A from stack
	jpc_wr		: in std_logic;
	bc_wr		: in std_logic;

	jfetch		: in std_logic;
	jopdfetch	: in std_logic;

	zf, nf		: in std_logic;
	eq, lt		: in std_logic;

	jbr			: in std_logic;

	irq			: in std_logic;			-- interrupt request (positiv edge sensitive)
	irq_ena		: in std_logic;			-- interrupt enable (pendig int is fired on ena)

	jpaddr		: out std_logic_vector(pc_width-1 downto 0);	-- address for JVM
	opd			: out std_logic_vector(15 downto 0)				-- operands
);
end component;

component fetch is
generic (jpc_width : integer; pc_width : integer; i_width : integer);
port (
	clk, reset	: in std_logic;

	nxt, opd	: out std_logic;	-- jfetch and jopdfetch from table

	br			: in std_logic;
	pcwait		: in std_logic;
	jpaddr		: in std_logic_vector(pc_width-1 downto 0);

	dout		: out std_logic_vector(i_width-1 downto 0)		-- internal instruction (rom)
);
end component;

component stack is
generic (width : integer; addr_width : integer; jpc_width : integer);
port (
	clk, reset	: in std_logic;

	din			: in std_logic_vector(width-1 downto 0);
	dir			: in std_logic_vector(addr_width-1 downto 0);
	opd			: in std_logic_vector(15 downto 0);		-- index for vp load opd
	jpc			: in std_logic_vector(jpc_width-1 downto 0);	-- jpc read

	sel_amux	: in std_logic_vector(1 downto 0);		-- a, lmux, sum, diff
	sel_bmux	: in std_logic;							-- 0..a, 1..mem
	sel_log		: in std_logic_vector(1 downto 0);		-- pop/st, and, or, xor
	sel_shf		: in std_logic_vector(1 downto 0);		-- sr, sl, sra, (sr)
	sel_lmux	: in std_logic_vector(2 downto 0);		-- log, shl, mem, io, reg
	sel_imux	: in std_logic_vector(1 downto 0);		-- java opds
	sel_rmux	: in std_logic_vector(1 downto 0);		-- sp, vp, jpc
	sel_smux	: in std_logic_vector(1 downto 0);		-- sp, a, sp-1, sp+1

	sel_mmux	: in std_logic;							-- 0..a, 1..b
	sel_rda		: in std_logic_vector(2 downto 0);		-- 
	sel_wra		: in std_logic_vector(2 downto 0);		-- 

	wr_ena		: in std_logic;

	ena_b		: in std_logic;
	ena_vp		: in std_logic;

	zf			: out std_logic;
	nf			: out std_logic;
	eq			: out std_logic;
	lt			: out std_logic;
	dout		: out std_logic_vector(width-1 downto 0)
);
end component;

component decode is
generic (i_width : integer; addr_width : integer; ioa_width : integer);
port (
	clk, reset	: in std_logic;

	instr		: in std_logic_vector(i_width-1 downto 0);
	zf, nf		: in std_logic;
	eq, lt		: in std_logic;
	bsy			: in std_logic;

	br			: out std_logic;
	pcwait		: out std_logic;
	jbr			: out std_logic;

	io_addr		: out std_logic_vector(ioa_width-1 downto 0);
	rd, wr		: out std_logic;

	dir			: out std_logic_vector(addr_width-1 downto 0);

	sel_amux	: out std_logic_vector(1 downto 0);		-- a, lmux, sum, diff
	sel_bmux	: out std_logic;						-- 0..a, 1..mem
	sel_log		: out std_logic_vector(1 downto 0);		-- pop/st, and, or, xor
	sel_shf		: out std_logic_vector(1 downto 0);		-- sr, sl, sra, (sr)
	sel_lmux	: out std_logic_vector(2 downto 0);		-- log, shl, mem, io, reg
	sel_imux	: out std_logic_vector(1 downto 0);		-- java opds
	sel_rmux	: out std_logic_vector(1 downto 0);		-- sp, vp, jpc
	sel_smux	: out std_logic_vector(1 downto 0);		-- sp, a, sp-1, sp+1

	sel_mmux	: out std_logic;						-- 0..a, 1..b
	sel_rda		: out std_logic_vector(2 downto 0);		-- 
	sel_wra		: out std_logic_vector(2 downto 0);		-- 

	wr_ena		: out std_logic;

	ena_b		: out std_logic;
	ena_vp		: out std_logic;
	ena_jpc		: out std_logic;
	ena_bc		: out std_logic
);
end component;

--
--	Signals
--

--
-- (bc)fetch connections
--
	signal br			: std_logic;
	signal pcwait		: std_logic;
	signal jbr			: std_logic;

	signal jfetch		: std_logic;
	signal jopdfetch	: std_logic;

	signal jpaddr		: std_logic_vector(pc_width-1 downto 0);

	signal opd			: std_logic_vector(15 downto 0);
	signal jpc_out		: std_logic_vector(jpc_width-1 downto 0);
	signal instr		: std_logic_vector(i_width-1 downto 0);
	signal ena_jpc		: std_logic;
	signal ena_bc		: std_logic;

--
-- stack connections
--
	signal dir			: std_logic_vector(addr_width-1 downto 0);

	signal sel_amux		: std_logic_vector(1 downto 0);		-- a, lmux, sum, diff
	signal sel_bmux		: std_logic;						-- 0..a, 1..mem
	signal sel_log		: std_logic_vector(1 downto 0);		-- ld, and, or, xor
	signal sel_shf		: std_logic_vector(1 downto 0);		-- sr, sl, sra, (sr)
	signal sel_lmux		: std_logic_vector(2 downto 0);		-- log, shl, mem, io, reg
	signal sel_imux		: std_logic_vector(1 downto 0);		-- java opds
	signal sel_rmux		: std_logic_vector(1 downto 0);		-- sp, vp, jpc
	signal sel_smux		: std_logic_vector(1 downto 0);		-- sp, a, sp-1, sp+1

	signal sel_mmux		: std_logic;						-- 0..a, 1..b
	signal sel_rda		: std_logic_vector(2 downto 0);		-- 
	signal sel_wra		: std_logic_vector(2 downto 0);		-- 

	signal wr_ena		: std_logic;

	signal ena_b		: std_logic;
	signal ena_vp		: std_logic;

	signal stk_zf		: std_logic;
	signal stk_nf		: std_logic;
	signal stk_eq		: std_logic;
	signal stk_lt		: std_logic;
	signal stk_dout		: std_logic_vector(width-1 downto 0);

begin

	cmp_bcf: bcfetch generic map(jpc_width, pc_width)
			port map (clk, reset, jpc_out, stk_dout, ena_jpc, ena_bc,
			jfetch, jopdfetch,
			stk_zf, stk_nf, stk_eq, stk_lt, jbr,
			irq, irq_ena,
			jpaddr, opd);

	cmp_fch: fetch generic map (jpc_width, pc_width, i_width)
		port map (clk, reset, jfetch, jopdfetch,
			br, pcwait, jpaddr, instr);

	cmp_stk: stack generic map (width, addr_width, jpc_width)
		port map (clk, reset, din, dir, opd, jpc_out,
			sel_amux, sel_bmux, sel_log, sel_shf, sel_lmux, sel_imux, sel_rmux, sel_smux,
			sel_mmux, sel_rda, sel_wra,
			wr_ena, ena_b, ena_vp,
			stk_zf, stk_nf, stk_eq, stk_lt, stk_dout);

	cmp_dec: decode generic map (i_width, addr_width, ioa_width)
		port map (clk, reset, instr, stk_zf, stk_nf, stk_eq, stk_lt, bsy,
			br, pcwait, jbr,
			addr, rd, wr,
			dir,
			sel_amux, sel_bmux, sel_log, sel_shf, sel_lmux, sel_imux, sel_rmux, sel_smux,
			sel_mmux, sel_rda, sel_wra,
			wr_ena, ena_b, ena_vp, ena_jpc, ena_bc);

	dout <= stk_dout;

end rtl;
