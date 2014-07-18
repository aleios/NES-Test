#ines.mapper		"none" 
#ines.mirroring		"Vertical"
#ines.battery		"no"
#ines.trainer		"no"
#ines.fourscreen	"no"
//#ines.prgrepeat		8 // 128K

#rom.banksize		16K
#chr.banksize		8K

// Includes
#include "nes.h"
#include "std.h"

//#include "main.h"

// RAM
#include "ram.asm"

// "pointers" to main and interrupts
#rom.bank			BANK_MAIN_ENTRY
#rom.org			0xC000

#interrupt.start    main
#interrupt.irq		intIrq
#interrupt.nmi		intNmi

#include "main.asm"

// CHR bank
#chr.banksize 		8K
#chr.bank 			CHR_FONT_BANK
#incbin "FONT.CHR"
#chr.end