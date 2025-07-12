(* FABulous, BelMap,
INIT=0,
INIT_1=1,
INIT_2=2,
INIT_3=3,
INIT_4=4,
INIT_5=5,
INIT_6=6,
INIT_7=7,
INIT_8=8,
INIT_9=9,
INIT_10=10,
INIT_11=11
*)
module Config_access (C_bit0, C_bit1, C_bit2, C_bit3, C_bit4, C_bit5, C_bit6, C_bit7, C_bit8, C_bit9, C_bit10, C_bit11, ConfigBits);
	parameter NoConfigBits = 12;// has to be adjusted manually (we don't use an arithmetic parser for the value)
	// Pin0
	(* FABulous, EXTERNAL *)output C_bit0; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit1; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit2; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit3; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit4; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit5; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit6; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit7; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit8; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit9; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit10; // EXTERNAL
	(* FABulous, EXTERNAL *)output C_bit11; // EXTERNAL
	// GLOBAL all primitive pins that are connected to the switch matrix have to go before the GLOBAL label
	(* FABulous, GLOBAL *)input [NoConfigBits-1:0] ConfigBits;

	// we just wire configuration bits to fabric top
	assign C_bit0 = ConfigBits[0];
	assign C_bit1 = ConfigBits[1];
	assign C_bit2 = ConfigBits[2];
	assign C_bit3 = ConfigBits[3];
	assign C_bit4 = ConfigBits[4];
	assign C_bit5 = ConfigBits[5];
	assign C_bit6 = ConfigBits[6];
	assign C_bit7 = ConfigBits[7];
	assign C_bit8 = ConfigBits[8];
	assign C_bit9 = ConfigBits[9];
	assign C_bit10 = ConfigBits[10];
	assign C_bit11 = ConfigBits[11];

endmodule
