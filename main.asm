
interrupt.irq intIrq()
{
}

interrupt.nmi intNmi() // Non maskable interrupts
{
}

inline sysInit()
{
	disable_decimal_mode()
	disable_interrupts()
	
	reset_stack()
	
	// clear the registers
	lda		#0 
	
	sta		PPU.CNT0
	sta		PPU.CNT1
	
	sta		PPU.BG_SCROLL
	sta		PPU.BG_SCROLL
	
	sta		PCM_CNT
	sta		PCM_VOLUMECNT
	sta		SND_CNT
	
	lda		#0xC0
	sta		joystick.cnt1
}

function videoOn()
{
	assign(PPU.CNT1, #CR_BACKVISIBLE | CR_BACKNOCLIP)
}

function videoOff()
{
	assign(PPU.CNT1, #0)
}

// Main
interrupt.start main()
{		
	// Initlialize memory
	sysInit()
	
	videoOff()
	
	videoOn()
	
	forever {
		
		// Latch controller buttons
		lda #$01
		sta $4016
		lda #$00
		sta $4016
		
		// Continually load $4016 into accumulator to get button results.
_ReadA:
		lda $4016
		and #%00000001
		beq _ReadADone
		
_ReadADone:

_ReadB:
		lda $4016
		and #%00000001
		beq _ReadBDone
_ReadBDone:
		
	}
}

function jsr_ind()
{
	jmp [paddr]
}