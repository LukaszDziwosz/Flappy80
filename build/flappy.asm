; Compiled with 1.32.273
--------------------------------------------------------------------
startup: ; startup
1c01 : 0b __ __ INV
1c02 : 1c __ __ INV
1c03 : 0a __ __ ASL
1c04 : 00 __ __ BRK
1c05 : 9e __ __ INV
1c06 : 37 __ __ INV
1c07 : 31 38 __ AND ($38),y 
1c09 : 31 00 __ AND ($00),y 
1c0b : 00 __ __ BRK
1c0c : 00 __ __ BRK
1c0d : a9 0e __ LDA #$0e
1c0f : 8d 00 ff STA $ff00 
1c12 : ba __ __ TSX
1c13 : 8e a1 3c STX $3ca1 ; (spentry + 0)
1c16 : a2 3e __ LDX #$3e
1c18 : a0 ec __ LDY #$ec
1c1a : a9 00 __ LDA #$00
1c1c : 85 19 __ STA IP + 0 
1c1e : 86 1a __ STX IP + 1 
1c20 : e0 7d __ CPX #$7d
1c22 : f0 0b __ BEQ $1c2f ; (startup + 46)
1c24 : 91 19 __ STA (IP + 0),y 
1c26 : c8 __ __ INY
1c27 : d0 fb __ BNE $1c24 ; (startup + 35)
1c29 : e8 __ __ INX
1c2a : d0 f2 __ BNE $1c1e ; (startup + 29)
1c2c : 91 19 __ STA (IP + 0),y 
1c2e : c8 __ __ INY
1c2f : c0 17 __ CPY #$17
1c31 : d0 f9 __ BNE $1c2c ; (startup + 43)
1c33 : a9 00 __ LDA #$00
1c35 : a2 f7 __ LDX #$f7
1c37 : d0 03 __ BNE $1c3c ; (startup + 59)
1c39 : 95 00 __ STA $00,x 
1c3b : e8 __ __ INX
1c3c : e0 f7 __ CPX #$f7
1c3e : d0 f9 __ BNE $1c39 ; (startup + 56)
1c40 : a9 d6 __ LDA #$d6
1c42 : 85 23 __ STA SP + 0 
1c44 : a9 bf __ LDA #$bf
1c46 : 85 24 __ STA SP + 1 
1c48 : 20 80 1c JSR $1c80 ; (main.s1 + 0)
1c4b : a9 4c __ LDA #$4c
1c4d : 85 54 __ STA $54 
1c4f : a9 00 __ LDA #$00
1c51 : 85 13 __ STA P6 
1c53 : 85 1a __ STA IP + 1 
1c55 : a9 1b __ LDA #$1b
1c57 : 85 18 __ STA P11 
1c59 : a9 19 __ LDA #$19
1c5b : 85 16 __ STA P9 
1c5d : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 797, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
1c80 : a2 0b __ LDX #$0b
1c82 : b5 53 __ LDA T1 + 0,x 
1c84 : 9d d8 bf STA $bfd8,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1 + 2)
.s4:
1c8a : a9 01 __ LDA #$01
1c8c : 8d a2 3c STA $3ca2 ; (giocharmap + 0)
1c8f : 20 9a 20 JSR $209a ; (dispmode80col.s4 + 0)
1c92 : a9 01 __ LDA #$01
1c94 : 85 cc __ STA $cc 
1c96 : 20 a2 20 JSR $20a2 ; (sound_init.s4 + 0)
1c99 : a9 93 __ LDA #$93
1c9b : 20 d2 ff JSR $ffd2 
1c9e : 78 __ __ SEI
1c9f : ad 11 d0 LDA $d011 
1ca2 : 29 7f __ AND #$7f
1ca4 : 85 55 __ STA T3 + 0 
1ca6 : 29 6f __ AND #$6f
1ca8 : 8d 11 d0 STA $d011 
1cab : ad 30 d0 LDA $d030 
1cae : 85 59 __ STA T8 + 0 
1cb0 : ad 00 dc LDA $dc00 
1cb3 : 85 5a __ STA T9 + 0 
1cb5 : ad 02 dc LDA $dc02 
1cb8 : 85 5b __ STA T10 + 0 
1cba : ad 03 dc LDA $dc03 
1cbd : 85 5c __ STA T11 + 0 
1cbf : a9 01 __ LDA #$01
1cc1 : 8d 30 d0 STA $d030 
1cc4 : a9 ff __ LDA #$ff
1cc6 : 8d 02 dc STA $dc02 
1cc9 : a9 00 __ LDA #$00
1ccb : 8d 03 dc STA $dc03 
1cce : ad 0e dd LDA $dd0e 
1cd1 : 85 5d __ STA T12 + 0 
1cd3 : a9 ff __ LDA #$ff
1cd5 : 8d 04 dd STA $dd04 
1cd8 : 8d 05 dd STA $dd05 
1cdb : 8d e4 3c STA $3ce4 ; (set_pose[0][0] + 0)
1cde : 8d e5 3c STA $3ce5 ; (set_pose[0][0] + 1)
1ce1 : 8d e6 3c STA $3ce6 ; (set_pose[0][0] + 2)
1ce4 : 8d e7 3c STA $3ce7 ; (set_pose[0][0] + 3)
1ce7 : 8d e8 3c STA $3ce8 ; (set_pose[0][0] + 4)
1cea : 8d e9 3c STA $3ce9 ; (set_pose[0][0] + 5)
1ced : 8d ea 3c STA $3cea ; (set_pose[0][0] + 6)
1cf0 : 8d eb 3c STA $3ceb ; (set_pose[0][0] + 7)
1cf3 : a9 11 __ LDA #$11
1cf5 : 8d 0e dd STA $dd0e 
1cf8 : a2 00 __ LDX #$00
.l5:
1cfa : 8e 00 d6 STX $d600 
.l6:
1cfd : 2c 00 d6 BIT $d600 
1d00 : 10 fb __ BPL $1cfd ; (main.l6 + 0)
.s7:
1d02 : ad 01 d6 LDA $d601 
1d05 : 9d 00 3f STA $3f00,x ; (saved_regs[0] + 0)
1d08 : e8 __ __ INX
1d09 : e0 25 __ CPX #$25
1d0b : 90 ed __ BCC $1cfa ; (main.l5 + 0)
.s8:
1d0d : a9 22 __ LDA #$22
1d0f : 8d 00 d6 STA $d600 
.l9:
1d12 : 2c 00 d6 BIT $d600 
1d15 : 10 fb __ BPL $1d12 ; (main.l9 + 0)
.s10:
1d17 : a9 80 __ LDA #$80
1d19 : 8d 01 d6 STA $d601 
1d1c : a9 00 __ LDA #$00
1d1e : a2 20 __ LDX #$20
1d20 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
1d23 : a9 25 __ LDA #$25
1d25 : 85 53 __ STA T1 + 0 
1d27 : a0 00 __ LDY #$00
1d29 : a2 00 __ LDX #$00
.l11:
1d2b : 2c 00 d6 BIT $d600 
1d2e : 10 fb __ BPL $1d2b ; (main.l11 + 0)
.s12:
1d30 : 8a __ __ TXA
1d31 : 18 __ __ CLC
1d32 : 69 3f __ ADC #$3f
1d34 : 85 54 __ STA T1 + 1 
1d36 : ad 01 d6 LDA $d601 
1d39 : 91 53 __ STA (T1 + 0),y 
1d3b : c8 __ __ INY
1d3c : d0 01 __ BNE $1d3f ; (main.s108 + 0)
.s107:
1d3e : e8 __ __ INX
.s108:
1d3f : e0 0f __ CPX #$0f
1d41 : d0 e8 __ BNE $1d2b ; (main.l11 + 0)
.s103:
1d43 : 98 __ __ TYA
1d44 : d0 e5 __ BNE $1d2b ; (main.l11 + 0)
.s13:
1d46 : a9 1c __ LDA #$1c
1d48 : 8d 00 d6 STA $d600 
1d4b : ad 1c 3f LDA $3f1c ; (saved_regs[0] + 28)
1d4e : 29 0f __ AND #$0f
1d50 : 09 30 __ ORA #$30
1d52 : 85 56 __ STA T4 + 0 
.l14:
1d54 : 2c 00 d6 BIT $d600 
1d57 : 10 fb __ BPL $1d54 ; (main.l14 + 0)
.s15:
1d59 : 8d 01 d6 STA $d601 
1d5c : 20 0c 21 JSR $210c ; (make_shapes.s4 + 0)
1d5f : 20 75 22 JSR $2275 ; (make_poses.s4 + 0)
1d62 : a9 00 __ LDA #$00
1d64 : a2 20 __ LDX #$20
1d66 : 86 58 __ STX T5 + 1 
1d68 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
1d6b : a9 00 __ LDA #$00
1d6d : 85 5e __ STA T13 + 0 
.l16:
1d6f : 20 ef 22 JSR $22ef ; (pipe_shapes.s4 + 0)
1d72 : a9 00 __ LDA #$00
1d74 : a6 58 __ LDX T5 + 1 
1d76 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
1d79 : a9 00 __ LDA #$00
1d7b : 85 43 __ STA T0 + 0 
.l17:
1d7d : 0a __ __ ASL
1d7e : 85 53 __ STA T1 + 0 
1d80 : a9 00 __ LDA #$00
1d82 : 2a __ __ ROL
1d83 : 06 53 __ ASL T1 + 0 
1d85 : 2a __ __ ROL
1d86 : 06 53 __ ASL T1 + 0 
1d88 : 2a __ __ ROL
1d89 : aa __ __ TAX
1d8a : a9 25 __ LDA #$25
1d8c : 65 53 __ ADC T1 + 0 
1d8e : 85 53 __ STA T1 + 0 
1d90 : 8a __ __ TXA
1d91 : 69 4e __ ADC #$4e
1d93 : 85 54 __ STA T1 + 1 
1d95 : a0 00 __ LDY #$00
.l106:
1d97 : b1 53 __ LDA (T1 + 0),y 
.l18:
1d99 : 2c 00 d6 BIT $d600 
1d9c : 10 fb __ BPL $1d99 ; (main.l18 + 0)
.s19:
1d9e : 8d 01 d6 STA $d601 
1da1 : c8 __ __ INY
1da2 : c0 08 __ CPY #$08
1da4 : 90 f1 __ BCC $1d97 ; (main.l106 + 0)
.s20:
1da6 : a2 08 __ LDX #$08
.l21:
1da8 : 2c 00 d6 BIT $d600 
1dab : 10 fb __ BPL $1da8 ; (main.l21 + 0)
.s22:
1dad : a9 00 __ LDA #$00
1daf : 8d 01 d6 STA $d601 
1db2 : ca __ __ DEX
1db3 : d0 f3 __ BNE $1da8 ; (main.l21 + 0)
.s23:
1db5 : e6 43 __ INC T0 + 0 
1db7 : a5 43 __ LDA T0 + 0 
1db9 : c9 f0 __ CMP #$f0
1dbb : d0 c0 __ BNE $1d7d ; (main.l17 + 0)
.s24:
1dbd : a5 58 __ LDA T5 + 1 
1dbf : 69 1f __ ADC #$1f
1dc1 : 85 58 __ STA T5 + 1 
1dc3 : e6 5e __ INC T13 + 0 
1dc5 : a5 5e __ LDA T13 + 0 
1dc7 : c9 04 __ CMP #$04
1dc9 : 90 a4 __ BCC $1d6f ; (main.l16 + 0)
.s25:
1dcb : 8e 00 d6 STX $d600 
.l26:
1dce : 2c 00 d6 BIT $d600 
1dd1 : 10 fb __ BPL $1dce ; (main.l26 + 0)
.s27:
1dd3 : a9 7e __ LDA #$7e
1dd5 : 8d 01 d6 STA $d601 
1dd8 : a9 02 __ LDA #$02
1dda : 8d 00 d6 STA $d600 
.l28:
1ddd : 2c 00 d6 BIT $d600 
1de0 : 10 fb __ BPL $1ddd ; (main.l28 + 0)
.s29:
1de2 : a9 66 __ LDA #$66
1de4 : 8d 01 d6 STA $d601 
1de7 : a9 03 __ LDA #$03
1de9 : 8d 00 d6 STA $d600 
.l30:
1dec : 2c 00 d6 BIT $d600 
1def : 10 fb __ BPL $1dec ; (main.l30 + 0)
.s31:
1df1 : a9 49 __ LDA #$49
1df3 : 8d 01 d6 STA $d601 
1df6 : a9 04 __ LDA #$04
1df8 : 8d 00 d6 STA $d600 
.l32:
1dfb : 2c 00 d6 BIT $d600 
1dfe : 10 fb __ BPL $1dfb ; (main.l32 + 0)
.s33:
1e00 : a9 20 __ LDA #$20
1e02 : 8d 01 d6 STA $d601 
1e05 : a9 05 __ LDA #$05
1e07 : 8d 00 d6 STA $d600 
.l34:
1e0a : 2c 00 d6 BIT $d600 
1e0d : 10 fb __ BPL $1e0a ; (main.l34 + 0)
.s35:
1e0f : 8e 01 d6 STX $d601 
1e12 : a9 07 __ LDA #$07
1e14 : 8d 00 d6 STA $d600 
.l36:
1e17 : 2c 00 d6 BIT $d600 
1e1a : 10 fb __ BPL $1e17 ; (main.l36 + 0)
.s37:
1e1c : a9 1d __ LDA #$1d
1e1e : 8d 01 d6 STA $d601 
1e21 : a9 08 __ LDA #$08
1e23 : 8d 00 d6 STA $d600 
.l38:
1e26 : 2c 00 d6 BIT $d600 
1e29 : 10 fb __ BPL $1e26 ; (main.l38 + 0)
.s39:
1e2b : 8e 01 d6 STX $d601 
1e2e : a9 0c __ LDA #$0c
1e30 : 8d 00 d6 STA $d600 
.l40:
1e33 : 2c 00 d6 BIT $d600 
1e36 : 10 fb __ BPL $1e33 ; (main.l40 + 0)
.s41:
1e38 : 8e 01 d6 STX $d601 
1e3b : a9 0d __ LDA #$0d
1e3d : 8d 00 d6 STA $d600 
.l42:
1e40 : 2c 00 d6 BIT $d600 
1e43 : 10 fb __ BPL $1e40 ; (main.l42 + 0)
.s43:
1e45 : 8e 01 d6 STX $d601 
1e48 : a9 14 __ LDA #$14
1e4a : 8d 00 d6 STA $d600 
.l44:
1e4d : 2c 00 d6 BIT $d600 
1e50 : 10 fb __ BPL $1e4d ; (main.l44 + 0)
.s45:
1e52 : a9 08 __ LDA #$08
1e54 : 8d 01 d6 STA $d601 
1e57 : a9 15 __ LDA #$15
1e59 : 8d 00 d6 STA $d600 
.l46:
1e5c : 2c 00 d6 BIT $d600 
1e5f : 10 fb __ BPL $1e5c ; (main.l46 + 0)
.s47:
1e61 : 8e 01 d6 STX $d601 
1e64 : a9 1c __ LDA #$1c
1e66 : 8d 00 d6 STA $d600 
.l48:
1e69 : 2c 00 d6 BIT $d600 
1e6c : 10 fb __ BPL $1e69 ; (main.l48 + 0)
.s49:
1e6e : a5 56 __ LDA T4 + 0 
1e70 : 8d 01 d6 STA $d601 
1e73 : a9 01 __ LDA #$01
1e75 : 8d 00 d6 STA $d600 
.l50:
1e78 : 2c 00 d6 BIT $d600 
1e7b : 10 fb __ BPL $1e78 ; (main.l50 + 0)
.s51:
1e7d : a9 50 __ LDA #$50
1e7f : 8d 01 d6 STA $d601 
1e82 : a9 06 __ LDA #$06
1e84 : 8d 00 d6 STA $d600 
.l52:
1e87 : 2c 00 d6 BIT $d600 
1e8a : 10 fb __ BPL $1e87 ; (main.l52 + 0)
.s53:
1e8c : a9 19 __ LDA #$19
1e8e : 8d 01 d6 STA $d601 
1e91 : a9 09 __ LDA #$09
1e93 : 8d 00 d6 STA $d600 
.l54:
1e96 : 2c 00 d6 BIT $d600 
1e99 : 10 fb __ BPL $1e96 ; (main.l54 + 0)
.s55:
1e9b : a9 07 __ LDA #$07
1e9d : 8d 01 d6 STA $d601 
1ea0 : a9 17 __ LDA #$17
1ea2 : 8d 00 d6 STA $d600 
.l56:
1ea5 : 2c 00 d6 BIT $d600 
1ea8 : 10 fb __ BPL $1ea5 ; (main.l56 + 0)
.s57:
1eaa : a9 07 __ LDA #$07
1eac : 8d 01 d6 STA $d601 
1eaf : a9 16 __ LDA #$16
1eb1 : 8d 00 d6 STA $d600 
.l58:
1eb4 : 2c 00 d6 BIT $d600 
1eb7 : 10 fb __ BPL $1eb4 ; (main.l58 + 0)
.s59:
1eb9 : a9 78 __ LDA #$78
1ebb : 8d 01 d6 STA $d601 
1ebe : a9 0a __ LDA #$0a
1ec0 : 8d 00 d6 STA $d600 
.l60:
1ec3 : 2c 00 d6 BIT $d600 
1ec6 : 10 fb __ BPL $1ec3 ; (main.l60 + 0)
.s61:
1ec8 : a9 20 __ LDA #$20
1eca : 8d 01 d6 STA $d601 
1ecd : a9 18 __ LDA #$18
1ecf : 8d 00 d6 STA $d600 
.l62:
1ed2 : 2c 00 d6 BIT $d600 
1ed5 : 10 fb __ BPL $1ed2 ; (main.l62 + 0)
.s63:
1ed7 : a9 80 __ LDA #$80
1ed9 : 8d 01 d6 STA $d601 
1edc : a9 19 __ LDA #$19
1ede : 8d 00 d6 STA $d600 
.l64:
1ee1 : 2c 00 d6 BIT $d600 
1ee4 : 10 fb __ BPL $1ee1 ; (main.l64 + 0)
.s65:
1ee6 : a9 47 __ LDA #$47
1ee8 : 8d 01 d6 STA $d601 
1eeb : a9 1b __ LDA #$1b
1eed : 8d 00 d6 STA $d600 
.l66:
1ef0 : 2c 00 d6 BIT $d600 
1ef3 : 10 fb __ BPL $1ef0 ; (main.l66 + 0)
.s67:
1ef5 : 8e 01 d6 STX $d601 
1ef8 : a9 1a __ LDA #$1a
1efa : 8d 00 d6 STA $d600 
.l68:
1efd : 2c 00 d6 BIT $d600 
1f00 : 10 fb __ BPL $1efd ; (main.l68 + 0)
.s69:
1f02 : 86 54 __ STX T1 + 1 
1f04 : a9 06 __ LDA #$06
1f06 : 8d 01 d6 STA $d601 
1f09 : a0 00 __ LDY #$00
.l105:
1f0b : 98 __ __ TYA
1f0c : 9d a5 55 STA $55a5,x ; (row_addr[0] + 0)
1f0f : 18 __ __ CLC
1f10 : 69 50 __ ADC #$50
1f12 : a8 __ __ TAY
1f13 : a5 54 __ LDA T1 + 1 
1f15 : 9d a6 55 STA $55a6,x ; (row_addr[0] + 1)
1f18 : 69 00 __ ADC #$00
1f1a : 85 54 __ STA T1 + 1 
1f1c : e8 __ __ INX
1f1d : e8 __ __ INX
1f1e : e0 32 __ CPX #$32
1f20 : d0 e9 __ BNE $1f0b ; (main.l105 + 0)
.s70:
1f22 : a9 00 __ LDA #$00
1f24 : 85 56 __ STA T4 + 0 
1f26 : 8d ec 3c STA $3cec ; (state + 0)
1f29 : 20 d8 23 JSR $23d8 ; (reset_game.s4 + 0)
1f2c : 20 d0 27 JSR $27d0 ; (banner.s4 + 0)
.l71:
1f2f : a5 56 __ LDA T4 + 0 
1f31 : 85 57 __ STA T5 + 0 
1f33 : f0 04 __ BEQ $1f39 ; (main.s102 + 0)
.s72:
1f35 : a2 10 __ LDX #$10
1f37 : d0 04 __ BNE $1f3d ; (main.s73 + 0)
.s102:
1f39 : a2 00 __ LDX #$00
1f3b : 86 56 __ STX T4 + 0 
.s73:
1f3d : a9 00 __ LDA #$00
1f3f : 85 43 __ STA T0 + 0 
1f41 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
1f44 : a9 55 __ LDA #$55
1f46 : 85 44 __ STA T0 + 1 
1f48 : a0 d7 __ LDY #$d7
.l74:
1f4a : b1 43 __ LDA (T0 + 0),y 
.l75:
1f4c : 2c 00 d6 BIT $d600 
1f4f : 10 fb __ BPL $1f4c ; (main.l75 + 0)
.s76:
1f51 : 8d 01 d6 STA $d601 
1f54 : c8 __ __ INY
1f55 : d0 02 __ BNE $1f59 ; (main.s110 + 0)
.s109:
1f57 : e6 44 __ INC T0 + 1 
.s110:
1f59 : c0 a7 __ CPY #$a7
1f5b : d0 ed __ BNE $1f4a ; (main.l74 + 0)
.s101:
1f5d : a5 44 __ LDA T0 + 1 
1f5f : c9 5d __ CMP #$5d
1f61 : d0 e7 __ BNE $1f4a ; (main.l74 + 0)
.s77:
1f63 : a5 57 __ LDA T5 + 0 
1f65 : f0 04 __ BEQ $1f6b ; (main.s111 + 0)
.s112:
1f67 : a2 18 __ LDX #$18
1f69 : d0 02 __ BNE $1f6d ; (main.s113 + 0)
.s111:
1f6b : a2 08 __ LDX #$08
.s113:
1f6d : a9 00 __ LDA #$00
1f6f : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
1f72 : a9 5d __ LDA #$5d
1f74 : 85 44 __ STA T0 + 1 
1f76 : a0 a7 __ LDY #$a7
.l78:
1f78 : b1 43 __ LDA (T0 + 0),y 
.l79:
1f7a : 2c 00 d6 BIT $d600 
1f7d : 10 fb __ BPL $1f7a ; (main.l79 + 0)
.s80:
1f7f : 8d 01 d6 STA $d601 
1f82 : c8 __ __ INY
1f83 : d0 02 __ BNE $1f87 ; (main.s115 + 0)
.s114:
1f85 : e6 44 __ INC T0 + 1 
.s115:
1f87 : c0 77 __ CPY #$77
1f89 : d0 ed __ BNE $1f78 ; (main.l78 + 0)
.s100:
1f8b : a5 44 __ LDA T0 + 1 
1f8d : c9 65 __ CMP #$65
1f8f : d0 e7 __ BNE $1f78 ; (main.l78 + 0)
.s81:
1f91 : e6 56 __ INC T4 + 0 
1f93 : a5 56 __ LDA T4 + 0 
1f95 : c9 02 __ CMP #$02
1f97 : 90 96 __ BCC $1f2f ; (main.l71 + 0)
.s82:
1f99 : a9 00 __ LDA #$00
1f9b : 85 0f __ STA P2 
1f9d : 85 10 __ STA P3 
1f9f : a9 d0 __ LDA #$d0
1fa1 : 85 11 __ STA P4 
1fa3 : a9 65 __ LDA #$65
1fa5 : 85 0e __ STA P1 
1fa7 : a9 07 __ LDA #$07
1fa9 : 85 12 __ STA P5 
1fab : a9 77 __ LDA #$77
1fad : 85 0d __ STA P0 
1faf : 20 ed 29 JSR $29ed ; (memset.s4 + 0)
1fb2 : a9 00 __ LDA #$00
1fb4 : 8d f8 3c STA $3cf8 ; (dirty_count + 0)
1fb7 : 8d f9 3c STA $3cf9 ; (dirty_count + 1)
1fba : 8d f6 3c STA $3cf6 ; (redrawn + 0)
1fbd : 20 09 2a JSR $2a09 ; (wait_frame.s4 + 0)
1fc0 : 20 50 2a JSR $2a50 ; (show_frame.s1 + 0)
1fc3 : a9 22 __ LDA #$22
1fc5 : 8d 00 d6 STA $d600 
1fc8 : ad 22 3f LDA $3f22 ; (saved_regs[0] + 34)
1fcb : 85 56 __ STA T4 + 0 
.l83:
1fcd : 2c 00 d6 BIT $d600 
1fd0 : 10 fb __ BPL $1fcd ; (main.l83 + 0)
.s84:
1fd2 : 8d 01 d6 STA $d601 
1fd5 : 4c e7 1f JMP $1fe7 ; (main.l85 + 0)
.s99:
1fd8 : 20 0e 33 JSR $330e ; (prepare_frame.s1 + 0)
1fdb : 20 2c 39 JSR $392c ; (sound_tick.s4 + 0)
1fde : 20 dd 39 JSR $39dd ; (stage_frame.s1 + 0)
1fe1 : 20 09 2a JSR $2a09 ; (wait_frame.s4 + 0)
1fe4 : 20 50 2a JSR $2a50 ; (show_frame.s1 + 0)
.l85:
1fe7 : 20 d2 32 JSR $32d2 ; (keys.s4 + 0)
1fea : 85 18 __ STA P11 
1fec : 29 10 __ AND #$10
1fee : f0 e8 __ BEQ $1fd8 ; (main.s99 + 0)
.s86:
1ff0 : a9 22 __ LDA #$22
1ff2 : 8d 00 d6 STA $d600 
.l87:
1ff5 : 2c 00 d6 BIT $d600 
1ff8 : 10 fb __ BPL $1ff5 ; (main.l87 + 0)
.s88:
1ffa : a9 80 __ LDA #$80
1ffc : 8d 01 d6 STA $d601 
1fff : a9 1c __ LDA #$1c
2001 : 8d 00 d6 STA $d600 
2004 : ad 1c 3f LDA $3f1c ; (saved_regs[0] + 28)
.l89:
2007 : 2c 00 d6 BIT $d600 
200a : 10 fb __ BPL $2007 ; (main.l89 + 0)
.s90:
200c : 8d 01 d6 STA $d601 
200f : a9 00 __ LDA #$00
2011 : 85 43 __ STA T0 + 0 
2013 : a2 20 __ LDX #$20
2015 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
2018 : a9 3f __ LDA #$3f
201a : 85 44 __ STA T0 + 1 
201c : a0 25 __ LDY #$25
.l91:
201e : b1 43 __ LDA (T0 + 0),y 
.l92:
2020 : 2c 00 d6 BIT $d600 
2023 : 10 fb __ BPL $2020 ; (main.l92 + 0)
.s93:
2025 : 8d 01 d6 STA $d601 
2028 : c8 __ __ INY
2029 : d0 02 __ BNE $202d ; (main.s117 + 0)
.s116:
202b : e6 44 __ INC T0 + 1 
.s117:
202d : c0 25 __ CPY #$25
202f : d0 ed __ BNE $201e ; (main.l91 + 0)
.s98:
2031 : a5 44 __ LDA T0 + 1 
2033 : c9 4e __ CMP #$4e
2035 : d0 e7 __ BNE $201e ; (main.l91 + 0)
.s94:
2037 : 20 1f 3b JSR $3b1f ; (restore_vdc.s4 + 0)
203a : a9 22 __ LDA #$22
203c : 8d 00 d6 STA $d600 
.l95:
203f : 2c 00 d6 BIT $d600 
2042 : 10 fb __ BPL $203f ; (main.l95 + 0)
.s96:
2044 : a5 56 __ LDA T4 + 0 
2046 : 8d 01 d6 STA $d601 
2049 : 20 3e 3b JSR $3b3e ; (sound_off.s4 + 0)
204c : a5 5a __ LDA T9 + 0 
204e : 8d 00 dc STA $dc00 
2051 : a5 5b __ LDA T10 + 0 
2053 : 8d 02 dc STA $dc02 
2056 : a5 5c __ LDA T11 + 0 
2058 : 8d 03 dc STA $dc03 
205b : a5 59 __ LDA T8 + 0 
205d : 8d 30 d0 STA $d030 
2060 : a5 55 __ LDA T3 + 0 
2062 : 8d 11 d0 STA $d011 
2065 : a5 5d __ LDA T12 + 0 
2067 : 8d 0e dd STA $dd0e 
206a : 58 __ __ CLI
206b : a9 93 __ LDA #$93
206d : 20 d2 ff JSR $ffd2 
2070 : a0 23 __ LDY #$23
2072 : a2 0a __ LDX #$0a
2074 : 18 __ __ CLC
2075 : 20 f0 ff JSR $fff0 
2078 : a2 00 __ LDX #$00
.l104:
207a : 86 53 __ STX T1 + 0 
207c : bd 99 3b LDA $3b99,x 
207f : 20 4d 3b JSR $3b4d ; (putch.s4 + 0)
2082 : a6 53 __ LDX T1 + 0 
2084 : e8 __ __ INX
2085 : e0 09 __ CPX #$09
2087 : 90 f1 __ BCC $207a ; (main.l104 + 0)
.s97:
2089 : a9 00 __ LDA #$00
208b : 85 1b __ STA ACCU + 0 
208d : 85 1c __ STA ACCU + 1 
.s3:
208f : a2 0b __ LDX #$0b
2091 : bd d8 bf LDA $bfd8,x ; (main@stack + 0)
2094 : 95 53 __ STA T1 + 0,x 
2096 : ca __ __ DEX
2097 : 10 f8 __ BPL $2091 ; (main.s3 + 2)
2099 : 60 __ __ RTS
--------------------------------------------------------------------
dispmode80col: ; dispmode80col()->void
;  23, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/conio.h"
.s4:
209a : 24 d7 __ BIT $d7 
209c : 10 01 __ BPL $209f ; (dispmode80col.s5 + 0)
.s3:
209e : 60 __ __ RTS
.s5:
209f : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
sound_init: ; sound_init()->void
;  11, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
20a2 : a9 00 __ LDA #$00
20a4 : 8d e1 3c STA $3ce1 ; (timer[0] + 0)
20a7 : 8d e2 3c STA $3ce2 ; (timer[0] + 1)
20aa : 8d e3 3c STA $3ce3 ; (timer[0] + 2)
20ad : a2 0f __ LDX #$0f
20af : 8e 18 d4 STX $d418 
20b2 : 8d 04 d4 STA $d404 
20b5 : 8d 02 d4 STA $d402 
20b8 : a2 08 __ LDX #$08
20ba : 8e 03 d4 STX $d403 
20bd : 8d 0b d4 STA $d40b 
20c0 : 8d 09 d4 STA $d409 
20c3 : 8e 0a d4 STX $d40a 
20c6 : 8d 12 d4 STA $d412 
20c9 : 8d 10 d4 STA $d410 
20cc : 8e 11 d4 STX $d411 
20cf : a9 35 __ LDA #$35
20d1 : 8d 05 d4 STA $d405 
20d4 : a9 02 __ LDA #$02
20d6 : 8d 06 d4 STA $d406 
20d9 : a9 09 __ LDA #$09
20db : 8d 0c d4 STA $d40c 
20de : a9 0a __ LDA #$0a
20e0 : 8d 0d d4 STA $d40d 
20e3 : 8e 13 d4 STX $d413 
20e6 : a9 89 __ LDA #$89
20e8 : 8d 14 d4 STA $d414 
.s3:
20eb : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
;  76, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/c128/vdc.h"
.s4:
20ec : a0 12 __ LDY #$12
20ee : 8c 00 d6 STY $d600 
.l5:
20f1 : 2c 00 d6 BIT $d600 
20f4 : 10 fb __ BPL $20f1 ; (vdc_mem_addr.l5 + 0)
.s6:
20f6 : 8e 01 d6 STX $d601 
20f9 : a2 13 __ LDX #$13
20fb : 8e 00 d6 STX $d600 
.l7:
20fe : 2c 00 d6 BIT $d600 
2101 : 10 fb __ BPL $20fe ; (vdc_mem_addr.l7 + 0)
.s8:
2103 : 8d 01 d6 STA $d601 
2106 : a9 1f __ LDA #$1f
2108 : 8d 00 d6 STA $d600 
.s3:
210b : 60 __ __ RTS
--------------------------------------------------------------------
make_shapes: ; make_shapes()->void
; 228, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
210c : a9 00 __ LDA #$00
210e : 85 43 __ STA T2 + 0 
.l5:
2110 : a9 ff __ LDA #$ff
2112 : a4 43 __ LDY T2 + 0 
2114 : 99 25 4e STA $4e25,y ; (shapes[0][0] + 0)
2117 : a9 7f __ LDA #$7f
2119 : 99 2d 4e STA $4e2d,y ; (shapes[0][0] + 8)
211c : a9 fe __ LDA #$fe
211e : 99 5d 4e STA $4e5d,y ; (shapes[0][0] + 56)
2121 : c0 01 __ CPY #$01
2123 : d0 04 __ BNE $2129 ; (make_shapes.s30 + 0)
.s6:
2125 : a9 00 __ LDA #$00
2127 : f0 02 __ BEQ $212b ; (make_shapes.s34 + 0)
.s30:
2129 : a9 ff __ LDA #$ff
.s34:
212b : 99 35 4e STA $4e35,y ; (shapes[0][0] + 16)
212e : a9 00 __ LDA #$00
2130 : c5 43 __ CMP T2 + 0 
2132 : 6a __ __ ROR
2133 : aa __ __ TAX
2134 : d0 04 __ BNE $213a ; (make_shapes.s7 + 0)
.s28:
2136 : c0 07 __ CPY #$07
2138 : d0 04 __ BNE $213e ; (make_shapes.s29 + 0)
.s7:
213a : a9 7f __ LDA #$7f
213c : d0 02 __ BNE $2140 ; (make_shapes.s35 + 0)
.s29:
213e : a9 60 __ LDA #$60
.s35:
2140 : 99 3d 4e STA $4e3d,y ; (shapes[0][0] + 24)
2143 : 8a __ __ TXA
2144 : 30 04 __ BMI $214a ; (make_shapes.s8 + 0)
.s26:
2146 : c0 07 __ CPY #$07
2148 : d0 04 __ BNE $214e ; (make_shapes.s27 + 0)
.s8:
214a : a9 fe __ LDA #$fe
214c : d0 02 __ BNE $2150 ; (make_shapes.s36 + 0)
.s27:
214e : a9 06 __ LDA #$06
.s36:
2150 : 99 45 4e STA $4e45,y ; (shapes[0][0] + 32)
2153 : e6 43 __ INC T2 + 0 
2155 : a5 43 __ LDA T2 + 0 
2157 : c9 08 __ CMP #$08
2159 : 90 b5 __ BCC $2110 ; (make_shapes.l5 + 0)
.s9:
215b : a9 00 __ LDA #$00
215d : 85 1c __ STA ACCU + 1 
215f : 85 1b __ STA ACCU + 0 
2161 : a9 30 __ LDA #$30
2163 : 85 43 __ STA T2 + 0 
2165 : a2 37 __ LDX #$37
.l12:
2167 : 0a __ __ ASL
2168 : 85 45 __ STA T3 + 0 
216a : 18 __ __ CLC
216b : a9 00 __ LDA #$00
216d : 65 1b __ ADC ACCU + 0 
216f : 85 47 __ STA T4 + 0 
2171 : a9 3d __ LDA #$3d
2173 : 69 00 __ ADC #$00
2175 : 85 48 __ STA T4 + 1 
2177 : a9 00 __ LDA #$00
2179 : 06 45 __ ASL T3 + 0 
217b : 2a __ __ ROL
217c : 06 45 __ ASL T3 + 0 
217e : 2a __ __ ROL
217f : a8 __ __ TAY
2180 : a9 25 __ LDA #$25
2182 : 65 45 __ ADC T3 + 0 
2184 : 85 45 __ STA T3 + 0 
2186 : 98 __ __ TYA
2187 : 69 4e __ ADC #$4e
2189 : 85 46 __ STA T3 + 1 
218b : a0 00 __ LDY #$00
.l31:
218d : b1 47 __ LDA (T4 + 0),y 
218f : 0a __ __ ASL
2190 : 91 45 __ STA (T3 + 0),y 
2192 : c8 __ __ INY
2193 : c0 07 __ CPY #$07
2195 : d0 f6 __ BNE $218d ; (make_shapes.l31 + 0)
.s32:
2197 : a5 1b __ LDA ACCU + 0 
2199 : 69 06 __ ADC #$06
219b : 85 1b __ STA ACCU + 0 
219d : e6 1c __ INC ACCU + 1 
219f : a5 1c __ LDA ACCU + 1 
21a1 : c9 24 __ CMP #$24
21a3 : b0 03 __ BCS $21a8 ; (make_shapes.s13 + 0)
21a5 : 4c 65 22 JMP $2265 ; (make_shapes.s10 + 0)
.s13:
21a8 : a2 00 __ LDX #$00
21aa : 86 1b __ STX ACCU + 0 
21ac : a9 f8 __ LDA #$f8
21ae : 85 1c __ STA ACCU + 1 
.l14:
21b0 : a9 ad __ LDA #$ad
21b2 : 85 43 __ STA T2 + 0 
21b4 : a9 4e __ LDA #$4e
21b6 : 85 44 __ STA T2 + 1 
.l15:
21b8 : a4 1c __ LDY ACCU + 1 
21ba : b1 43 __ LDA (T2 + 0),y 
21bc : 49 ff __ EOR #$ff
21be : a4 1b __ LDY ACCU + 0 
21c0 : 91 43 __ STA (T2 + 0),y 
21c2 : 18 __ __ CLC
21c3 : a5 43 __ LDA T2 + 0 
21c5 : 69 08 __ ADC #$08
21c7 : 85 43 __ STA T2 + 0 
21c9 : 90 02 __ BCC $21cd ; (make_shapes.s38 + 0)
.s37:
21cb : e6 44 __ INC T2 + 1 
.s38:
21cd : c9 fd __ CMP #$fd
21cf : d0 e7 __ BNE $21b8 ; (make_shapes.l15 + 0)
.s16:
21d1 : b9 bd 50 LDA $50bd,y ; (shapes[0][0] + 664)
21d4 : 49 ff __ EOR #$ff
21d6 : 99 fd 4e STA $4efd,y ; (shapes[0][0] + 216)
21d9 : b9 35 50 LDA $5035,y ; (shapes[0][0] + 528)
21dc : 49 ff __ EOR #$ff
21de : 99 05 4f STA $4f05,y ; (shapes[0][0] + 224)
21e1 : a9 2d __ LDA #$2d
21e3 : 85 43 __ STA T2 + 0 
21e5 : a9 50 __ LDA #$50
21e7 : 85 44 __ STA T2 + 1 
21e9 : a9 25 __ LDA #$25
21eb : 85 45 __ STA T3 + 0 
21ed : a9 52 __ LDA #$52
21ef : 85 46 __ STA T3 + 1 
.l33:
21f1 : b1 43 __ LDA (T2 + 0),y 
21f3 : 49 ff __ EOR #$ff
21f5 : 91 45 __ STA (T3 + 0),y 
21f7 : 18 __ __ CLC
21f8 : a5 43 __ LDA T2 + 0 
21fa : 69 08 __ ADC #$08
21fc : 85 43 __ STA T2 + 0 
21fe : 90 03 __ BCC $2203 ; (make_shapes.s40 + 0)
.s39:
2200 : e6 44 __ INC T2 + 1 
2202 : 18 __ __ CLC
.s40:
2203 : a5 45 __ LDA T3 + 0 
2205 : 69 08 __ ADC #$08
2207 : 85 45 __ STA T3 + 0 
2209 : 90 02 __ BCC $220d ; (make_shapes.s42 + 0)
.s41:
220b : e6 46 __ INC T3 + 1 
.s42:
220d : c9 f5 __ CMP #$f5
220f : d0 e0 __ BNE $21f1 ; (make_shapes.l33 + 0)
.s17:
2211 : a5 1c __ LDA ACCU + 1 
2213 : 69 00 __ ADC #$00
2215 : 85 1c __ STA ACCU + 1 
2217 : 90 01 __ BCC $221a ; (make_shapes.s44 + 0)
.s43:
2219 : e8 __ __ INX
.s44:
221a : e6 1b __ INC ACCU + 0 
221c : e0 01 __ CPX #$01
221e : d0 90 __ BNE $21b0 ; (make_shapes.l14 + 0)
.s24:
2220 : a8 __ __ TAY
2221 : d0 8d __ BNE $21b0 ; (make_shapes.l14 + 0)
.s18:
2223 : 85 1d __ STA ACCU + 2 
2225 : aa __ __ TAX
.l19:
2226 : 86 1b __ STX ACCU + 0 
2228 : bc a3 3c LDY $3ca3,x ; (round[0] + 0)
222b : 84 1c __ STY ACCU + 1 
222d : a2 00 __ LDX #$00
222f : 86 45 __ STX T3 + 0 
.l20:
2231 : bd bc 3e LDA $3ebc,x ; (bitshift[0] + 8)
2234 : 25 1c __ AND ACCU + 1 
2236 : f0 07 __ BEQ $223f ; (make_shapes.s22 + 0)
.s21:
2238 : bd d4 3e LDA $3ed4,x ; (bitshift[0] + 32)
223b : 05 45 __ ORA T3 + 0 
223d : 85 45 __ STA T3 + 0 
.s22:
223f : e8 __ __ INX
2240 : e0 08 __ CPX #$08
2242 : d0 ed __ BNE $2231 ; (make_shapes.l20 + 0)
.s23:
2244 : 98 __ __ TYA
2245 : a6 1b __ LDX ACCU + 0 
2247 : 9d f5 52 STA $52f5,x ; (shapes[0][0] + 1232)
224a : a5 45 __ LDA T3 + 0 
224c : 9d fd 52 STA $52fd,x ; (shapes[0][0] + 1240)
224f : 8a __ __ TXA
2250 : 49 07 __ EOR #$07
2252 : aa __ __ TAX
2253 : 98 __ __ TYA
2254 : 9d 05 53 STA $5305,x ; (shapes[0][0] + 1248)
2257 : a5 45 __ LDA T3 + 0 
2259 : 9d 0d 53 STA $530d,x ; (shapes[0][0] + 1256)
225c : e6 1d __ INC ACCU + 2 
225e : a6 1d __ LDX ACCU + 2 
2260 : e0 08 __ CPX #$08
2262 : 90 c2 __ BCC $2226 ; (make_shapes.l19 + 0)
.s3:
2264 : 60 __ __ RTS
.s10:
2265 : c9 0a __ CMP #$0a
2267 : e6 43 __ INC T2 + 0 
2269 : e8 __ __ INX
226a : b0 05 __ BCS $2271 ; (make_shapes.s25 + 0)
.s11:
226c : a5 43 __ LDA T2 + 0 
226e : 4c 67 21 JMP $2167 ; (make_shapes.l12 + 0)
.s25:
2271 : 8a __ __ TXA
2272 : 4c 67 21 JMP $2167 ; (make_shapes.l12 + 0)
--------------------------------------------------------------------
make_poses: ; make_poses()->void
; 259, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2275 : a9 00 __ LDA #$00
2277 : a2 90 __ LDX #$90
2279 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
227c : a9 00 __ LDA #$00
227e : 85 1b __ STA ACCU + 0 
.l5:
2280 : 4a __ __ LSR
2281 : 4a __ __ LSR
2282 : 4a __ __ LSR
2283 : aa __ __ TAX
2284 : bd 66 3c LDA $3c66,x ; (__multab60L + 0)
2287 : 85 1c __ STA ACCU + 1 
2289 : a5 1b __ LDA ACCU + 0 
228b : 29 07 __ AND #$07
228d : 85 1d __ STA ACCU + 2 
228f : a9 00 __ LDA #$00
2291 : 85 1e __ STA ACCU + 3 
.l6:
2293 : 0a __ __ ASL
2294 : 0a __ __ ASL
2295 : 0a __ __ ASL
2296 : 85 43 __ STA T4 + 0 
2298 : a2 00 __ LDX #$00
.l19:
229a : 38 __ __ SEC
229b : e5 1d __ SBC ACCU + 2 
229d : 85 44 __ STA T5 + 0 
229f : a9 08 __ LDA #$08
22a1 : 85 45 __ STA T9 + 0 
.l8:
22a3 : a4 44 __ LDY T5 + 0 
22a5 : c0 0c __ CPY #$0c
22a7 : 90 04 __ BCC $22ad ; (make_poses.s9 + 0)
.s18:
22a9 : a9 00 __ LDA #$00
22ab : b0 0b __ BCS $22b8 ; (make_poses.l10 + 0)
.s9:
22ad : 8a __ __ TXA
22ae : 79 69 3c ADC $3c69,y ; (__multab5L + 0)
22b1 : 18 __ __ CLC
22b2 : 65 1c __ ADC ACCU + 1 
22b4 : a8 __ __ TAY
22b5 : b9 00 3e LDA $3e00,y ; (bird_art[0][0][0] + 0)
.l10:
22b8 : 2c 00 d6 BIT $d600 
22bb : 10 fb __ BPL $22b8 ; (make_poses.l10 + 0)
.s11:
22bd : 8d 01 d6 STA $d601 
22c0 : e6 44 __ INC T5 + 0 
22c2 : c6 45 __ DEC T9 + 0 
22c4 : d0 dd __ BNE $22a3 ; (make_poses.l8 + 0)
.s12:
22c6 : a0 08 __ LDY #$08
.l13:
22c8 : 2c 00 d6 BIT $d600 
22cb : 10 fb __ BPL $22c8 ; (make_poses.l13 + 0)
.s14:
22cd : a9 00 __ LDA #$00
22cf : 8d 01 d6 STA $d601 
22d2 : 88 __ __ DEY
22d3 : d0 f3 __ BNE $22c8 ; (make_poses.l13 + 0)
.s15:
22d5 : e8 __ __ INX
22d6 : e0 05 __ CPX #$05
22d8 : b0 04 __ BCS $22de ; (make_poses.s16 + 0)
.s7:
22da : a5 43 __ LDA T4 + 0 
22dc : 90 bc __ BCC $229a ; (make_poses.l19 + 0)
.s16:
22de : e6 1e __ INC ACCU + 3 
22e0 : a5 1e __ LDA ACCU + 3 
22e2 : c9 03 __ CMP #$03
22e4 : d0 ad __ BNE $2293 ; (make_poses.l6 + 0)
.s17:
22e6 : e6 1b __ INC ACCU + 0 
22e8 : a5 1b __ LDA ACCU + 0 
22ea : c9 18 __ CMP #$18
22ec : d0 92 __ BNE $2280 ; (make_poses.l5 + 0)
.s3:
22ee : 60 __ __ RTS
--------------------------------------------------------------------
pipe_shapes: ; pipe_shapes(u8)->void
; 276, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
22ef : 0a __ __ ASL
22f0 : 85 1b __ STA ACCU + 0 
22f2 : a9 00 __ LDA #$00
22f4 : 2a __ __ ROL
22f5 : 85 1c __ STA ACCU + 1 
22f7 : a9 0a __ LDA #$0a
22f9 : 85 43 __ STA T5 + 0 
22fb : 85 1d __ STA ACCU + 2 
.l5:
22fd : a5 43 __ LDA T5 + 0 
22ff : c9 0d __ CMP #$0d
2301 : d0 04 __ BNE $2307 ; (pipe_shapes.s7 + 0)
.s6:
2303 : a9 01 __ LDA #$01
2305 : d0 02 __ BNE $2309 ; (pipe_shapes.s8 + 0)
.s7:
2307 : a9 00 __ LDA #$00
.s8:
2309 : 85 44 __ STA T6 + 0 
230b : a9 00 __ LDA #$00
230d : 85 45 __ STA T7 + 0 
.l9:
230f : a9 00 __ LDA #$00
2311 : 85 1e __ STA ACCU + 3 
2313 : 85 46 __ STA T8 + 0 
.l42:
2315 : a5 44 __ LDA T6 + 0 
2317 : f0 06 __ BEQ $231f ; (pipe_shapes.s16 + 0)
.s10:
2319 : a2 ff __ LDX #$ff
231b : a0 f8 __ LDY #$f8
231d : d0 24 __ BNE $2343 ; (pipe_shapes.s11 + 0)
.s16:
231f : a5 43 __ LDA T5 + 0 
2321 : c9 0c __ CMP #$0c
2323 : d0 06 __ BNE $232b ; (pipe_shapes.s18 + 0)
.s17:
2325 : a0 30 __ LDY #$30
.s41:
2327 : a2 00 __ LDX #$00
2329 : f0 18 __ BEQ $2343 ; (pipe_shapes.s11 + 0)
.s18:
232b : c9 10 __ CMP #$10
232d : d0 04 __ BNE $2333 ; (pipe_shapes.s20 + 0)
.s19:
232f : a0 38 __ LDY #$38
2331 : d0 f4 __ BNE $2327 ; (pipe_shapes.s41 + 0)
.s20:
2333 : c9 0a __ CMP #$0a
2335 : f0 04 __ BEQ $233b ; (pipe_shapes.s21 + 0)
.s22:
2337 : c9 0e __ CMP #$0e
2339 : d0 04 __ BNE $233f ; (pipe_shapes.s23 + 0)
.s21:
233b : a0 00 __ LDY #$00
233d : f0 e8 __ BEQ $2327 ; (pipe_shapes.s41 + 0)
.s23:
233f : a0 18 __ LDY #$18
2341 : a2 00 __ LDX #$00
.s11:
2343 : 98 __ __ TYA
2344 : 18 __ __ CLC
2345 : 65 46 __ ADC T8 + 0 
2347 : 90 02 __ BCC $234b ; (pipe_shapes.s40 + 0)
.s39:
2349 : e8 __ __ INX
234a : 18 __ __ CLC
.s40:
234b : 65 1b __ ADC ACCU + 0 
234d : a8 __ __ TAY
234e : 8a __ __ TXA
234f : 65 1c __ ADC ACCU + 1 
2351 : aa __ __ TAX
2352 : a5 43 __ LDA T5 + 0 
2354 : c9 0d __ CMP #$0d
2356 : 8a __ __ TXA
2357 : b0 6b __ BCS $23c4 ; (pipe_shapes.s33 + 0)
.s12:
2359 : 30 16 __ BMI $2371 ; (pipe_shapes.s15 + 0)
.s32:
235b : d0 04 __ BNE $2361 ; (pipe_shapes.s13 + 0)
.s31:
235d : c0 08 __ CPY #$08
235f : 90 10 __ BCC $2371 ; (pipe_shapes.s15 + 0)
.s13:
2361 : 8a __ __ TXA
2362 : d0 0d __ BNE $2371 ; (pipe_shapes.s15 + 0)
.s30:
2364 : c0 38 __ CPY #$38
2366 : b0 09 __ BCS $2371 ; (pipe_shapes.s15 + 0)
.s14:
2368 : a6 46 __ LDX T8 + 0 
236a : bd d4 3e LDA $3ed4,x ; (bitshift[0] + 32)
236d : 05 1e __ ORA ACCU + 3 
236f : 85 1e __ STA ACCU + 3 
.s15:
2371 : e6 46 __ INC T8 + 0 
2373 : a5 46 __ LDA T8 + 0 
2375 : c9 08 __ CMP #$08
2377 : 90 9c __ BCC $2315 ; (pipe_shapes.l42 + 0)
.s24:
2379 : a5 1d __ LDA ACCU + 2 
237b : 0a __ __ ASL
237c : 0a __ __ ASL
237d : 0a __ __ ASL
237e : 18 __ __ CLC
237f : 65 45 __ ADC T7 + 0 
2381 : aa __ __ TAX
2382 : a5 1e __ LDA ACCU + 3 
2384 : 9d 25 4e STA $4e25,x ; (shapes[0][0] + 0)
2387 : e6 45 __ INC T7 + 0 
2389 : a5 45 __ LDA T7 + 0 
238b : c9 08 __ CMP #$08
238d : 90 80 __ BCC $230f ; (pipe_shapes.l9 + 0)
.s25:
238f : a5 43 __ LDA T5 + 0 
2391 : c9 10 __ CMP #$10
2393 : e6 1d __ INC ACCU + 2 
2395 : e6 43 __ INC T5 + 0 
2397 : b0 03 __ BCS $239c ; (pipe_shapes.s26 + 0)
2399 : 4c fd 22 JMP $22fd ; (pipe_shapes.l5 + 0)
.s26:
239c : a2 00 __ LDX #$00
239e : 86 1d __ STX ACCU + 2 
.l27:
23a0 : a9 ff __ LDA #$ff
23a2 : b0 0d __ BCS $23b1 ; (pipe_shapes.l38 + 0)
.s29:
23a4 : a5 1d __ LDA ACCU + 2 
23a6 : 69 08 __ ADC #$08
23a8 : 38 __ __ SEC
23a9 : e5 1b __ SBC ACCU + 0 
23ab : 29 07 __ AND #$07
23ad : a8 __ __ TAY
23ae : b9 ab 3c LDA $3cab,y ; (stripe[0] + 0)
.l38:
23b1 : a4 1d __ LDY ACCU + 2 
23b3 : 99 4d 4e STA $4e4d,y ; (shapes[0][0] + 40)
23b6 : e8 __ __ INX
23b7 : e0 08 __ CPX #$08
23b9 : b0 08 __ BCS $23c3 ; (pipe_shapes.s3 + 0)
.s28:
23bb : e0 06 __ CPX #$06
23bd : e6 1d __ INC ACCU + 2 
23bf : 90 e3 __ BCC $23a4 ; (pipe_shapes.s29 + 0)
23c1 : b0 dd __ BCS $23a0 ; (pipe_shapes.l27 + 0)
.s3:
23c3 : 60 __ __ RTS
.s33:
23c4 : d0 ab __ BNE $2371 ; (pipe_shapes.s15 + 0)
.s37:
23c6 : c0 40 __ CPY #$40
23c8 : b0 a7 __ BCS $2371 ; (pipe_shapes.s15 + 0)
.s34:
23ca : a6 45 __ LDX T7 + 0 
23cc : ca __ __ DEX
23cd : d0 99 __ BNE $2368 ; (pipe_shapes.s14 + 0)
.s35:
23cf : 98 __ __ TYA
23d0 : f0 96 __ BEQ $2368 ; (pipe_shapes.s14 + 0)
.s36:
23d2 : c9 3f __ CMP #$3f
23d4 : d0 9b __ BNE $2371 ; (pipe_shapes.s15 + 0)
23d6 : f0 90 __ BEQ $2368 ; (pipe_shapes.s14 + 0)
--------------------------------------------------------------------
reset_game: ; reset_game()->void
; 502, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
23d8 : a9 00 __ LDA #$00
23da : 8d ed 3e STA $3eed ; (pipes[0].x + 1)
23dd : 8d ed 3c STA $3ced ; (score + 0)
23e0 : 8d ee 3c STA $3cee ; (score + 1)
23e3 : 8d ef 3c STA $3cef ; (velocity + 0)
23e6 : 8d f0 3c STA $3cf0 ; (velocity + 1)
23e9 : 8d f3 3c STA $3cf3 ; (phase + 0)
23ec : 8d f5 3c STA $3cf5 ; (scroll + 0)
23ef : a9 54 __ LDA #$54
23f1 : 8d ec 3e STA $3eec ; (pipes[0].x + 0)
23f4 : a9 80 __ LDA #$80
23f6 : 8d f1 3c STA $3cf1 ; (bird_y + 0)
23f9 : a9 05 __ LDA #$05
23fb : 8d f2 3c STA $3cf2 ; (bird_y + 1)
23fe : a9 08 __ LDA #$08
2400 : 8d f4 3c STA $3cf4 ; (speed + 0)
2403 : 20 49 25 JSR $2549 ; (gap_next.s4 + 0)
2406 : 8d ee 3e STA $3eee ; (pipes[0].gap + 0)
2409 : a9 00 __ LDA #$00
240b : 8d ef 3e STA $3eef ; (pipes[0].passed + 0)
240e : 8d f1 3e STA $3ef1 ; (pipes[0] + 5)
2411 : a9 71 __ LDA #$71
2413 : 8d f0 3e STA $3ef0 ; (pipes[0] + 4)
2416 : 20 49 25 JSR $2549 ; (gap_next.s4 + 0)
2419 : 8d f2 3e STA $3ef2 ; (pipes[0] + 6)
241c : a9 00 __ LDA #$00
241e : 8d f3 3e STA $3ef3 ; (pipes[0] + 7)
2421 : 8d f5 3e STA $3ef5 ; (pipes[0] + 9)
2424 : a9 8e __ LDA #$8e
2426 : 8d f4 3e STA $3ef4 ; (pipes[0] + 8)
2429 : 20 49 25 JSR $2549 ; (gap_next.s4 + 0)
242c : 8d f6 3e STA $3ef6 ; (pipes[0] + 10)
242f : a9 00 __ LDA #$00
2431 : 8d f7 3e STA $3ef7 ; (pipes[0] + 11)
2434 : 8d f9 3e STA $3ef9 ; (pipes[0] + 13)
2437 : a9 ab __ LDA #$ab
2439 : 8d f8 3e STA $3ef8 ; (pipes[0] + 12)
243c : 20 49 25 JSR $2549 ; (gap_next.s4 + 0)
243f : 8d fa 3e STA $3efa ; (pipes[0] + 14)
2442 : a9 00 __ LDA #$00
2444 : 8d fb 3e STA $3efb ; (pipes[0] + 15)
2447 : 20 76 25 JSR $2576 ; (field.s4 + 0)
--------------------------------------------------------------------
bird_draw: ; bird_draw()->void
; 305, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
244a : ad b9 3c LDA $3cb9 ; (bird_row + 0)
244d : 85 4b __ STA T4 + 0 
244f : ad f1 3c LDA $3cf1 ; (bird_y + 0)
2452 : 85 49 __ STA T2 + 0 
2454 : ad f2 3c LDA $3cf2 ; (bird_y + 1)
2457 : 4a __ __ LSR
2458 : 66 49 __ ROR T2 + 0 
245a : 4a __ __ LSR
245b : 66 49 __ ROR T2 + 0 
245d : 4a __ __ LSR
245e : 66 49 __ ROR T2 + 0 
2460 : 4a __ __ LSR
2461 : 66 49 __ ROR T2 + 0 
2463 : a6 49 __ LDX T2 + 0 
2465 : 86 4a __ STX T3 + 0 
2467 : 4a __ __ LSR
2468 : 66 4a __ ROR T3 + 0 
246a : 4a __ __ LSR
246b : 66 4a __ ROR T3 + 0 
246d : 4a __ __ LSR
246e : 66 4a __ ROR T3 + 0 
2470 : a5 4a __ LDA T3 + 0 
2472 : 8d b9 3c STA $3cb9 ; (bird_row + 0)
2475 : a5 4b __ LDA T4 + 0 
2477 : c9 ff __ CMP #$ff
2479 : f0 1b __ BEQ $2496 ; (bird_draw.s13 + 0)
.s5:
247b : 85 4c __ STA T5 + 0 
247d : 4c 84 24 JMP $2484 ; (bird_draw.l6 + 0)
.s10:
2480 : a5 4b __ LDA T4 + 0 
2482 : e6 4c __ INC T5 + 0 
.l6:
2484 : 18 __ __ CLC
2485 : 69 02 __ ADC #$02
2487 : b0 04 __ BCS $248d ; (bird_draw.s7 + 0)
.s23:
2489 : c5 4c __ CMP T5 + 0 
248b : 90 09 __ BCC $2496 ; (bird_draw.s13 + 0)
.s7:
248d : a5 4c __ LDA T5 + 0 
248f : c9 15 __ CMP #$15
2491 : b0 03 __ BCS $2496 ; (bird_draw.s13 + 0)
2493 : 4c 22 25 JMP $2522 ; (bird_draw.s8 + 0)
.s13:
2496 : a9 01 __ LDA #$01
2498 : cd ec 3c CMP $3cec ; (state + 0)
249b : d0 0b __ BNE $24a8 ; (bird_draw.s25 + 0)
.s14:
249d : ad fe 3c LDA $3cfe ; (frame_count + 0)
24a0 : 29 0c __ AND #$0c
24a2 : 4a __ __ LSR
24a3 : 4a __ __ LSR
24a4 : aa __ __ TAX
24a5 : bd b5 3c LDA $3cb5,x ; (flap[0] + 0)
.s25:
24a8 : 0a __ __ ASL
24a9 : 0a __ __ ASL
24aa : 0a __ __ ASL
24ab : 45 49 __ EOR T2 + 0 
24ad : 29 f8 __ AND #$f8
24af : 45 49 __ EOR T2 + 0 
24b1 : 8d fc 3d STA $3dfc ; (bird_pose + 0)
24b4 : a5 4a __ LDA T3 + 0 
24b6 : ae fd 3d LDX $3dfd ; (shown_set + 0)
24b9 : cd ba 3c CMP $3cba ; (shown_row + 0)
24bc : f0 06 __ BEQ $24c4 ; (bird_draw.s15 + 0)
.s22:
24be : 8a __ __ TXA
24bf : 49 01 __ EOR #$01
24c1 : aa __ __ TAX
24c2 : a5 4a __ LDA T3 + 0 
.s15:
24c4 : 8e fe 3d STX $3dfe ; (bird_set + 0)
24c7 : c5 4b __ CMP T4 + 0 
24c9 : d0 05 __ BNE $24d0 ; (bird_draw.s17 + 0)
.s16:
24cb : ad f7 3c LDA $3cf7 ; (bird_stale + 0)
24ce : f0 51 __ BEQ $2521 ; (bird_draw.s3 + 0)
.s17:
24d0 : 86 1b __ STX ACCU + 0 
24d2 : a9 00 __ LDA #$00
24d4 : 8d f7 3c STA $3cf7 ; (bird_stale + 0)
24d7 : 85 1c __ STA ACCU + 1 
24d9 : a9 0f __ LDA #$0f
24db : 20 a3 3b JSR $3ba3 ; (mul16by8 + 0)
24de : 18 __ __ CLC
24df : a5 1b __ LDA ACCU + 0 
24e1 : 69 60 __ ADC #$60
24e3 : 85 49 __ STA T2 + 0 
24e5 : a9 00 __ LDA #$00
24e7 : 85 4b __ STA T4 + 0 
24e9 : 18 __ __ CLC
.l18:
24ea : 65 4a __ ADC T3 + 0 
24ec : b0 33 __ BCS $2521 ; (bird_draw.s3 + 0)
.s21:
24ee : c9 15 __ CMP #$15
24f0 : b0 2f __ BCS $2521 ; (bird_draw.s3 + 0)
.s19:
24f2 : 85 0e __ STA P1 
24f4 : a9 1e __ LDA #$1e
24f6 : 85 4d __ STA T6 + 0 
24f8 : a2 00 __ LDX #$00
24fa : 90 04 __ BCC $2500 ; (bird_draw.l27 + 0)
.s26:
24fc : e6 4d __ INC T6 + 0 
24fe : a5 4d __ LDA T6 + 0 
.l27:
2500 : 86 4c __ STX T5 + 0 
2502 : 85 0d __ STA P0 
2504 : a5 49 __ LDA T2 + 0 
2506 : 85 0f __ STA P2 
2508 : bd bb 3c LDA $3cbb,x ; (bird_colours[0] + 0)
250b : 85 10 __ STA P3 
250d : 20 00 27 JSR $2700 ; (cell.s4 + 0)
2510 : a6 4c __ LDX T5 + 0 
2512 : e8 __ __ INX
2513 : e0 05 __ CPX #$05
2515 : e6 49 __ INC T2 + 0 
2517 : 90 e3 __ BCC $24fc ; (bird_draw.s26 + 0)
.s20:
2519 : e6 4b __ INC T4 + 0 
251b : a5 4b __ LDA T4 + 0 
251d : c9 03 __ CMP #$03
251f : 90 c9 __ BCC $24ea ; (bird_draw.l18 + 0)
.s3:
2521 : 60 __ __ RTS
.s8:
2522 : c5 4a __ CMP T3 + 0 
2524 : 90 0f __ BCC $2535 ; (bird_draw.s9 + 0)
.s11:
2526 : a5 4a __ LDA T3 + 0 
2528 : 69 01 __ ADC #$01
252a : 90 03 __ BCC $252f ; (bird_draw.s12 + 0)
252c : 4c 80 24 JMP $2480 ; (bird_draw.s10 + 0)
.s12:
252f : c5 4c __ CMP T5 + 0 
2531 : b0 f9 __ BCS $252c ; (bird_draw.s11 + 6)
.s28:
2533 : a5 4c __ LDA T5 + 0 
.s9:
2535 : 85 0e __ STA P1 
2537 : a9 1e __ LDA #$1e
2539 : 85 0d __ STA P0 
.l24:
253b : 20 1a 26 JSR $261a ; (background.s4 + 0)
253e : e6 0d __ INC P0 
2540 : a5 0d __ LDA P0 
2542 : c9 23 __ CMP #$23
2544 : 90 f5 __ BCC $253b ; (bird_draw.l24 + 0)
2546 : 4c 80 24 JMP $2480 ; (bird_draw.s10 + 0)
--------------------------------------------------------------------
gap_next: ; gap_next()->u8
; 195, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2549 : ad b4 3c LDA $3cb4 ; (random_state + 1)
254c : 85 1c __ STA ACCU + 1 
254e : ad b3 3c LDA $3cb3 ; (random_state + 0)
2551 : 29 01 __ AND #$01
2553 : f0 02 __ BEQ $2557 ; (gap_next.s6 + 0)
.s5:
2555 : a9 b4 __ LDA #$b4
.s6:
2557 : aa __ __ TAX
2558 : ad b3 3c LDA $3cb3 ; (random_state + 0)
255b : 46 1c __ LSR ACCU + 1 
255d : 6a __ __ ROR
255e : 85 1b __ STA ACCU + 0 
2560 : 8d b3 3c STA $3cb3 ; (random_state + 0)
2563 : 8a __ __ TXA
2564 : 45 1c __ EOR ACCU + 1 
2566 : 85 1c __ STA ACCU + 1 
2568 : 8d b4 3c STA $3cb4 ; (random_state + 1)
256b : a9 0c __ LDA #$0c
256d : 20 10 3c JSR $3c10 ; (divmod + 53)
2570 : 18 __ __ CLC
2571 : a5 05 __ LDA WORK + 2 
2573 : 69 02 __ ADC #$02
.s3:
2575 : 60 __ __ RTS
--------------------------------------------------------------------
field: ; field()->void
; 491, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2576 : a9 01 __ LDA #$01
2578 : 8d f6 3c STA $3cf6 ; (redrawn + 0)
257b : 8d f7 3c STA $3cf7 ; (bird_stale + 0)
257e : a9 00 __ LDA #$00
2580 : 85 4a __ STA T1 + 0 
.l5:
2582 : 85 0e __ STA P1 
2584 : a9 00 __ LDA #$00
2586 : 85 0d __ STA P0 
.l8:
2588 : 20 1a 26 JSR $261a ; (background.s4 + 0)
258b : e6 0d __ INC P0 
258d : a5 0d __ LDA P0 
258f : c9 50 __ CMP #$50
2591 : 90 f5 __ BCC $2588 ; (field.l8 + 0)
.s6:
2593 : e6 4a __ INC T1 + 0 
2595 : a5 4a __ LDA T1 + 0 
2597 : c9 19 __ CMP #$19
2599 : 90 e7 __ BCC $2582 ; (field.l5 + 0)
.s7:
259b : a9 02 __ LDA #$02
259d : 85 0d __ STA P0 
259f : a9 0d __ LDA #$0d
25a1 : 85 10 __ STA P3 
25a3 : a9 17 __ LDA #$17
25a5 : 85 0e __ STA P1 
25a7 : a9 1b __ LDA #$1b
25a9 : 85 0f __ STA P2 
25ab : 20 00 27 JSR $2700 ; (cell.s4 + 0)
25ae : e6 0f __ INC P2 
25b0 : a9 48 __ LDA #$48
25b2 : 85 0d __ STA P0 
25b4 : 20 00 27 JSR $2700 ; (cell.s4 + 0)
25b7 : ad ed 3c LDA $3ced ; (score + 0)
25ba : 85 12 __ STA P5 
25bc : a9 04 __ LDA #$04
25be : 85 11 __ STA P4 
25c0 : ad ee 3c LDA $3cee ; (score + 1)
25c3 : 85 13 __ STA P6 
25c5 : 20 d6 25 JSR $25d6 ; (number.s4 + 0)
25c8 : a9 4a __ LDA #$4a
25ca : 85 11 __ STA P4 
--------------------------------------------------------------------
number@proxy: ; number@proxy
25cc : ad fc 3c LDA $3cfc ; (best + 0)
25cf : 85 12 __ STA P5 
25d1 : ad fd 3c LDA $3cfd ; (best + 1)
25d4 : 85 13 __ STA P6 
--------------------------------------------------------------------
number: ; number(u8,u16)->void
; 187, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
25d6 : a5 12 __ LDA P5 ; (n + 0)
25d8 : 85 1b __ STA ACCU + 0 
25da : a9 04 __ LDA #$04
25dc : 85 49 __ STA T3 + 0 
25de : a5 13 __ LDA P6 ; (n + 1)
25e0 : 85 1c __ STA ACCU + 1 
25e2 : 18 __ __ CLC
25e3 : a9 17 __ LDA #$17
25e5 : 85 0e __ STA P1 
25e7 : a9 0d __ LDA #$0d
25e9 : 85 10 __ STA P3 
25eb : a5 11 __ LDA P4 ; (x + 0)
25ed : 69 03 __ ADC #$03
.l5:
25ef : 85 0d __ STA P0 
25f1 : a9 0a __ LDA #$0a
25f3 : 20 10 3c JSR $3c10 ; (divmod + 53)
25f6 : a5 1b __ LDA ACCU + 0 
25f8 : 85 47 __ STA T0 + 0 
25fa : a5 1c __ LDA ACCU + 1 
25fc : 85 48 __ STA T0 + 1 
25fe : 18 __ __ CLC
25ff : a5 05 __ LDA WORK + 2 
2601 : 69 11 __ ADC #$11
2603 : 85 0f __ STA P2 
2605 : 20 00 27 JSR $2700 ; (cell.s4 + 0)
2608 : a5 47 __ LDA T0 + 0 
260a : 85 1b __ STA ACCU + 0 
260c : a5 48 __ LDA T0 + 1 
260e : 85 1c __ STA ACCU + 1 
2610 : 38 __ __ SEC
2611 : a5 0d __ LDA P0 
2613 : e9 01 __ SBC #$01
2615 : c6 49 __ DEC T3 + 0 
2617 : d0 d6 __ BNE $25ef ; (number.l5 + 0)
.s3:
2619 : 60 __ __ RTS
--------------------------------------------------------------------
background: ; background(u8,u8)->void
; 201, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
261a : a9 20 __ LDA #$20
261c : 85 43 __ STA T0 + 0 
261e : 85 0f __ STA P2 
2620 : a9 04 __ LDA #$04
2622 : 85 1d __ STA ACCU + 2 
2624 : 85 10 __ STA P3 
2626 : a5 0d __ LDA P0 ; (x + 0)
2628 : c9 50 __ CMP #$50
262a : b0 0c __ BCS $2638 ; (background.s5 + 0)
.s6:
262c : a5 0e __ LDA P1 ; (y + 0)
262e : c9 15 __ CMP #$15
2630 : d0 09 __ BNE $263b ; (background.s8 + 0)
.s7:
2632 : a9 05 __ LDA #$05
2634 : 85 0f __ STA P2 
.s42:
2636 : 85 10 __ STA P3 
.s5:
2638 : 4c 00 27 JMP $2700 ; (cell.s4 + 0)
.s8:
263b : c9 16 __ CMP #$16
263d : a9 00 __ LDA #$00
263f : 90 06 __ BCC $2647 ; (background.s10 + 0)
.s9:
2641 : 85 0f __ STA P2 
2643 : a9 0d __ LDA #$0d
2645 : b0 ef __ BCS $2636 ; (background.s42 + 0)
.s10:
2647 : 85 1b __ STA ACCU + 0 
.l11:
2649 : 0a __ __ ASL
264a : 0a __ __ ASL
264b : aa __ __ TAX
264c : 38 __ __ SEC
264d : a5 0d __ LDA P0 ; (x + 0)
264f : fd ec 3e SBC $3eec,x ; (pipes[0].x + 0)
2652 : a8 __ __ TAY
2653 : a9 00 __ LDA #$00
2655 : fd ed 3e SBC $3eed,x ; (pipes[0].x + 1)
2658 : 85 1c __ STA ACCU + 1 
265a : 49 80 __ EOR #$80
265c : c9 7f __ CMP #$7f
265e : d0 02 __ BNE $2662 ; (background.s38 + 0)
.s37:
2660 : c0 ff __ CPY #$ff
.s38:
2662 : 90 69 __ BCC $26cd ; (background.s17 + 0)
.s12:
2664 : a5 1c __ LDA ACCU + 1 
2666 : 30 06 __ BMI $266e ; (background.s13 + 0)
.s36:
2668 : d0 63 __ BNE $26cd ; (background.s17 + 0)
.s35:
266a : c0 08 __ CPY #$08
266c : b0 5f __ BCS $26cd ; (background.s17 + 0)
.s13:
266e : a5 0e __ LDA P1 ; (y + 0)
2670 : dd ee 3e CMP $3eee,x ; (pipes[0].gap + 0)
2673 : 90 0d __ BCC $2682 ; (background.s14 + 0)
.s33:
2675 : bd ee 3e LDA $3eee,x ; (pipes[0].gap + 0)
2678 : 69 06 __ ADC #$06
267a : b0 51 __ BCS $26cd ; (background.s17 + 0)
.s34:
267c : c5 0e __ CMP P1 ; (y + 0)
267e : 90 02 __ BCC $2682 ; (background.s14 + 0)
.s41:
2680 : d0 4b __ BNE $26cd ; (background.s17 + 0)
.s14:
2682 : bd ee 3e LDA $3eee,x ; (pipes[0].gap + 0)
2685 : 38 __ __ SEC
2686 : e9 01 __ SBC #$01
2688 : 85 47 __ STA T3 + 0 
268a : a9 00 __ LDA #$00
268c : e9 00 __ SBC #$00
268e : 85 48 __ STA T3 + 1 
2690 : d0 06 __ BNE $2698 ; (background.s23 + 0)
.s32:
2692 : a5 0e __ LDA P1 ; (y + 0)
2694 : c5 47 __ CMP T3 + 0 
2696 : f0 49 __ BEQ $26e1 ; (background.s15 + 0)
.s23:
2698 : 18 __ __ CLC
2699 : a5 47 __ LDA T3 + 0 
269b : 69 08 __ ADC #$08
269d : 85 47 __ STA T3 + 0 
269f : a5 48 __ LDA T3 + 1 
26a1 : 69 00 __ ADC #$00
26a3 : d0 06 __ BNE $26ab ; (background.s24 + 0)
.s31:
26a5 : a5 0e __ LDA P1 ; (y + 0)
26a7 : c5 47 __ CMP T3 + 0 
26a9 : f0 36 __ BEQ $26e1 ; (background.s15 + 0)
.s24:
26ab : a5 1c __ LDA ACCU + 1 
26ad : d0 1e __ BNE $26cd ; (background.s17 + 0)
.s30:
26af : c0 07 __ CPY #$07
26b1 : b0 1a __ BCS $26cd ; (background.s17 + 0)
.s25:
26b3 : a9 04 __ LDA #$04
26b5 : 85 1d __ STA ACCU + 2 
26b7 : 98 __ __ TYA
26b8 : d0 07 __ BNE $26c1 ; (background.s27 + 0)
.s26:
26ba : a9 0a __ LDA #$0a
.s39:
26bc : 85 43 __ STA T0 + 0 
26be : 4c cd 26 JMP $26cd ; (background.s17 + 0)
.s27:
26c1 : c9 06 __ CMP #$06
26c3 : d0 04 __ BNE $26c9 ; (background.s29 + 0)
.s28:
26c5 : a9 0c __ LDA #$0c
26c7 : d0 f3 __ BNE $26bc ; (background.s39 + 0)
.s29:
26c9 : a9 0b __ LDA #$0b
26cb : 85 43 __ STA T0 + 0 
.s17:
26cd : e6 1b __ INC ACCU + 0 
26cf : a5 1b __ LDA ACCU + 0 
26d1 : c9 04 __ CMP #$04
26d3 : f0 03 __ BEQ $26d8 ; (background.s40 + 0)
26d5 : 4c 49 26 JMP $2649 ; (background.l11 + 0)
.s40:
26d8 : a5 43 __ LDA T0 + 0 
26da : 85 0f __ STA P2 
26dc : a5 1d __ LDA ACCU + 2 
26de : 4c 36 26 JMP $2636 ; (background.s42 + 0)
.s15:
26e1 : a9 05 __ LDA #$05
26e3 : 85 1d __ STA ACCU + 2 
26e5 : c0 ff __ CPY #$ff
26e7 : d0 04 __ BNE $26ed ; (background.s18 + 0)
.s16:
26e9 : a9 0d __ LDA #$0d
26eb : d0 cf __ BNE $26bc ; (background.s39 + 0)
.s18:
26ed : 98 __ __ TYA
26ee : d0 04 __ BNE $26f4 ; (background.s20 + 0)
.s19:
26f0 : a9 0e __ LDA #$0e
26f2 : d0 c8 __ BNE $26bc ; (background.s39 + 0)
.s20:
26f4 : c9 07 __ CMP #$07
26f6 : d0 04 __ BNE $26fc ; (background.s22 + 0)
.s21:
26f8 : a9 10 __ LDA #$10
26fa : d0 c0 __ BNE $26bc ; (background.s39 + 0)
.s22:
26fc : a9 0f __ LDA #$0f
26fe : d0 bc __ BNE $26bc ; (background.s39 + 0)
--------------------------------------------------------------------
cell: ; cell(u8,u8,u8,u8)->void
; 182, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2700 : a5 0e __ LDA P1 ; (y + 0)
2702 : 0a __ __ ASL
2703 : aa __ __ TAX
2704 : bd a5 55 LDA $55a5,x ; (row_addr[0] + 0)
2707 : 65 0d __ ADC P0 ; (x + 0)
2709 : a8 __ __ TAY
270a : bd a6 55 LDA $55a6,x ; (row_addr[0] + 1)
270d : 69 00 __ ADC #$00
270f : 85 1c __ STA ACCU + 1 
2711 : 18 __ __ CLC
2712 : 69 55 __ ADC #$55
2714 : 85 44 __ STA T1 + 1 
2716 : a9 d7 __ LDA #$d7
2718 : 85 43 __ STA T1 + 0 
271a : a5 0f __ LDA P2 ; (g + 0)
271c : d1 43 __ CMP (T1 + 0),y 
271e : d0 04 __ BNE $2724 ; (cell.s5 + 0)
.s13:
2720 : a9 00 __ LDA #$00
2722 : f0 04 __ BEQ $2728 ; (cell.s6 + 0)
.s5:
2724 : 91 43 __ STA (T1 + 0),y 
2726 : a9 01 __ LDA #$01
.s6:
2728 : 85 45 __ STA T2 + 0 
272a : a9 a7 __ LDA #$a7
272c : 85 43 __ STA T1 + 0 
272e : 18 __ __ CLC
272f : a9 5d __ LDA #$5d
2731 : 65 1c __ ADC ACCU + 1 
2733 : 85 44 __ STA T1 + 1 
2735 : a5 10 __ LDA P3 ; (col + 0)
2737 : d1 43 __ CMP (T1 + 0),y 
2739 : f0 0b __ BEQ $2746 ; (cell.s12 + 0)
.s7:
273b : 91 43 __ STA (T1 + 0),y 
273d : a5 45 __ LDA T2 + 0 
273f : 09 02 __ ORA #$02
2741 : 85 45 __ STA T2 + 0 
2743 : 4c 4a 27 JMP $274a ; (cell.s8 + 0)
.s12:
2746 : a5 45 __ LDA T2 + 0 
2748 : f0 58 __ BEQ $27a2 ; (cell.s3 + 0)
.s8:
274a : 0a __ __ ASL
274b : 0a __ __ ASL
274c : 05 45 __ ORA T2 + 0 
274e : 85 43 __ STA T1 + 0 
2750 : a9 77 __ LDA #$77
2752 : 85 45 __ STA T2 + 0 
2754 : 18 __ __ CLC
2755 : a9 65 __ LDA #$65
2757 : 65 1c __ ADC ACCU + 1 
2759 : 85 46 __ STA T2 + 1 
275b : b1 45 __ LDA (T2 + 0),y 
275d : aa __ __ TAX
275e : 05 43 __ ORA T1 + 0 
2760 : 91 45 __ STA (T2 + 0),y 
2762 : 8a __ __ TXA
2763 : d0 31 __ BNE $2796 ; (cell.s9 + 0)
.s11:
2765 : ad f8 3c LDA $3cf8 ; (dirty_count + 0)
2768 : 85 43 __ STA T1 + 0 
276a : 18 __ __ CLC
276b : 69 01 __ ADC #$01
276d : 8d f8 3c STA $3cf8 ; (dirty_count + 0)
2770 : ad f9 3c LDA $3cf9 ; (dirty_count + 1)
2773 : 85 44 __ STA T1 + 1 
2775 : 69 00 __ ADC #$00
2777 : 8d f9 3c STA $3cf9 ; (dirty_count + 1)
277a : 06 43 __ ASL T1 + 0 
277c : 26 44 __ ROL T1 + 1 
277e : 18 __ __ CLC
277f : a9 48 __ LDA #$48
2781 : 65 43 __ ADC T1 + 0 
2783 : 85 43 __ STA T1 + 0 
2785 : a9 6d __ LDA #$6d
2787 : 65 44 __ ADC T1 + 1 
2789 : 85 44 __ STA T1 + 1 
278b : 98 __ __ TYA
278c : a0 00 __ LDY #$00
278e : 91 43 __ STA (T1 + 0),y 
2790 : a5 1c __ LDA ACCU + 1 
2792 : c8 __ __ INY
2793 : 91 43 __ STA (T1 + 0),y 
2795 : 8a __ __ TXA
.s9:
2796 : 29 03 __ AND #$03
2798 : d0 08 __ BNE $27a2 ; (cell.s3 + 0)
.s10:
279a : ee fa 3c INC $3cfa ; (front_count + 0)
279d : d0 03 __ BNE $27a2 ; (cell.s3 + 0)
.s14:
279f : ee fb 3c INC $3cfb ; (front_count + 1)
.s3:
27a2 : 60 __ __ RTS
--------------------------------------------------------------------
game_over: ; game_over()->void
; 524, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
27a3 : a9 1e __ LDA #$1e
27a5 : 8d fc 7c STA $7cfc ; (death_delay + 0)
27a8 : a9 02 __ LDA #$02
27aa : 8d ec 3c STA $3cec ; (state + 0)
27ad : a9 4a __ LDA #$4a
27af : 85 11 __ STA P4 
27b1 : ad fd 3c LDA $3cfd ; (best + 1)
27b4 : cd ee 3c CMP $3cee ; (score + 1)
27b7 : d0 06 __ BNE $27bf ; (game_over.s8 + 0)
.s7:
27b9 : ad fc 3c LDA $3cfc ; (best + 0)
27bc : cd ed 3c CMP $3ced ; (score + 0)
.s8:
27bf : b0 0c __ BCS $27cd ; (game_over.s6 + 0)
.s5:
27c1 : ad ed 3c LDA $3ced ; (score + 0)
27c4 : 8d fc 3c STA $3cfc ; (best + 0)
27c7 : ad ee 3c LDA $3cee ; (score + 1)
27ca : 8d fd 3c STA $3cfd ; (best + 1)
.s6:
27cd : 20 cc 25 JSR $25cc ; (number@proxy + 0)
--------------------------------------------------------------------
banner: ; banner()->void
; 466, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
27d0 : a2 00 __ LDX #$00
27d2 : ad ec 3c LDA $3cec ; (state + 0)
27d5 : 85 4a __ STA T4 + 0 
27d7 : d0 08 __ BNE $27e1 ; (banner.s6 + 0)
.s5:
27d9 : a9 01 __ LDA #$01
27db : 85 4b __ STA T5 + 0 
27dd : a9 02 __ LDA #$02
27df : d0 04 __ BNE $27e5 ; (banner.s7 + 0)
.s6:
27e1 : 86 4b __ STX T5 + 0 
27e3 : a9 06 __ LDA #$06
.s7:
27e5 : 86 4c __ STX T6 + 0 
27e7 : 8d ff 3d STA $3dff ; (panel_y + 0)
27ea : 85 49 __ STA T3 + 0 
27ec : a9 0d __ LDA #$0d
27ee : 85 10 __ STA P3 
.l8:
27f0 : a0 00 __ LDY #$00
27f2 : 84 4d __ STY T7 + 0 
27f4 : 84 43 __ STY T1 + 0 
.l24:
27f6 : a5 4c __ LDA T6 + 0 
27f8 : f0 08 __ BEQ $2802 ; (banner.s11 + 0)
.s9:
27fa : c9 07 __ CMP #$07
27fc : d0 10 __ BNE $280e ; (banner.s23 + 0)
.s10:
27fe : a9 02 __ LDA #$02
2800 : 85 43 __ STA T1 + 0 
.s11:
2802 : a5 4d __ LDA T7 + 0 
2804 : c9 01 __ CMP #$01
2806 : a9 00 __ LDA #$00
2808 : 69 9a __ ADC #$9a
280a : 65 43 __ ADC T1 + 0 
280c : 85 43 __ STA T1 + 0 
.s23:
280e : a5 49 __ LDA T3 + 0 
2810 : 85 0e __ STA P1 
.l12:
2812 : a5 43 __ LDA T1 + 0 
2814 : 85 0f __ STA P2 
2816 : 98 __ __ TYA
2817 : 18 __ __ CLC
2818 : 69 1c __ ADC #$1c
281a : 85 0d __ STA P0 
281c : 20 00 27 JSR $2700 ; (cell.s4 + 0)
281f : e6 4d __ INC T7 + 0 
2821 : a5 4d __ LDA T7 + 0 
2823 : c9 18 __ CMP #$18
2825 : b0 11 __ BCS $2838 ; (banner.s14 + 0)
.s13:
2827 : a5 0d __ LDA P0 
2829 : 69 e5 __ ADC #$e5
282b : a8 __ __ TAY
282c : a9 00 __ LDA #$00
282e : 85 43 __ STA T1 + 0 
2830 : a5 4d __ LDA T7 + 0 
2832 : c9 17 __ CMP #$17
2834 : d0 dc __ BNE $2812 ; (banner.l12 + 0)
2836 : f0 be __ BEQ $27f6 ; (banner.l24 + 0)
.s14:
2838 : e6 49 __ INC T3 + 0 
283a : e6 4c __ INC T6 + 0 
283c : a5 4c __ LDA T6 + 0 
283e : c9 08 __ CMP #$08
2840 : 90 ae __ BCC $27f0 ; (banner.l8 + 0)
.s15:
2842 : a5 4b __ LDA T5 + 0 
2844 : f0 1a __ BEQ $2860 ; (banner.s18 + 0)
.s16:
2846 : a9 29 __ LDA #$29
2848 : 85 13 __ STA P6 
284a : a9 52 __ LDA #$52
284c : 85 12 __ STA P5 
284e : 20 ca 28 JSR $28ca ; (panel_text@proxy + 0)
2851 : a9 05 __ LDA #$05
.s22:
2853 : 85 11 __ STA P4 
2855 : a9 29 __ LDA #$29
2857 : a0 5c __ LDY #$5c
.s17:
2859 : 84 12 __ STY P5 
285b : 85 13 __ STA P6 
285d : 4c ce 28 JMP $28ce ; (panel_text.s4 + 0)
.s18:
2860 : a5 4a __ LDA T4 + 0 
2862 : c9 02 __ CMP #$02
2864 : d0 49 __ BNE $28af ; (banner.s20 + 0)
.s19:
2866 : a9 01 __ LDA #$01
2868 : 85 11 __ STA P4 
286a : a9 29 __ LDA #$29
286c : 85 13 __ STA P6 
286e : a9 6a __ LDA #$6a
2870 : 85 12 __ STA P5 
2872 : 20 ce 28 JSR $28ce ; (panel_text.s4 + 0)
2875 : ad ed 3c LDA $3ced ; (score + 0)
2878 : 85 0f __ STA P2 
287a : a9 ca __ LDA #$ca
287c : 85 0d __ STA P0 
287e : a9 29 __ LDA #$29
2880 : 85 0e __ STA P1 
2882 : ad ee 3c LDA $3cee ; (score + 1)
2885 : 85 10 __ STA P3 
2887 : 20 74 29 JSR $2974 ; (score_line.s4 + 0)
288a : a9 03 __ LDA #$03
288c : 85 11 __ STA P4 
288e : 20 96 3c JSR $3c96 ; (panel_text@proxy + 0)
2891 : ad fc 3c LDA $3cfc ; (best + 0)
2894 : 85 0f __ STA P2 
2896 : a9 d1 __ LDA #$d1
2898 : 85 0d __ STA P0 
289a : a9 29 __ LDA #$29
289c : 85 0e __ STA P1 
289e : ad fd 3c LDA $3cfd ; (best + 1)
28a1 : 85 10 __ STA P3 
28a3 : 20 74 29 JSR $2974 ; (score_line.s4 + 0)
28a6 : e6 11 __ INC P4 
28a8 : 20 96 3c JSR $3c96 ; (panel_text@proxy + 0)
28ab : a9 06 __ LDA #$06
28ad : d0 a4 __ BNE $2853 ; (banner.s22 + 0)
.s20:
28af : c9 03 __ CMP #$03
28b1 : d0 16 __ BNE $28c9 ; (banner.s3 + 0)
.s21:
28b3 : a9 29 __ LDA #$29
28b5 : 85 13 __ STA P6 
28b7 : a9 d8 __ LDA #$d8
28b9 : 85 12 __ STA P5 
28bb : 20 ca 28 JSR $28ca ; (panel_text@proxy + 0)
28be : a9 05 __ LDA #$05
28c0 : 85 11 __ STA P4 
28c2 : a9 29 __ LDA #$29
28c4 : a0 df __ LDY #$df
28c6 : 4c 59 28 JMP $2859 ; (banner.s17 + 0)
.s3:
28c9 : 60 __ __ RTS
--------------------------------------------------------------------
panel_text@proxy: ; panel_text@proxy
28ca : a9 02 __ LDA #$02
28cc : 85 11 __ STA P4 
--------------------------------------------------------------------
panel_text: ; panel_text(u8,const u8*)->void
; 444, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
28ce : a0 00 __ LDY #$00
28d0 : b1 12 __ LDA (P5),y ; (s + 0)
28d2 : f0 7d __ BEQ $2951 ; (panel_text.s3 + 0)
.s5:
28d4 : 85 48 __ STA T4 + 0 
28d6 : a5 12 __ LDA P5 ; (s + 0)
28d8 : 85 43 __ STA T0 + 0 
28da : a5 13 __ LDA P6 ; (s + 1)
28dc : 85 44 __ STA T0 + 1 
28de : ad ff 3d LDA $3dff ; (panel_y + 0)
28e1 : 18 __ __ CLC
28e2 : 65 11 __ ADC P4 ; (y + 0)
28e4 : 85 47 __ STA T2 + 0 
28e6 : a2 00 __ LDX #$00
.l15:
28e8 : c8 __ __ INY
28e9 : d0 02 __ BNE $28ed ; (panel_text.s18 + 0)
.s17:
28eb : e6 44 __ INC T0 + 1 
.s18:
28ed : e8 __ __ INX
28ee : b1 43 __ LDA (T0 + 0),y 
28f0 : d0 f6 __ BNE $28e8 ; (panel_text.l15 + 0)
.s6:
28f2 : a5 48 __ LDA T4 + 0 
28f4 : f0 5b __ BEQ $2951 ; (panel_text.s3 + 0)
.s7:
28f6 : 86 45 __ STX T1 + 0 
28f8 : 38 __ __ SEC
28f9 : a9 18 __ LDA #$18
28fb : e5 45 __ SBC T1 + 0 
28fd : a8 __ __ TAY
28fe : a9 00 __ LDA #$00
2900 : e9 00 __ SBC #$00
2902 : aa __ __ TAX
2903 : 0a __ __ ASL
2904 : 98 __ __ TYA
2905 : 69 00 __ ADC #$00
2907 : a8 __ __ TAY
2908 : 8a __ __ TXA
2909 : 69 00 __ ADC #$00
290b : 4a __ __ LSR
290c : 98 __ __ TYA
290d : 6a __ __ ROR
290e : 18 __ __ CLC
290f : 69 1c __ ADC #$1c
2911 : 85 48 __ STA T4 + 0 
2913 : a9 0d __ LDA #$0d
2915 : 85 10 __ STA P3 
.l8:
2917 : a0 00 __ LDY #$00
2919 : 84 0f __ STY P2 
291b : b1 12 __ LDA (P5),y ; (s + 0)
291d : c9 30 __ CMP #$30
291f : 90 17 __ BCC $2938 ; (panel_text.s11 + 0)
.s9:
2921 : c9 3a __ CMP #$3a
2923 : b0 07 __ BCS $292c ; (panel_text.s12 + 0)
.s10:
2925 : e9 1e __ SBC #$1e
.s16:
2927 : 85 0f __ STA P2 
2929 : 4c 38 29 JMP $2938 ; (panel_text.s11 + 0)
.s12:
292c : c9 41 __ CMP #$41
292e : 90 08 __ BCC $2938 ; (panel_text.s11 + 0)
.s13:
2930 : c9 5b __ CMP #$5b
2932 : b0 04 __ BCS $2938 ; (panel_text.s11 + 0)
.s14:
2934 : e9 c0 __ SBC #$c0
2936 : 85 0f __ STA P2 
.s11:
2938 : a5 48 __ LDA T4 + 0 
293a : 85 0d __ STA P0 
293c : a5 47 __ LDA T2 + 0 
293e : 85 0e __ STA P1 
2940 : 20 00 27 JSR $2700 ; (cell.s4 + 0)
2943 : e6 12 __ INC P5 ; (s + 0)
2945 : d0 02 __ BNE $2949 ; (panel_text.s20 + 0)
.s19:
2947 : e6 13 __ INC P6 ; (s + 1)
.s20:
2949 : e6 48 __ INC T4 + 0 
294b : a0 00 __ LDY #$00
294d : b1 12 __ LDA (P5),y ; (s + 0)
294f : d0 c6 __ BNE $2917 ; (panel_text.l8 + 0)
.s3:
2951 : 60 __ __ RTS
--------------------------------------------------------------------
2952 : __ __ __ BYT 46 4c 41 50 50 59 20 38 30 00                   : FLAPPY 80.
--------------------------------------------------------------------
295c : __ __ __ BYT 53 50 41 43 45 20 4f 52 20 46 49 52 45 00       : SPACE OR FIRE.
--------------------------------------------------------------------
296a : __ __ __ BYT 47 41 4d 45 20 4f 56 45 52 00                   : GAME OVER.
--------------------------------------------------------------------
score_line: ; score_line(const u8*,u16)->const u8*
; 456, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2974 : a0 00 __ LDY #$00
.l5:
2976 : b1 0d __ LDA (P0),y ; (label + 0)
2978 : 99 e8 7c STA $7ce8,y ; (line[0] + 0)
297b : c8 __ __ INY
297c : c0 06 __ CPY #$06
297e : d0 f6 __ BNE $2976 ; (score_line.l5 + 0)
.s6:
2980 : a9 00 __ LDA #$00
2982 : 8d f2 7c STA $7cf2 ; (line[0] + 10)
2985 : a5 0f __ LDA P2 ; (n + 0)
2987 : 85 1b __ STA ACCU + 0 
2989 : a5 10 __ LDA P3 ; (n + 1)
298b : 85 1c __ STA ACCU + 1 
298d : a9 0a __ LDA #$0a
298f : 20 10 3c JSR $3c10 ; (divmod + 53)
2992 : 18 __ __ CLC
2993 : a5 05 __ LDA WORK + 2 
2995 : 69 30 __ ADC #$30
2997 : 8d f1 7c STA $7cf1 ; (line[0] + 9)
299a : a9 0a __ LDA #$0a
299c : 20 10 3c JSR $3c10 ; (divmod + 53)
299f : 18 __ __ CLC
29a0 : a5 05 __ LDA WORK + 2 
29a2 : 69 30 __ ADC #$30
29a4 : 8d f0 7c STA $7cf0 ; (line[0] + 8)
29a7 : a9 0a __ LDA #$0a
29a9 : 20 10 3c JSR $3c10 ; (divmod + 53)
29ac : 18 __ __ CLC
29ad : a5 05 __ LDA WORK + 2 
29af : 69 30 __ ADC #$30
29b1 : 8d ef 7c STA $7cef ; (line[0] + 7)
29b4 : a9 0a __ LDA #$0a
29b6 : 20 10 3c JSR $3c10 ; (divmod + 53)
29b9 : 18 __ __ CLC
29ba : a5 05 __ LDA WORK + 2 
29bc : 69 30 __ ADC #$30
29be : 8d ee 7c STA $7cee ; (line[0] + 6)
29c1 : a9 e8 __ LDA #$e8
29c3 : 85 1b __ STA ACCU + 0 
29c5 : a9 7c __ LDA #$7c
29c7 : 85 1c __ STA ACCU + 1 
.s3:
29c9 : 60 __ __ RTS
--------------------------------------------------------------------
29ca : __ __ __ BYT 53 43 4f 52 45 20 00                            : SCORE .
--------------------------------------------------------------------
29d1 : __ __ __ BYT 42 45 53 54 20 20 00                            : BEST  .
--------------------------------------------------------------------
29d8 : __ __ __ BYT 50 41 55 53 45 44 00                            : PAUSED.
--------------------------------------------------------------------
29df : __ __ __ BYT 50 20 54 4f 20 43 4f 4e 54 49 4e 55 45 00       : P TO CONTINUE.
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/string.h"
.s4:
29ed : a5 0f __ LDA P2 
29ef : a6 12 __ LDX P5 
29f1 : f0 0c __ BEQ $29ff ; (memset.s4 + 18)
29f3 : a0 00 __ LDY #$00
29f5 : 91 0d __ STA (P0),y 
29f7 : c8 __ __ INY
29f8 : d0 fb __ BNE $29f5 ; (memset.s4 + 8)
29fa : e6 0e __ INC P1 
29fc : ca __ __ DEX
29fd : d0 f6 __ BNE $29f5 ; (memset.s4 + 8)
29ff : a4 11 __ LDY P4 
2a01 : f0 05 __ BEQ $2a08 ; (memset.s3 + 0)
2a03 : 88 __ __ DEY
2a04 : 91 0d __ STA (P0),y 
2a06 : d0 fb __ BNE $2a03 ; (memset.s4 + 22)
.s3:
2a08 : 60 __ __ RTS
--------------------------------------------------------------------
wait_frame: ; wait_frame()->void
; 161, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2a09 : ad 00 d6 LDA $d600 
2a0c : 29 20 __ AND #$20
2a0e : f0 21 __ BEQ $2a31 ; (wait_frame.l6 + 0)
.s5:
2a10 : 20 40 2a JSR $2a40 ; (stopwatch.l4 + 0)
2a13 : ad fc 3e LDA $3efc ; (show_time + 0)
2a16 : 38 __ __ SEC
2a17 : e5 1b __ SBC ACCU + 0 
2a19 : 85 1b __ STA ACCU + 0 
2a1b : ad fd 3e LDA $3efd ; (show_time + 1)
2a1e : e5 1c __ SBC ACCU + 1 
2a20 : 85 1c __ STA ACCU + 1 
2a22 : a9 27 __ LDA #$27
2a24 : c5 1c __ CMP ACCU + 1 
2a26 : f0 03 __ BEQ $2a2b ; (wait_frame.s8 + 0)
.s9:
2a28 : b0 07 __ BCS $2a31 ; (wait_frame.l6 + 0)
2a2a : 60 __ __ RTS
.s8:
2a2b : a5 1b __ LDA ACCU + 0 
2a2d : c9 11 __ CMP #$11
2a2f : b0 0e __ BCS $2a3f ; (wait_frame.s3 + 0)
.l6:
2a31 : ad 00 d6 LDA $d600 
2a34 : 29 20 __ AND #$20
2a36 : d0 f9 __ BNE $2a31 ; (wait_frame.l6 + 0)
.l7:
2a38 : ad 00 d6 LDA $d600 
2a3b : 29 20 __ AND #$20
2a3d : f0 f9 __ BEQ $2a38 ; (wait_frame.l7 + 0)
.s3:
2a3f : 60 __ __ RTS
--------------------------------------------------------------------
stopwatch: ; stopwatch()->u16
; 147, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.l4:
2a40 : ac 05 dd LDY $dd05 
2a43 : ad 04 dd LDA $dd04 
2a46 : cc 05 dd CPY $dd05 
2a49 : d0 f5 __ BNE $2a40 ; (stopwatch.l4 + 0)
.s3:
2a4b : 84 1c __ STY ACCU + 1 
2a4d : 85 1b __ STA ACCU + 0 
2a4f : 60 __ __ RTS
--------------------------------------------------------------------
show_frame: ; show_frame()->void
; 746, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
2a50 : a5 53 __ LDA T0 + 0 
2a52 : 8d f0 bf STA $bff0 ; (show_frame@stack + 0)
2a55 : a5 54 __ LDA T0 + 1 
2a57 : 8d f1 bf STA $bff1 ; (show_frame@stack + 1)
.s4:
2a5a : 20 40 2a JSR $2a40 ; (stopwatch.l4 + 0)
2a5d : a9 1c __ LDA #$1c
2a5f : 8d 00 d6 STA $d600 
2a62 : a5 1b __ LDA ACCU + 0 
2a64 : 8d fc 3e STA $3efc ; (show_time + 0)
2a67 : a5 1c __ LDA ACCU + 1 
2a69 : 8d fd 3e STA $3efd ; (show_time + 1)
2a6c : ad 1c 3f LDA $3f1c ; (saved_regs[0] + 28)
2a6f : 29 0f __ AND #$0f
2a71 : 09 10 __ ORA #$10
2a73 : 85 53 __ STA T0 + 0 
2a75 : ad f3 3c LDA $3cf3 ; (phase + 0)
2a78 : 18 __ __ CLC
2a79 : 69 01 __ ADC #$01
2a7b : 0a __ __ ASL
2a7c : 0a __ __ ASL
2a7d : 0a __ __ ASL
2a7e : 0a __ __ ASL
2a7f : 0a __ __ ASL
2a80 : 05 53 __ ORA T0 + 0 
.l5:
2a82 : 2c 00 d6 BIT $d600 
2a85 : 10 fb __ BPL $2a82 ; (show_frame.l5 + 0)
.s6:
2a87 : 8d 01 d6 STA $d601 
2a8a : ad fe 3e LDA $3efe ; (flash + 0)
2a8d : f0 18 __ BEQ $2aa7 ; (show_frame.s11 + 0)
.s7:
2a8f : a9 1a __ LDA #$1a
2a91 : 8d 00 d6 STA $d600 
2a94 : ce fe 3e DEC $3efe ; (flash + 0)
2a97 : f0 04 __ BEQ $2a9d ; (show_frame.s61 + 0)
.s8:
2a99 : a9 0f __ LDA #$0f
2a9b : d0 02 __ BNE $2a9f ; (show_frame.l9 + 0)
.s61:
2a9d : a9 06 __ LDA #$06
.l9:
2a9f : 2c 00 d6 BIT $d600 
2aa2 : 10 fb __ BPL $2a9f ; (show_frame.l9 + 0)
.s10:
2aa4 : 8d 01 d6 STA $d601 
.s11:
2aa7 : 20 b6 2c JSR $2cb6 ; (load_pose.s4 + 0)
2aaa : ad fe 3d LDA $3dfe ; (bird_set + 0)
2aad : 8d fd 3d STA $3dfd ; (shown_set + 0)
2ab0 : ad b9 3c LDA $3cb9 ; (bird_row + 0)
2ab3 : 8d ba 3c STA $3cba ; (shown_row + 0)
2ab6 : ad 00 d6 LDA $d600 
2ab9 : 29 20 __ AND #$20
2abb : d0 08 __ BNE $2ac5 ; (show_frame.s12 + 0)
.s60:
2abd : ee f7 7c INC $7cf7 ; (blank_overruns + 0)
2ac0 : d0 03 __ BNE $2ac5 ; (show_frame.s12 + 0)
.s72:
2ac2 : ee f8 7c INC $7cf8 ; (blank_overruns + 1)
.s12:
2ac5 : ee fe 3c INC $3cfe ; (frame_count + 0)
2ac8 : d0 03 __ BNE $2acd ; (show_frame.s63 + 0)
.s62:
2aca : ee ff 3c INC $3cff ; (frame_count + 1)
.s63:
2acd : ad ff 3e LDA $3eff ; (flip + 0)
2ad0 : d0 25 __ BNE $2af7 ; (show_frame.s13 + 0)
.s16:
2ad2 : ad fb 3c LDA $3cfb ; (front_count + 1)
2ad5 : 0d fa 3c ORA $3cfa ; (front_count + 0)
2ad8 : f0 18 __ BEQ $2af2 ; (show_frame.s20 + 0)
.s17:
2ada : a9 03 __ LDA #$03
2adc : 85 11 __ STA P4 
2ade : ad 47 6d LDA $6d47 ; (page + 0)
2ae1 : f0 08 __ BEQ $2aeb ; (show_frame.s59 + 0)
.s18:
2ae3 : a9 00 __ LDA #$00
2ae5 : 85 0f __ STA P2 
2ae7 : a9 10 __ LDA #$10
2ae9 : d0 02 __ BNE $2aed ; (show_frame.s19 + 0)
.s59:
2aeb : 85 0f __ STA P2 
.s19:
2aed : 85 10 __ STA P3 
2aef : 20 60 2d JSR $2d60 ; (write_cells.s4 + 0)
.s20:
2af2 : ad f6 3c LDA $3cf6 ; (redrawn + 0)
2af5 : d0 2e __ BNE $2b25 ; (show_frame.s21 + 0)
.s13:
2af7 : ae ec 3c LDX $3cec ; (state + 0)
2afa : ca __ __ DEX
2afb : d0 1d __ BNE $2b1a ; (show_frame.s3 + 0)
.s14:
2afd : ad f9 7c LDA $7cf9 ; (prerendered + 0)
2b00 : 4c 16 2b JMP $2b16 ; (show_frame.l74 + 0)
.s15:
2b03 : ad f9 7c LDA $7cf9 ; (prerendered + 0)
2b06 : 85 53 __ STA T0 + 0 
2b08 : 85 17 __ STA P10 
2b0a : e6 53 __ INC T0 + 0 
2b0c : a5 53 __ LDA T0 + 0 
2b0e : 8d f9 7c STA $7cf9 ; (prerendered + 0)
2b11 : 20 77 2f JSR $2f77 ; (prerender.s1 + 0)
2b14 : a5 53 __ LDA T0 + 0 
.l74:
2b16 : c9 04 __ CMP #$04
2b18 : 90 e9 __ BCC $2b03 ; (show_frame.s15 + 0)
.s3:
2b1a : ad f0 bf LDA $bff0 ; (show_frame@stack + 0)
2b1d : 85 53 __ STA T0 + 0 
2b1f : ad f1 bf LDA $bff1 ; (show_frame@stack + 1)
2b22 : 85 54 __ STA T0 + 1 
2b24 : 60 __ __ RTS
.s21:
2b25 : a9 ff __ LDA #$ff
2b27 : 8d f5 7c STA $7cf5 ; (copy_dst + 0)
2b2a : 8d f6 7c STA $7cf6 ; (copy_dst + 1)
2b2d : 8d f3 7c STA $7cf3 ; (copy_src + 0)
2b30 : 8d f4 7c STA $7cf4 ; (copy_src + 1)
2b33 : a9 00 __ LDA #$00
2b35 : 85 45 __ STA T2 + 0 
2b37 : 85 46 __ STA T2 + 1 
2b39 : a2 18 __ LDX #$18
2b3b : ad 47 6d LDA $6d47 ; (page + 0)
2b3e : f0 10 __ BEQ $2b50 ; (show_frame.s58 + 0)
.s22:
2b40 : 86 44 __ STX T1 + 1 
2b42 : a9 00 __ LDA #$00
2b44 : 85 53 __ STA T0 + 0 
2b46 : a9 10 __ LDA #$10
2b48 : 85 54 __ STA T0 + 1 
2b4a : a9 08 __ LDA #$08
2b4c : 85 48 __ STA T3 + 1 
2b4e : d0 0e __ BNE $2b5e ; (show_frame.s23 + 0)
.s58:
2b50 : 86 48 __ STX T3 + 1 
2b52 : 85 53 __ STA T0 + 0 
2b54 : 85 54 __ STA T0 + 1 
2b56 : a9 10 __ LDA #$10
2b58 : 85 46 __ STA T2 + 1 
2b5a : a9 08 __ LDA #$08
2b5c : 85 44 __ STA T1 + 1 
.s23:
2b5e : a2 00 __ LDX #$00
2b60 : 86 4a __ STX T4 + 1 
.l24:
2b62 : ad f6 7c LDA $7cf6 ; (copy_dst + 1)
2b65 : 45 46 __ EOR T2 + 1 
2b67 : f0 0f __ BEQ $2b78 ; (show_frame.s28 + 0)
.s25:
2b69 : a9 12 __ LDA #$12
2b6b : 8d 00 d6 STA $d600 
.l26:
2b6e : 2c 00 d6 BIT $d600 
2b71 : 10 fb __ BPL $2b6e ; (show_frame.l26 + 0)
.s27:
2b73 : a5 46 __ LDA T2 + 1 
2b75 : 8d 01 d6 STA $d601 
.s28:
2b78 : a9 13 __ LDA #$13
2b7a : 8d 00 d6 STA $d600 
.l29:
2b7d : 2c 00 d6 BIT $d600 
2b80 : 10 fb __ BPL $2b7d ; (show_frame.l29 + 0)
.s30:
2b82 : a5 45 __ LDA T2 + 0 
2b84 : 8d 01 d6 STA $d601 
2b87 : ad f4 7c LDA $7cf4 ; (copy_src + 1)
2b8a : 45 54 __ EOR T0 + 1 
2b8c : f0 0f __ BEQ $2b9d ; (show_frame.s34 + 0)
.s31:
2b8e : a9 20 __ LDA #$20
2b90 : 8d 00 d6 STA $d600 
.l32:
2b93 : 2c 00 d6 BIT $d600 
2b96 : 10 fb __ BPL $2b93 ; (show_frame.l32 + 0)
.s33:
2b98 : a5 54 __ LDA T0 + 1 
2b9a : 8d 01 d6 STA $d601 
.s34:
2b9d : a9 21 __ LDA #$21
2b9f : 8d 00 d6 STA $d600 
.l35:
2ba2 : 2c 00 d6 BIT $d600 
2ba5 : 10 fb __ BPL $2ba2 ; (show_frame.l35 + 0)
.s36:
2ba7 : a5 53 __ LDA T0 + 0 
2ba9 : 8d 01 d6 STA $d601 
2bac : a9 1e __ LDA #$1e
2bae : 8d 00 d6 STA $d600 
.l37:
2bb1 : 2c 00 d6 BIT $d600 
2bb4 : 10 fb __ BPL $2bb1 ; (show_frame.l37 + 0)
.s38:
2bb6 : a9 fa __ LDA #$fa
2bb8 : 8d 01 d6 STA $d601 
2bbb : 18 __ __ CLC
2bbc : a5 44 __ LDA T1 + 1 
2bbe : 65 4a __ ADC T4 + 1 
2bc0 : a8 __ __ TAY
2bc1 : 18 __ __ CLC
2bc2 : a5 53 __ LDA T0 + 0 
2bc4 : 69 fa __ ADC #$fa
2bc6 : 85 53 __ STA T0 + 0 
2bc8 : 90 03 __ BCC $2bcd ; (show_frame.s65 + 0)
.s64:
2bca : e6 54 __ INC T0 + 1 
2bcc : 18 __ __ CLC
.s65:
2bcd : a5 48 __ LDA T3 + 1 
2bcf : 65 4a __ ADC T4 + 1 
2bd1 : 85 4e __ STA T6 + 1 
2bd3 : 18 __ __ CLC
2bd4 : a5 45 __ LDA T2 + 0 
2bd6 : 69 fa __ ADC #$fa
2bd8 : 85 45 __ STA T2 + 0 
2bda : a5 46 __ LDA T2 + 1 
2bdc : 69 00 __ ADC #$00
2bde : 85 46 __ STA T2 + 1 
2be0 : 45 4e __ EOR T6 + 1 
2be2 : f0 0f __ BEQ $2bf3 ; (show_frame.s42 + 0)
.s39:
2be4 : a9 12 __ LDA #$12
2be6 : 8d 00 d6 STA $d600 
.l40:
2be9 : 2c 00 d6 BIT $d600 
2bec : 10 fb __ BPL $2be9 ; (show_frame.l40 + 0)
.s41:
2bee : a5 4e __ LDA T6 + 1 
2bf0 : 8d 01 d6 STA $d601 
.s42:
2bf3 : a9 13 __ LDA #$13
2bf5 : 8d 00 d6 STA $d600 
.l43:
2bf8 : 2c 00 d6 BIT $d600 
2bfb : 10 fb __ BPL $2bf8 ; (show_frame.l43 + 0)
.s44:
2bfd : 8e 01 d6 STX $d601 
2c00 : 98 __ __ TYA
2c01 : 45 54 __ EOR T0 + 1 
2c03 : f0 0d __ BEQ $2c12 ; (show_frame.s48 + 0)
.s45:
2c05 : a9 20 __ LDA #$20
2c07 : 8d 00 d6 STA $d600 
.l46:
2c0a : 2c 00 d6 BIT $d600 
2c0d : 10 fb __ BPL $2c0a ; (show_frame.l46 + 0)
.s47:
2c0f : 8c 01 d6 STY $d601 
.s48:
2c12 : a9 21 __ LDA #$21
2c14 : 8d 00 d6 STA $d600 
.l49:
2c17 : 2c 00 d6 BIT $d600 
2c1a : 10 fb __ BPL $2c17 ; (show_frame.l49 + 0)
.s50:
2c1c : 8e 01 d6 STX $d601 
2c1f : a9 1e __ LDA #$1e
2c21 : 8d 00 d6 STA $d600 
.l51:
2c24 : 2c 00 d6 BIT $d600 
2c27 : 10 fb __ BPL $2c24 ; (show_frame.l51 + 0)
.s52:
2c29 : a9 fa __ LDA #$fa
2c2b : 8d 01 d6 STA $d601 
2c2e : 8a __ __ TXA
2c2f : 18 __ __ CLC
2c30 : 69 fa __ ADC #$fa
2c32 : 8d f5 7c STA $7cf5 ; (copy_dst + 0)
2c35 : a5 4e __ LDA T6 + 1 
2c37 : 69 00 __ ADC #$00
2c39 : 8d f6 7c STA $7cf6 ; (copy_dst + 1)
2c3c : 8a __ __ TXA
2c3d : 18 __ __ CLC
2c3e : 69 fa __ ADC #$fa
2c40 : 8d f3 7c STA $7cf3 ; (copy_src + 0)
2c43 : 90 02 __ BCC $2c47 ; (show_frame.s67 + 0)
.s66:
2c45 : c8 __ __ INY
2c46 : 18 __ __ CLC
.s67:
2c47 : 8c f4 7c STY $7cf4 ; (copy_src + 1)
2c4a : 8a __ __ TXA
2c4b : 69 fa __ ADC #$fa
2c4d : aa __ __ TAX
2c4e : a5 4a __ LDA T4 + 1 
2c50 : 69 00 __ ADC #$00
2c52 : 85 4a __ STA T4 + 1 
2c54 : c9 06 __ CMP #$06
2c56 : b0 03 __ BCS $2c5b ; (show_frame.s73 + 0)
2c58 : 4c 62 2b JMP $2b62 ; (show_frame.l24 + 0)
.s73:
2c5b : d0 04 __ BNE $2c61 ; (show_frame.s53 + 0)
.s57:
2c5d : e0 d7 __ CPX #$d7
2c5f : 90 f7 __ BCC $2c58 ; (show_frame.s67 + 17)
.s53:
2c61 : a9 00 __ LDA #$00
2c63 : 8d f9 7c STA $7cf9 ; (prerendered + 0)
2c66 : ad f8 3c LDA $3cf8 ; (dirty_count + 0)
2c69 : 85 53 __ STA T0 + 0 
2c6b : 0d f9 3c ORA $3cf9 ; (dirty_count + 1)
2c6e : f0 3a __ BEQ $2caa ; (show_frame.s56 + 0)
.s54:
2c70 : a9 48 __ LDA #$48
2c72 : 85 43 __ STA T1 + 0 
2c74 : a9 6d __ LDA #$6d
2c76 : 85 44 __ STA T1 + 1 
2c78 : ae f9 3c LDX $3cf9 ; (dirty_count + 1)
.l55:
2c7b : a0 00 __ LDY #$00
2c7d : b1 43 __ LDA (T1 + 0),y 
2c7f : 18 __ __ CLC
2c80 : 69 77 __ ADC #$77
2c82 : 85 45 __ STA T2 + 0 
2c84 : a9 65 __ LDA #$65
2c86 : c8 __ __ INY
2c87 : 71 43 __ ADC (T1 + 0),y 
2c89 : 85 46 __ STA T2 + 1 
2c8b : a9 00 __ LDA #$00
2c8d : a8 __ __ TAY
2c8e : 91 45 __ STA (T2 + 0),y 
2c90 : 18 __ __ CLC
2c91 : a5 43 __ LDA T1 + 0 
2c93 : 69 02 __ ADC #$02
2c95 : 85 43 __ STA T1 + 0 
2c97 : 90 02 __ BCC $2c9b ; (show_frame.s69 + 0)
.s68:
2c99 : e6 44 __ INC T1 + 1 
.s69:
2c9b : 38 __ __ SEC
2c9c : a5 53 __ LDA T0 + 0 
2c9e : e9 01 __ SBC #$01
2ca0 : 85 53 __ STA T0 + 0 
2ca2 : b0 01 __ BCS $2ca5 ; (show_frame.s71 + 0)
.s70:
2ca4 : ca __ __ DEX
.s71:
2ca5 : 8a __ __ TXA
2ca6 : 05 53 __ ORA T0 + 0 
2ca8 : d0 d1 __ BNE $2c7b ; (show_frame.l55 + 0)
.s56:
2caa : 8d f6 3c STA $3cf6 ; (redrawn + 0)
2cad : 8d f8 3c STA $3cf8 ; (dirty_count + 0)
2cb0 : 8d f9 3c STA $3cf9 ; (dirty_count + 1)
2cb3 : 4c f7 2a JMP $2af7 ; (show_frame.s13 + 0)
--------------------------------------------------------------------
load_pose: ; load_pose()->void
; 387, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2cb6 : ad fe 3d LDA $3dfe ; (bird_set + 0)
2cb9 : 0a __ __ ASL
2cba : 0a __ __ ASL
2cbb : 6d f3 3c ADC $3cf3 ; (phase + 0)
2cbe : aa __ __ TAX
2cbf : ad fc 3d LDA $3dfc ; (bird_pose + 0)
2cc2 : dd e4 3c CMP $3ce4,x ; (set_pose[0][0] + 0)
2cc5 : d0 01 __ BNE $2cc8 ; (load_pose.s5 + 0)
2cc7 : 60 __ __ RTS
.s5:
2cc8 : 9d e4 3c STA $3ce4,x ; (set_pose[0][0] + 0)
2ccb : a9 12 __ LDA #$12
2ccd : 8d 00 d6 STA $d600 
2cd0 : ad fc 3d LDA $3dfc ; (bird_pose + 0)
2cd3 : 85 1b __ STA ACCU + 0 
2cd5 : a9 00 __ LDA #$00
2cd7 : 85 1c __ STA ACCU + 1 
2cd9 : a9 f0 __ LDA #$f0
2cdb : 20 a3 3b JSR $3ba3 ; (mul16by8 + 0)
2cde : 18 __ __ CLC
2cdf : a5 1c __ LDA ACCU + 1 
2ce1 : 69 90 __ ADC #$90
2ce3 : aa __ __ TAX
2ce4 : 38 __ __ SEC
2ce5 : a9 00 __ LDA #$00
2ce7 : ed fe 3d SBC $3dfe ; (bird_set + 0)
2cea : 29 f0 __ AND #$f0
2cec : ac f3 3c LDY $3cf3 ; (phase + 0)
2cef : 19 75 3c ORA $3c75,y ; (__multab8192L + 0)
2cf2 : 85 1d __ STA ACCU + 2 
2cf4 : b9 7a 3c LDA $3c7a,y ; (__multab8192H + 0)
2cf7 : 18 __ __ CLC
2cf8 : 69 26 __ ADC #$26
.l6:
2cfa : 2c 00 d6 BIT $d600 
2cfd : 10 fb __ BPL $2cfa ; (load_pose.l6 + 0)
.s7:
2cff : 8d 01 d6 STA $d601 
2d02 : a0 13 __ LDY #$13
2d04 : 8c 00 d6 STY $d600 
.l8:
2d07 : 2c 00 d6 BIT $d600 
2d0a : 10 fb __ BPL $2d07 ; (load_pose.l8 + 0)
.s9:
2d0c : a8 __ __ TAY
2d0d : a5 1d __ LDA ACCU + 2 
2d0f : 8d 01 d6 STA $d601 
2d12 : 8a __ __ TXA
2d13 : 49 ff __ EOR #$ff
2d15 : f0 0d __ BEQ $2d24 ; (load_pose.s13 + 0)
.s10:
2d17 : a9 20 __ LDA #$20
2d19 : 8d 00 d6 STA $d600 
.l11:
2d1c : 2c 00 d6 BIT $d600 
2d1f : 10 fb __ BPL $2d1c ; (load_pose.l11 + 0)
.s12:
2d21 : 8e 01 d6 STX $d601 
.s13:
2d24 : a9 21 __ LDA #$21
2d26 : 8d 00 d6 STA $d600 
.l14:
2d29 : 2c 00 d6 BIT $d600 
2d2c : 10 fb __ BPL $2d29 ; (load_pose.l14 + 0)
.s15:
2d2e : a5 1b __ LDA ACCU + 0 
2d30 : 8d 01 d6 STA $d601 
2d33 : a9 1e __ LDA #$1e
2d35 : 8d 00 d6 STA $d600 
.l16:
2d38 : 2c 00 d6 BIT $d600 
2d3b : 10 fb __ BPL $2d38 ; (load_pose.l16 + 0)
.s17:
2d3d : a9 f0 __ LDA #$f0
2d3f : 8d 01 d6 STA $d601 
2d42 : 18 __ __ CLC
2d43 : a5 1d __ LDA ACCU + 2 
2d45 : 69 f0 __ ADC #$f0
2d47 : 8d f5 7c STA $7cf5 ; (copy_dst + 0)
2d4a : 90 02 __ BCC $2d4e ; (load_pose.s19 + 0)
.s18:
2d4c : c8 __ __ INY
2d4d : 18 __ __ CLC
.s19:
2d4e : 8c f6 7c STY $7cf6 ; (copy_dst + 1)
2d51 : a5 1b __ LDA ACCU + 0 
2d53 : 69 f0 __ ADC #$f0
2d55 : 8d f3 7c STA $7cf3 ; (copy_src + 0)
2d58 : a5 1c __ LDA ACCU + 1 
2d5a : 69 90 __ ADC #$90
2d5c : 8d f4 7c STA $7cf4 ; (copy_src + 1)
.s3:
2d5f : 60 __ __ RTS
--------------------------------------------------------------------
write_cells: ; write_cells(u16,u8)->void
; 663, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2d60 : ad f8 3c LDA $3cf8 ; (dirty_count + 0)
2d63 : 0a __ __ ASL
2d64 : aa __ __ TAX
2d65 : ad f9 3c LDA $3cf9 ; (dirty_count + 1)
2d68 : 2a __ __ ROL
2d69 : 85 1c __ STA ACCU + 1 
2d6b : 8a __ __ TXA
2d6c : 18 __ __ CLC
2d6d : 69 48 __ ADC #$48
2d6f : 85 45 __ STA T2 + 0 
2d71 : a9 6d __ LDA #$6d
2d73 : 65 1c __ ADC ACCU + 1 
2d75 : 85 46 __ STA T2 + 1 
2d77 : a5 11 __ LDA P4 ; (bits + 0)
2d79 : 85 47 __ STA T3 + 0 
2d7b : a9 48 __ LDA #$48
2d7d : 85 48 __ STA T4 + 0 
2d7f : a9 6d __ LDA #$6d
2d81 : 85 49 __ STA T4 + 1 
2d83 : 8a __ __ TXA
2d84 : 05 1c __ ORA ACCU + 1 
2d86 : f0 48 __ BEQ $2dd0 ; (write_cells.s17 + 0)
.s5:
2d88 : a5 11 __ LDA P4 ; (bits + 0)
2d8a : 29 05 __ AND #$05
2d8c : 85 4a __ STA T5 + 0 
2d8e : a9 ff __ LDA #$ff
2d90 : 85 1b __ STA ACCU + 0 
2d92 : 85 1c __ STA ACCU + 1 
2d94 : a9 48 __ LDA #$48
2d96 : 85 4b __ STA T6 + 0 
2d98 : a9 6d __ LDA #$6d
2d9a : 85 4c __ STA T6 + 1 
.l6:
2d9c : a0 00 __ LDY #$00
2d9e : b1 4b __ LDA (T6 + 0),y 
2da0 : 85 4d __ STA T7 + 0 
2da2 : a9 77 __ LDA #$77
2da4 : 85 43 __ STA T1 + 0 
2da6 : 18 __ __ CLC
2da7 : c8 __ __ INY
2da8 : b1 4b __ LDA (T6 + 0),y 
2daa : 85 4e __ STA T7 + 1 
2dac : 69 65 __ ADC #$65
2dae : 85 44 __ STA T1 + 1 
2db0 : a4 4d __ LDY T7 + 0 
2db2 : b1 43 __ LDA (T1 + 0),y 
2db4 : 25 4a __ AND T5 + 0 
2db6 : f0 03 __ BEQ $2dbb ; (write_cells.s16 + 0)
2db8 : 4c f4 2e JMP $2ef4 ; (write_cells.s7 + 0)
.s16:
2dbb : 18 __ __ CLC
2dbc : a5 4b __ LDA T6 + 0 
2dbe : 69 02 __ ADC #$02
2dc0 : 85 4b __ STA T6 + 0 
2dc2 : 90 02 __ BCC $2dc6 ; (write_cells.s58 + 0)
.s57:
2dc4 : e6 4c __ INC T6 + 1 
.s58:
2dc6 : c5 45 __ CMP T2 + 0 
2dc8 : d0 d2 __ BNE $2d9c ; (write_cells.l6 + 0)
.s46:
2dca : a5 4c __ LDA T6 + 1 
2dcc : c5 46 __ CMP T2 + 1 
2dce : d0 cc __ BNE $2d9c ; (write_cells.l6 + 0)
.s17:
2dd0 : a5 45 __ LDA T2 + 0 
2dd2 : c9 48 __ CMP #$48
2dd4 : d0 06 __ BNE $2ddc ; (write_cells.s18 + 0)
.s45:
2dd6 : a5 46 __ LDA T2 + 1 
2dd8 : c9 6d __ CMP #$6d
2dda : f0 78 __ BEQ $2e54 ; (write_cells.s34 + 0)
.s18:
2ddc : a5 47 __ LDA T3 + 0 
2dde : 29 0a __ AND #$0a
2de0 : 85 47 __ STA T3 + 0 
2de2 : 18 __ __ CLC
2de3 : a5 10 __ LDA P3 ; (base + 1)
2de5 : 69 08 __ ADC #$08
2de7 : 85 10 __ STA P3 ; (base + 1)
2de9 : a9 ff __ LDA #$ff
2deb : 85 1b __ STA ACCU + 0 
2ded : 85 1c __ STA ACCU + 1 
2def : a9 48 __ LDA #$48
2df1 : 85 4b __ STA T6 + 0 
2df3 : a9 6d __ LDA #$6d
2df5 : 85 4c __ STA T6 + 1 
2df7 : a9 77 __ LDA #$77
2df9 : 85 4f __ STA T8 + 0 
.l19:
2dfb : a0 00 __ LDY #$00
2dfd : b1 4b __ LDA (T6 + 0),y 
2dff : 85 4d __ STA T7 + 0 
2e01 : 18 __ __ CLC
2e02 : c8 __ __ INY
2e03 : b1 4b __ LDA (T6 + 0),y 
2e05 : 85 4e __ STA T7 + 1 
2e07 : 69 65 __ ADC #$65
2e09 : 85 50 __ STA T8 + 1 
2e0b : a4 4d __ LDY T7 + 0 
2e0d : b1 4f __ LDA (T8 + 0),y 
2e0f : 85 51 __ STA T11 + 0 
2e11 : 25 47 __ AND T3 + 0 
2e13 : d0 5c __ BNE $2e71 ; (write_cells.s20 + 0)
.s29:
2e15 : a5 51 __ LDA T11 + 0 
2e17 : a6 11 __ LDX P4 ; (bits + 0)
2e19 : e0 0c __ CPX #$0c
2e1b : f0 05 __ BEQ $2e22 ; (write_cells.s30 + 0)
.s36:
2e1d : 29 0c __ AND #$0c
2e1f : 4c 26 2e JMP $2e26 ; (write_cells.s31 + 0)
.s30:
2e22 : 29 03 __ AND #$03
2e24 : 0a __ __ ASL
2e25 : 0a __ __ ASL
.s31:
2e26 : 91 4f __ STA (T8 + 0),y 
2e28 : f0 15 __ BEQ $2e3f ; (write_cells.s33 + 0)
.s32:
2e2a : 98 __ __ TYA
2e2b : a0 00 __ LDY #$00
2e2d : 91 48 __ STA (T4 + 0),y 
2e2f : a5 4e __ LDA T7 + 1 
2e31 : c8 __ __ INY
2e32 : 91 48 __ STA (T4 + 0),y 
2e34 : 18 __ __ CLC
2e35 : a5 48 __ LDA T4 + 0 
2e37 : 69 02 __ ADC #$02
2e39 : 85 48 __ STA T4 + 0 
2e3b : 90 02 __ BCC $2e3f ; (write_cells.s33 + 0)
.s59:
2e3d : e6 49 __ INC T4 + 1 
.s33:
2e3f : 18 __ __ CLC
2e40 : a5 4b __ LDA T6 + 0 
2e42 : 69 02 __ ADC #$02
2e44 : 85 4b __ STA T6 + 0 
2e46 : 90 02 __ BCC $2e4a ; (write_cells.s61 + 0)
.s60:
2e48 : e6 4c __ INC T6 + 1 
.s61:
2e4a : c5 45 __ CMP T2 + 0 
2e4c : d0 ad __ BNE $2dfb ; (write_cells.l19 + 0)
.s35:
2e4e : a5 4c __ LDA T6 + 1 
2e50 : c5 46 __ CMP T2 + 1 
2e52 : d0 a7 __ BNE $2dfb ; (write_cells.l19 + 0)
.s34:
2e54 : a9 00 __ LDA #$00
2e56 : 8d fa 3c STA $3cfa ; (front_count + 0)
2e59 : 8d fb 3c STA $3cfb ; (front_count + 1)
2e5c : a5 48 __ LDA T4 + 0 
2e5e : e9 48 __ SBC #$48
2e60 : aa __ __ TAX
2e61 : a5 49 __ LDA T4 + 1 
2e63 : e9 6d __ SBC #$6d
2e65 : c9 80 __ CMP #$80
2e67 : 6a __ __ ROR
2e68 : 8d f9 3c STA $3cf9 ; (dirty_count + 1)
2e6b : 8a __ __ TXA
2e6c : 6a __ __ ROR
2e6d : 8d f8 3c STA $3cf8 ; (dirty_count + 0)
.s3:
2e70 : 60 __ __ RTS
.s20:
2e71 : a5 1c __ LDA ACCU + 1 
2e73 : c5 4e __ CMP T7 + 1 
2e75 : d0 04 __ BNE $2e7b ; (write_cells.s44 + 0)
.s43:
2e77 : a5 1b __ LDA ACCU + 0 
2e79 : c5 4d __ CMP T7 + 0 
.s44:
2e7b : b0 5c __ BCS $2ed9 ; (write_cells.s39 + 0)
.s21:
2e7d : 98 __ __ TYA
2e7e : 38 __ __ SEC
2e7f : e5 1b __ SBC ACCU + 0 
2e81 : aa __ __ TAX
2e82 : a5 4e __ LDA T7 + 1 
2e84 : e5 1c __ SBC ACCU + 1 
2e86 : d0 51 __ BNE $2ed9 ; (write_cells.s39 + 0)
.s42:
2e88 : e0 03 __ CPX #$03
2e8a : b0 4d __ BCS $2ed9 ; (write_cells.s39 + 0)
.s55:
2e8c : a9 a7 __ LDA #$a7
2e8e : 85 43 __ STA T1 + 0 
2e90 : a4 1b __ LDY ACCU + 0 
2e92 : 90 03 __ BCC $2e97 ; (write_cells.l22 + 0)
.s25:
2e94 : 8d 01 d6 STA $d601 
.l22:
2e97 : a5 1c __ LDA ACCU + 1 
2e99 : c5 4e __ CMP T7 + 1 
2e9b : d0 02 __ BNE $2e9f ; (write_cells.s38 + 0)
.s37:
2e9d : c4 4d __ CPY T7 + 0 
.s38:
2e9f : 90 26 __ BCC $2ec7 ; (write_cells.s23 + 0)
.s65:
2ea1 : a4 4d __ LDY T7 + 0 
.s26:
2ea3 : a9 a7 __ LDA #$a7
2ea5 : 85 1b __ STA ACCU + 0 
2ea7 : 18 __ __ CLC
2ea8 : a9 5d __ LDA #$5d
2eaa : 65 4e __ ADC T7 + 1 
2eac : 85 1c __ STA ACCU + 1 
2eae : b1 1b __ LDA (ACCU + 0),y 
.l27:
2eb0 : 2c 00 d6 BIT $d600 
2eb3 : 10 fb __ BPL $2eb0 ; (write_cells.l27 + 0)
.s28:
2eb5 : 8d 01 d6 STA $d601 
2eb8 : 98 __ __ TYA
2eb9 : 18 __ __ CLC
2eba : 69 01 __ ADC #$01
2ebc : 85 1b __ STA ACCU + 0 
2ebe : a5 4e __ LDA T7 + 1 
2ec0 : 69 00 __ ADC #$00
2ec2 : 85 1c __ STA ACCU + 1 
2ec4 : 4c 15 2e JMP $2e15 ; (write_cells.s29 + 0)
.s23:
2ec7 : 69 5d __ ADC #$5d
2ec9 : 85 44 __ STA T1 + 1 
2ecb : b1 43 __ LDA (T1 + 0),y 
2ecd : c8 __ __ INY
2ece : d0 02 __ BNE $2ed2 ; (write_cells.l24 + 0)
.s62:
2ed0 : e6 1c __ INC ACCU + 1 
.l24:
2ed2 : 2c 00 d6 BIT $d600 
2ed5 : 10 fb __ BPL $2ed2 ; (write_cells.l24 + 0)
2ed7 : 30 bb __ BMI $2e94 ; (write_cells.s25 + 0)
.s39:
2ed9 : a5 4e __ LDA T7 + 1 
2edb : c5 1c __ CMP ACCU + 1 
2edd : d0 04 __ BNE $2ee3 ; (write_cells.s40 + 0)
.s41:
2edf : c4 1b __ CPY ACCU + 0 
2ee1 : f0 c0 __ BEQ $2ea3 ; (write_cells.s26 + 0)
.s40:
2ee3 : 98 __ __ TYA
2ee4 : 18 __ __ CLC
2ee5 : 65 0f __ ADC P2 ; (base + 0)
2ee7 : a8 __ __ TAY
2ee8 : a5 10 __ LDA P3 ; (base + 1)
2eea : 65 4e __ ADC T7 + 1 
2eec : aa __ __ TAX
2eed : 98 __ __ TYA
2eee : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
2ef1 : 4c a1 2e JMP $2ea1 ; (write_cells.s65 + 0)
.s7:
2ef4 : a5 1c __ LDA ACCU + 1 
2ef6 : c5 4e __ CMP T7 + 1 
2ef8 : d0 04 __ BNE $2efe ; (write_cells.s54 + 0)
.s53:
2efa : a5 1b __ LDA ACCU + 0 
2efc : c5 4d __ CMP T7 + 0 
.s54:
2efe : b0 5c __ BCS $2f5c ; (write_cells.s49 + 0)
.s8:
2f00 : 98 __ __ TYA
2f01 : 38 __ __ SEC
2f02 : e5 1b __ SBC ACCU + 0 
2f04 : aa __ __ TAX
2f05 : a5 4e __ LDA T7 + 1 
2f07 : e5 1c __ SBC ACCU + 1 
2f09 : d0 51 __ BNE $2f5c ; (write_cells.s49 + 0)
.s52:
2f0b : e0 03 __ CPX #$03
2f0d : b0 4d __ BCS $2f5c ; (write_cells.s49 + 0)
.s56:
2f0f : a9 d7 __ LDA #$d7
2f11 : 85 43 __ STA T1 + 0 
2f13 : a4 1b __ LDY ACCU + 0 
2f15 : 90 03 __ BCC $2f1a ; (write_cells.l9 + 0)
.s12:
2f17 : 8d 01 d6 STA $d601 
.l9:
2f1a : a5 1c __ LDA ACCU + 1 
2f1c : c5 4e __ CMP T7 + 1 
2f1e : d0 02 __ BNE $2f22 ; (write_cells.s48 + 0)
.s47:
2f20 : c4 4d __ CPY T7 + 0 
.s48:
2f22 : 90 26 __ BCC $2f4a ; (write_cells.s10 + 0)
.s64:
2f24 : a4 4d __ LDY T7 + 0 
.s13:
2f26 : a9 d7 __ LDA #$d7
2f28 : 85 1b __ STA ACCU + 0 
2f2a : 18 __ __ CLC
2f2b : a9 55 __ LDA #$55
2f2d : 65 4e __ ADC T7 + 1 
2f2f : 85 1c __ STA ACCU + 1 
2f31 : b1 1b __ LDA (ACCU + 0),y 
.l14:
2f33 : 2c 00 d6 BIT $d600 
2f36 : 10 fb __ BPL $2f33 ; (write_cells.l14 + 0)
.s15:
2f38 : 8d 01 d6 STA $d601 
2f3b : 98 __ __ TYA
2f3c : 18 __ __ CLC
2f3d : 69 01 __ ADC #$01
2f3f : 85 1b __ STA ACCU + 0 
2f41 : a5 4e __ LDA T7 + 1 
2f43 : 69 00 __ ADC #$00
2f45 : 85 1c __ STA ACCU + 1 
2f47 : 4c bb 2d JMP $2dbb ; (write_cells.s16 + 0)
.s10:
2f4a : 69 55 __ ADC #$55
2f4c : 85 44 __ STA T1 + 1 
2f4e : b1 43 __ LDA (T1 + 0),y 
2f50 : c8 __ __ INY
2f51 : d0 02 __ BNE $2f55 ; (write_cells.l11 + 0)
.s63:
2f53 : e6 1c __ INC ACCU + 1 
.l11:
2f55 : 2c 00 d6 BIT $d600 
2f58 : 10 fb __ BPL $2f55 ; (write_cells.l11 + 0)
2f5a : 30 bb __ BMI $2f17 ; (write_cells.s12 + 0)
.s49:
2f5c : a5 4e __ LDA T7 + 1 
2f5e : c5 1c __ CMP ACCU + 1 
2f60 : d0 04 __ BNE $2f66 ; (write_cells.s50 + 0)
.s51:
2f62 : c4 1b __ CPY ACCU + 0 
2f64 : f0 c0 __ BEQ $2f26 ; (write_cells.s13 + 0)
.s50:
2f66 : 98 __ __ TYA
2f67 : 18 __ __ CLC
2f68 : 65 0f __ ADC P2 ; (base + 0)
2f6a : a8 __ __ TAY
2f6b : a5 10 __ LDA P3 ; (base + 1)
2f6d : 65 4e __ ADC T7 + 1 
2f6f : aa __ __ TAX
2f70 : 98 __ __ TYA
2f71 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
2f74 : 4c 24 2f JMP $2f24 ; (write_cells.s64 + 0)
--------------------------------------------------------------------
prerender: ; prerender(u8)->void
; 402, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
2f77 : a2 06 __ LDX #$06
2f79 : b5 53 __ LDA T11 + 0,x 
2f7b : 9d f2 bf STA $bff2,x ; (prerender@stack + 0)
2f7e : ca __ __ DEX
2f7f : 10 f8 __ BPL $2f79 ; (prerender.s1 + 2)
.s4:
2f81 : a5 17 __ LDA P10 ; (i + 0)
2f83 : 0a __ __ ASL
2f84 : 0a __ __ ASL
2f85 : a8 __ __ TAY
2f86 : b9 ec 3e LDA $3eec,y ; (pipes[0].x + 0)
2f89 : e9 01 __ SBC #$01
2f8b : 85 47 __ STA T2 + 0 
2f8d : b9 ed 3e LDA $3eed,y ; (pipes[0].x + 1)
2f90 : e9 00 __ SBC #$00
2f92 : 85 48 __ STA T2 + 1 
2f94 : 30 0b __ BMI $2fa1 ; (prerender.s5 + 0)
.s39:
2f96 : f0 03 __ BEQ $2f9b ; (prerender.s38 + 0)
2f98 : 4c 92 31 JMP $3192 ; (prerender.s3 + 0)
.s38:
2f9b : a5 47 __ LDA T2 + 0 
2f9d : c9 50 __ CMP #$50
2f9f : b0 f7 __ BCS $2f98 ; (prerender.s39 + 2)
.s5:
2fa1 : b9 ed 3e LDA $3eed,y ; (pipes[0].x + 1)
2fa4 : 49 80 __ EOR #$80
2fa6 : c9 7f __ CMP #$7f
2fa8 : d0 05 __ BNE $2faf ; (prerender.s37 + 0)
.s36:
2faa : b9 ec 3e LDA $3eec,y ; (pipes[0].x + 0)
2fad : c9 f8 __ CMP #$f8
.s37:
2faf : 90 e7 __ BCC $2f98 ; (prerender.s39 + 2)
.s6:
2fb1 : a9 ff __ LDA #$ff
2fb3 : 8d f5 7c STA $7cf5 ; (copy_dst + 0)
2fb6 : 8d f6 7c STA $7cf6 ; (copy_dst + 1)
2fb9 : a2 10 __ LDX #$10
2fbb : ad 47 6d LDA $6d47 ; (page + 0)
2fbe : f0 08 __ BEQ $2fc8 ; (prerender.s35 + 0)
.s7:
2fc0 : 86 4a __ STX T3 + 1 
2fc2 : a9 00 __ LDA #$00
2fc4 : 85 4c __ STA T4 + 1 
2fc6 : b0 04 __ BCS $2fcc ; (prerender.s8 + 0)
.s35:
2fc8 : 86 4c __ STX T4 + 1 
2fca : 85 4a __ STA T3 + 1 
.s8:
2fcc : b9 ee 3e LDA $3eee,y ; (pipes[0].gap + 0)
2fcf : 85 57 __ STA T13 + 0 
2fd1 : 24 48 __ BIT T2 + 1 
2fd3 : 10 03 __ BPL $2fd8 ; (prerender.s32 + 0)
2fd5 : 4c 9d 31 JMP $319d ; (prerender.s9 + 0)
.s32:
2fd8 : a5 47 __ LDA T2 + 0 
2fda : 85 4d __ STA T5 + 0 
2fdc : 18 __ __ CLC
2fdd : 69 0b __ ADC #$0b
2fdf : aa __ __ TAX
2fe0 : a9 00 __ LDA #$00
2fe2 : 85 43 __ STA T0 + 0 
2fe4 : a5 48 __ LDA T2 + 1 
2fe6 : 69 00 __ ADC #$00
2fe8 : d0 08 __ BNE $2ff2 ; (prerender.s10 + 0)
.s34:
2fea : e0 51 __ CPX #$51
2fec : b0 04 __ BCS $2ff2 ; (prerender.s10 + 0)
.s33:
2fee : a9 0b __ LDA #$0b
2ff0 : 90 05 __ BCC $2ff7 ; (prerender.s11 + 0)
.s10:
2ff2 : 38 __ __ SEC
2ff3 : a9 50 __ LDA #$50
2ff5 : e5 4d __ SBC T5 + 0 
.s11:
2ff7 : a2 ff __ LDX #$ff
2ff9 : 8e f3 7c STX $7cf3 ; (copy_src + 0)
2ffc : 8e f4 7c STX $7cf4 ; (copy_src + 1)
2fff : a8 __ __ TAY
3000 : 18 __ __ CLC
3001 : 65 4d __ ADC T5 + 0 
3003 : 85 4e __ STA T6 + 0 
3005 : c9 50 __ CMP #$50
3007 : d0 04 __ BNE $300d ; (prerender.s13 + 0)
.s12:
3009 : a9 01 __ LDA #$01
300b : d0 02 __ BNE $300f ; (prerender.s14 + 0)
.s13:
300d : a9 00 __ LDA #$00
.s14:
300f : 85 15 __ STA P8 
3011 : a5 4d __ LDA T5 + 0 
3013 : 85 0f __ STA P2 
3015 : 18 __ __ CLC
3016 : 69 01 __ ADC #$01
3018 : 85 11 __ STA P4 
301a : a5 4c __ LDA T4 + 1 
301c : 85 10 __ STA P3 
301e : a5 4a __ LDA T3 + 1 
3020 : 69 00 __ ADC #$00
3022 : 85 12 __ STA P5 
3024 : a6 57 __ LDX T13 + 0 
3026 : ca __ __ DEX
3027 : 86 4f __ STX T8 + 0 
3029 : 86 13 __ STX P6 
302b : 98 __ __ TYA
302c : 38 __ __ SEC
302d : e5 15 __ SBC P8 
302f : 85 14 __ STA P7 
3031 : a5 15 __ LDA P8 
3033 : f0 08 __ BEQ $303d ; (prerender.s31 + 0)
.s15:
3035 : 38 __ __ SEC
3036 : a9 4f __ LDA #$4f
3038 : e5 0f __ SBC P2 
303a : 18 __ __ CLC
303b : 65 43 __ ADC T0 + 0 
.s31:
303d : 85 45 __ STA T1 + 0 
303f : aa __ __ TAX
3040 : bd c0 3c LDA $3cc0,x ; (pipe_tiles[0][0] + 0)
3043 : 85 58 __ STA T15 + 0 
3045 : 85 16 __ STA P9 
3047 : 20 b5 31 JSR $31b5 ; (copy_rows.s4 + 0)
304a : 18 __ __ CLC
304b : a5 57 __ LDA T13 + 0 
304d : 69 07 __ ADC #$07
304f : 85 51 __ STA T10 + 0 
3051 : a9 00 __ LDA #$00
3053 : a4 4f __ LDY T8 + 0 
3055 : 6a __ __ ROR
3056 : 85 52 __ STA T10 + 1 
3058 : 30 09 __ BMI $3063 ; (prerender.s16 + 0)
.s30:
305a : a5 51 __ LDA T10 + 0 
305c : c5 4f __ CMP T8 + 0 
305e : b0 03 __ BCS $3063 ; (prerender.s16 + 0)
3060 : 4c e5 30 JMP $30e5 ; (prerender.s17 + 0)
.s16:
3063 : 84 59 __ STY T16 + 0 
3065 : a5 4c __ LDA T4 + 1 
3067 : 09 08 __ ORA #$08
3069 : 85 54 __ STA T11 + 1 
306b : a5 4a __ LDA T3 + 1 
306d : 09 08 __ ORA #$08
306f : 85 56 __ STA T12 + 1 
.l40:
3071 : a6 45 __ LDX T1 + 0 
3073 : a9 01 __ LDA #$01
3075 : 85 13 __ STA P6 
3077 : bd cb 3c LDA $3ccb,x ; (pipe_tiles[0][0] + 11)
307a : 85 16 __ STA P9 
307c : 98 __ __ TYA
307d : 0a __ __ ASL
307e : aa __ __ TAX
307f : bd a5 55 LDA $55a5,x ; (row_addr[0] + 0)
3082 : 18 __ __ CLC
3083 : 65 4d __ ADC T5 + 0 
3085 : 85 4f __ STA T8 + 0 
3087 : 85 0f __ STA P2 
3089 : bd a6 55 LDA $55a6,x ; (row_addr[0] + 1)
308c : 69 00 __ ADC #$00
308e : 85 50 __ STA T8 + 1 
3090 : 18 __ __ CLC
3091 : 65 4c __ ADC T4 + 1 
3093 : 85 10 __ STA P3 
3095 : 18 __ __ CLC
3096 : a5 4a __ LDA T3 + 1 
3098 : 65 50 __ ADC T8 + 1 
309a : aa __ __ TAX
309b : 18 __ __ CLC
309c : a5 0f __ LDA P2 
309e : 69 01 __ ADC #$01
30a0 : 85 11 __ STA P4 
30a2 : 90 01 __ BCC $30a5 ; (prerender.s42 + 0)
.s41:
30a4 : e8 __ __ INX
.s42:
30a5 : 86 12 __ STX P5 
30a7 : 20 b5 31 JSR $31b5 ; (copy_rows.s4 + 0)
30aa : a6 45 __ LDX T1 + 0 
30ac : a9 01 __ LDA #$01
30ae : 85 13 __ STA P6 
30b0 : bd d6 3c LDA $3cd6,x ; (cap_attr[0] + 0)
30b3 : 85 16 __ STA P9 
30b5 : 18 __ __ CLC
30b6 : a5 54 __ LDA T11 + 1 
30b8 : 65 50 __ ADC T8 + 1 
30ba : 85 10 __ STA P3 
30bc : 18 __ __ CLC
30bd : a5 56 __ LDA T12 + 1 
30bf : 65 50 __ ADC T8 + 1 
30c1 : aa __ __ TAX
30c2 : a5 4f __ LDA T8 + 0 
30c4 : 85 0f __ STA P2 
30c6 : 18 __ __ CLC
30c7 : 69 01 __ ADC #$01
30c9 : 85 11 __ STA P4 
30cb : 90 01 __ BCC $30ce ; (prerender.s44 + 0)
.s43:
30cd : e8 __ __ INX
.s44:
30ce : 86 12 __ STX P5 
30d0 : 20 b5 31 JSR $31b5 ; (copy_rows.s4 + 0)
30d3 : 18 __ __ CLC
30d4 : a5 59 __ LDA T16 + 0 
30d6 : 69 08 __ ADC #$08
30d8 : 85 59 __ STA T16 + 0 
30da : a8 __ __ TAY
30db : 24 52 __ BIT T10 + 1 
30dd : 30 92 __ BMI $3071 ; (prerender.l40 + 0)
.s29:
30df : a5 51 __ LDA T10 + 0 
30e1 : c5 59 __ CMP T16 + 0 
30e3 : b0 8c __ BCS $3071 ; (prerender.l40 + 0)
.s17:
30e5 : a5 57 __ LDA T13 + 0 
30e7 : 0a __ __ ASL
30e8 : aa __ __ TAX
30e9 : a5 58 __ LDA T15 + 0 
30eb : 85 16 __ STA P9 
30ed : bd b5 55 LDA $55b5,x ; (row_addr[0] + 16)
30f0 : 18 __ __ CLC
30f1 : 65 4d __ ADC T5 + 0 
30f3 : 85 0f __ STA P2 
30f5 : bd b6 55 LDA $55b6,x ; (row_addr[0] + 17)
30f8 : 69 00 __ ADC #$00
30fa : aa __ __ TAX
30fb : 18 __ __ CLC
30fc : 65 4c __ ADC T4 + 1 
30fe : 85 10 __ STA P3 
3100 : 8a __ __ TXA
3101 : 18 __ __ CLC
3102 : 65 4a __ ADC T3 + 1 
3104 : aa __ __ TAX
3105 : 18 __ __ CLC
3106 : a5 0f __ LDA P2 
3108 : 69 01 __ ADC #$01
310a : 85 11 __ STA P4 
310c : 90 01 __ BCC $310f ; (prerender.s46 + 0)
.s45:
310e : e8 __ __ INX
.s46:
310f : 86 12 __ STX P5 
3111 : 38 __ __ SEC
3112 : a9 14 __ LDA #$14
3114 : e5 57 __ SBC T13 + 0 
3116 : 38 __ __ SEC
3117 : e9 07 __ SBC #$07
3119 : 85 13 __ STA P6 
311b : 20 b5 31 JSR $31b5 ; (copy_rows.s4 + 0)
311e : a5 4d __ LDA T5 + 0 
3120 : c9 1e __ CMP #$1e
3122 : b0 6e __ BCS $3192 ; (prerender.s3 + 0)
.s18:
3124 : a5 4e __ LDA T6 + 0 
3126 : c9 1e __ CMP #$1e
3128 : 90 68 __ BCC $3192 ; (prerender.s3 + 0)
.s19:
312a : ad f1 3c LDA $3cf1 ; (bird_y + 0)
312d : 85 43 __ STA T0 + 0 
312f : ad f2 3c LDA $3cf2 ; (bird_y + 1)
3132 : 4a __ __ LSR
3133 : 66 43 __ ROR T0 + 0 
3135 : 4a __ __ LSR
3136 : 66 43 __ ROR T0 + 0 
3138 : 4a __ __ LSR
3139 : 66 43 __ ROR T0 + 0 
313b : 4a __ __ LSR
313c : 66 43 __ ROR T0 + 0 
313e : 4a __ __ LSR
313f : 66 43 __ ROR T0 + 0 
3141 : 4a __ __ LSR
3142 : 66 43 __ ROR T0 + 0 
3144 : 4a __ __ LSR
3145 : a5 43 __ LDA T0 + 0 
3147 : 6a __ __ ROR
3148 : 85 45 __ STA T1 + 0 
314a : d0 04 __ BNE $3150 ; (prerender.s20 + 0)
.s28:
314c : a9 00 __ LDA #$00
314e : f0 03 __ BEQ $3153 ; (prerender.s21 + 0)
.s20:
3150 : 38 __ __ SEC
3151 : e9 01 __ SBC #$01
.s21:
3153 : 85 47 __ STA T2 + 0 
3155 : 18 __ __ CLC
3156 : a5 45 __ LDA T1 + 0 
3158 : 69 03 __ ADC #$03
315a : 85 45 __ STA T1 + 0 
315c : a9 00 __ LDA #$00
315e : 6a __ __ ROR
315f : 85 46 __ STA T1 + 1 
3161 : 30 06 __ BMI $3169 ; (prerender.l22 + 0)
.s27:
3163 : a5 45 __ LDA T1 + 0 
3165 : c5 47 __ CMP T2 + 0 
3167 : 90 29 __ BCC $3192 ; (prerender.s3 + 0)
.l22:
3169 : a5 47 __ LDA T2 + 0 
316b : c9 15 __ CMP #$15
316d : b0 1b __ BCS $318a ; (prerender.s25 + 0)
.s23:
316f : c5 57 __ CMP T13 + 0 
3171 : 90 04 __ BCC $3177 ; (prerender.s24 + 0)
.s26:
3173 : c5 51 __ CMP T10 + 0 
3175 : 90 13 __ BCC $318a ; (prerender.s25 + 0)
.s24:
3177 : 0a __ __ ASL
3178 : aa __ __ TAX
3179 : bd a5 55 LDA $55a5,x ; (row_addr[0] + 0)
317c : 38 __ __ SEC
317d : e9 e3 __ SBC #$e3
317f : a8 __ __ TAY
3180 : bd a6 55 LDA $55a6,x ; (row_addr[0] + 1)
3183 : e9 ff __ SBC #$ff
3185 : aa __ __ TAX
3186 : 98 __ __ TYA
3187 : 20 89 32 JSR $3289 ; (hidden_stale.s4 + 0)
.s25:
318a : e6 47 __ INC T2 + 0 
318c : 24 46 __ BIT T1 + 1 
318e : 30 d9 __ BMI $3169 ; (prerender.l22 + 0)
3190 : 10 d1 __ BPL $3163 ; (prerender.s27 + 0)
.s3:
3192 : a2 06 __ LDX #$06
3194 : bd f2 bf LDA $bff2,x ; (prerender@stack + 0)
3197 : 95 53 __ STA T11 + 0,x 
3199 : ca __ __ DEX
319a : 10 f8 __ BPL $3194 ; (prerender.s3 + 2)
319c : 60 __ __ RTS
.s9:
319d : a9 00 __ LDA #$00
319f : 85 4d __ STA T5 + 0 
31a1 : 38 __ __ SEC
31a2 : e5 47 __ SBC T2 + 0 
31a4 : 85 43 __ STA T0 + 0 
31a6 : 49 ff __ EOR #$ff
31a8 : 18 __ __ CLC
31a9 : 69 0c __ ADC #$0c
31ab : c9 51 __ CMP #$51
31ad : b0 03 __ BCS $31b2 ; (prerender.s9 + 21)
31af : 4c f7 2f JMP $2ff7 ; (prerender.s11 + 0)
31b2 : 4c f2 2f JMP $2ff2 ; (prerender.s10 + 0)
--------------------------------------------------------------------
copy_rows: ; copy_rows(u16,u16,u8,u8,u8,u8)->void
; 368, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
31b5 : a5 13 __ LDA P6 ; (rows + 0)
31b7 : f0 57 __ BEQ $3210 ; (copy_rows.s3 + 0)
.l29:
31b9 : a5 14 __ LDA P7 ; (n + 0)
31bb : d0 54 __ BNE $3211 ; (copy_rows.s5 + 0)
.s25:
31bd : a5 0f __ LDA P2 ; (dst + 0)
31bf : a6 10 __ LDX P3 ; (dst + 1)
31c1 : 20 ec 20 JSR $20ec ; (vdc_mem_addr.s4 + 0)
31c4 : a5 0f __ LDA P2 ; (dst + 0)
31c6 : 8d f5 7c STA $7cf5 ; (copy_dst + 0)
31c9 : a5 10 __ LDA P3 ; (dst + 1)
31cb : 8d f6 7c STA $7cf6 ; (copy_dst + 1)
31ce : a9 ff __ LDA #$ff
31d0 : 8d f3 7c STA $7cf3 ; (copy_src + 0)
31d3 : 8d f4 7c STA $7cf4 ; (copy_src + 1)
.s30:
31d6 : a5 15 __ LDA P8 ; (edge + 0)
31d8 : f0 17 __ BEQ $31f1 ; (copy_rows.s23 + 0)
.s20:
31da : a9 1f __ LDA #$1f
31dc : 8d 00 d6 STA $d600 
.l21:
31df : 2c 00 d6 BIT $d600 
31e2 : 10 fb __ BPL $31df ; (copy_rows.l21 + 0)
.s22:
31e4 : a5 16 __ LDA P9 ; (tile + 0)
31e6 : 8d 01 d6 STA $d601 
31e9 : ee f5 7c INC $7cf5 ; (copy_dst + 0)
31ec : d0 03 __ BNE $31f1 ; (copy_rows.s23 + 0)
.s26:
31ee : ee f6 7c INC $7cf6 ; (copy_dst + 1)
.s23:
31f1 : 18 __ __ CLC
31f2 : a5 11 __ LDA P4 ; (src + 0)
31f4 : 69 50 __ ADC #$50
31f6 : 85 11 __ STA P4 ; (src + 0)
31f8 : 90 03 __ BCC $31fd ; (copy_rows.s28 + 0)
.s27:
31fa : e6 12 __ INC P5 ; (src + 1)
31fc : 18 __ __ CLC
.s28:
31fd : a5 0f __ LDA P2 ; (dst + 0)
31ff : 69 50 __ ADC #$50
3201 : 85 0f __ STA P2 ; (dst + 0)
3203 : a5 10 __ LDA P3 ; (dst + 1)
3205 : 69 00 __ ADC #$00
3207 : c6 13 __ DEC P6 ; (rows + 0)
3209 : f0 05 __ BEQ $3210 ; (copy_rows.s3 + 0)
.s24:
320b : 85 10 __ STA P3 ; (dst + 1)
320d : 4c b9 31 JMP $31b9 ; (copy_rows.l29 + 0)
.s3:
3210 : 60 __ __ RTS
.s5:
3211 : ad f6 7c LDA $7cf6 ; (copy_dst + 1)
3214 : 45 10 __ EOR P3 ; (dst + 1)
3216 : f0 0f __ BEQ $3227 ; (copy_rows.s9 + 0)
.s6:
3218 : a9 12 __ LDA #$12
321a : 8d 00 d6 STA $d600 
.l7:
321d : 2c 00 d6 BIT $d600 
3220 : 10 fb __ BPL $321d ; (copy_rows.l7 + 0)
.s8:
3222 : a5 10 __ LDA P3 ; (dst + 1)
3224 : 8d 01 d6 STA $d601 
.s9:
3227 : a9 13 __ LDA #$13
3229 : 8d 00 d6 STA $d600 
.l10:
322c : 2c 00 d6 BIT $d600 
322f : 10 fb __ BPL $322c ; (copy_rows.l10 + 0)
.s11:
3231 : a5 0f __ LDA P2 ; (dst + 0)
3233 : 8d 01 d6 STA $d601 
3236 : ad f4 7c LDA $7cf4 ; (copy_src + 1)
3239 : 45 12 __ EOR P5 ; (src + 1)
323b : f0 0f __ BEQ $324c ; (copy_rows.s15 + 0)
.s12:
323d : a9 20 __ LDA #$20
323f : 8d 00 d6 STA $d600 
.l13:
3242 : 2c 00 d6 BIT $d600 
3245 : 10 fb __ BPL $3242 ; (copy_rows.l13 + 0)
.s14:
3247 : a5 12 __ LDA P5 ; (src + 1)
3249 : 8d 01 d6 STA $d601 
.s15:
324c : a9 21 __ LDA #$21
324e : 8d 00 d6 STA $d600 
.l16:
3251 : 2c 00 d6 BIT $d600 
3254 : 10 fb __ BPL $3251 ; (copy_rows.l16 + 0)
.s17:
3256 : a5 11 __ LDA P4 ; (src + 0)
3258 : 8d 01 d6 STA $d601 
325b : a9 1e __ LDA #$1e
325d : 8d 00 d6 STA $d600 
.l18:
3260 : 2c 00 d6 BIT $d600 
3263 : 10 fb __ BPL $3260 ; (copy_rows.l18 + 0)
.s19:
3265 : a5 14 __ LDA P7 ; (n + 0)
3267 : 8d 01 d6 STA $d601 
326a : 18 __ __ CLC
326b : 65 11 __ ADC P4 ; (src + 0)
326d : 8d f3 7c STA $7cf3 ; (copy_src + 0)
3270 : a5 12 __ LDA P5 ; (src + 1)
3272 : 69 00 __ ADC #$00
3274 : 8d f4 7c STA $7cf4 ; (copy_src + 1)
3277 : 18 __ __ CLC
3278 : a5 14 __ LDA P7 ; (n + 0)
327a : 65 0f __ ADC P2 ; (dst + 0)
327c : 8d f5 7c STA $7cf5 ; (copy_dst + 0)
327f : a5 10 __ LDA P3 ; (dst + 1)
3281 : 69 00 __ ADC #$00
3283 : 8d f6 7c STA $7cf6 ; (copy_dst + 1)
3286 : 4c d6 31 JMP $31d6 ; (copy_rows.s30 + 0)
--------------------------------------------------------------------
hidden_stale: ; hidden_stale(u16,u8)->void
; 332, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
3289 : 85 1b __ STA ACCU + 0 
328b : 18 __ __ CLC
328c : 69 77 __ ADC #$77
328e : 85 43 __ STA T1 + 0 
3290 : 8a __ __ TXA
3291 : 69 65 __ ADC #$65
3293 : 85 44 __ STA T1 + 1 
3295 : a0 00 __ LDY #$00
3297 : b1 43 __ LDA (T1 + 0),y 
3299 : 85 1c __ STA ACCU + 1 
329b : 09 0c __ ORA #$0c
329d : 91 43 __ STA (T1 + 0),y 
329f : a5 1c __ LDA ACCU + 1 
32a1 : d0 2e __ BNE $32d1 ; (hidden_stale.s3 + 0)
.s5:
32a3 : ad f8 3c LDA $3cf8 ; (dirty_count + 0)
32a6 : 85 43 __ STA T1 + 0 
32a8 : 18 __ __ CLC
32a9 : 69 01 __ ADC #$01
32ab : 8d f8 3c STA $3cf8 ; (dirty_count + 0)
32ae : ad f9 3c LDA $3cf9 ; (dirty_count + 1)
32b1 : 85 44 __ STA T1 + 1 
32b3 : 69 00 __ ADC #$00
32b5 : 8d f9 3c STA $3cf9 ; (dirty_count + 1)
32b8 : 06 43 __ ASL T1 + 0 
32ba : 26 44 __ ROL T1 + 1 
32bc : 18 __ __ CLC
32bd : a9 48 __ LDA #$48
32bf : 65 43 __ ADC T1 + 0 
32c1 : 85 43 __ STA T1 + 0 
32c3 : a9 6d __ LDA #$6d
32c5 : 65 44 __ ADC T1 + 1 
32c7 : 85 44 __ STA T1 + 1 
32c9 : a5 1b __ LDA ACCU + 0 
32cb : 91 43 __ STA (T1 + 0),y 
32cd : 8a __ __ TXA
32ce : c8 __ __ INY
32cf : 91 43 __ STA (T1 + 0),y 
.s3:
32d1 : 60 __ __ RTS
--------------------------------------------------------------------
keys: ; keys()->u8
; 125, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
32d2 : a9 7f __ LDA #$7f
32d4 : 8d 00 dc STA $dc00 
32d7 : ad 01 dc LDA $dc01 
32da : aa __ __ TAX
32db : 29 10 __ AND #$10
32dd : f0 04 __ BEQ $32e3 ; (keys.s11 + 0)
.s12:
32df : a0 00 __ LDY #$00
32e1 : f0 02 __ BEQ $32e5 ; (keys.s13 + 0)
.s11:
32e3 : a0 01 __ LDY #$01
.s13:
32e5 : a9 df __ LDA #$df
32e7 : 8d 00 dc STA $dc00 
32ea : 8a __ __ TXA
32eb : 0a __ __ ASL
32ec : 30 04 __ BMI $32f2 ; (keys.s5 + 0)
.s10:
32ee : 98 __ __ TYA
32ef : 09 10 __ ORA #$10
32f1 : a8 __ __ TAY
.s5:
32f2 : ad 01 dc LDA $dc01 
32f5 : 29 02 __ AND #$02
32f7 : a2 ff __ LDX #$ff
32f9 : 8e 00 dc STX $dc00 
32fc : aa __ __ TAX
32fd : d0 02 __ BNE $3301 ; (keys.s6 + 0)
.s9:
32ff : c8 __ __ INY
3300 : c8 __ __ INY
.s6:
3301 : ad 00 dc LDA $dc00 
3304 : 29 10 __ AND #$10
3306 : d0 04 __ BNE $330c ; (keys.s7 + 0)
.s8:
3308 : 98 __ __ TYA
3309 : 09 01 __ ORA #$01
330b : 60 __ __ RTS
.s7:
330c : 98 __ __ TYA
.s3:
330d : 60 __ __ RTS
--------------------------------------------------------------------
prepare_frame: ; prepare_frame(u8)->void
; 531, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
330e : a2 09 __ LDX #$09
3310 : b5 53 __ LDA T0 + 0,x 
3312 : 9d e6 bf STA $bfe6,x ; (prepare_frame@stack + 0)
3315 : ca __ __ DEX
3316 : 10 f8 __ BPL $3310 ; (prepare_frame.s1 + 2)
.s4:
3318 : ad fa 7c LDA $7cfa ; (previous_keys + 0)
331b : 49 ff __ EOR #$ff
331d : 25 18 __ AND P11 ; (held + 0)
331f : 85 53 __ STA T0 + 0 
3321 : a9 00 __ LDA #$00
3323 : 8d fb 7c STA $7cfb ; (stepped + 0)
3326 : a5 18 __ LDA P11 ; (held + 0)
3328 : 8d fa 7c STA $7cfa ; (previous_keys + 0)
332b : ad ec 3c LDA $3cec ; (state + 0)
332e : c9 02 __ CMP #$02
3330 : d0 03 __ BNE $3335 ; (prepare_frame.s10 + 0)
3332 : 4c 41 38 JMP $3841 ; (prepare_frame.s5 + 0)
.s10:
3335 : c9 04 __ CMP #$04
3337 : d0 03 __ BNE $333c ; (prepare_frame.s19 + 0)
3339 : 4c ec 37 JMP $37ec ; (prepare_frame.s11 + 0)
.s19:
333c : aa __ __ TAX
333d : d0 2f __ BNE $336e ; (prepare_frame.s20 + 0)
.s130:
333f : ee b3 3c INC $3cb3 ; (random_state + 0)
3342 : d0 03 __ BNE $3347 ; (prepare_frame.s146 + 0)
.s145:
3344 : ee b4 3c INC $3cb4 ; (random_state + 1)
.s146:
3347 : a5 53 __ LDA T0 + 0 
3349 : 29 01 __ AND #$01
334b : f0 16 __ BEQ $3363 ; (prepare_frame.s3 + 0)
.s131:
334d : 8d ec 3c STA $3cec ; (state + 0)
3350 : 20 76 25 JSR $2576 ; (field.s4 + 0)
3353 : a9 de __ LDA #$de
3355 : 8d ef 3c STA $3cef ; (velocity + 0)
3358 : a9 ff __ LDA #$ff
335a : 8d f0 3c STA $3cf0 ; (velocity + 1)
335d : 20 4a 24 JSR $244a ; (bird_draw.s4 + 0)
.s9:
3360 : 20 65 38 JSR $3865 ; (sound_flap.s4 + 0)
.s3:
3363 : a2 09 __ LDX #$09
3365 : bd e6 bf LDA $bfe6,x ; (prepare_frame@stack + 0)
3368 : 95 53 __ STA T0 + 0,x 
336a : ca __ __ DEX
336b : 10 f8 __ BPL $3365 ; (prepare_frame.s3 + 2)
336d : 60 __ __ RTS
.s20:
336e : a5 53 __ LDA T0 + 0 
3370 : 29 02 __ AND #$02
3372 : f0 03 __ BEQ $3377 ; (prepare_frame.s24 + 0)
3374 : 4c d1 37 JMP $37d1 ; (prepare_frame.s21 + 0)
.s24:
3377 : ad ec 3c LDA $3cec ; (state + 0)
337a : c9 03 __ CMP #$03
337c : f0 e5 __ BEQ $3363 ; (prepare_frame.s3 + 0)
.s25:
337e : 46 53 __ LSR T0 + 0 
3380 : 90 0d __ BCC $338f ; (prepare_frame.s27 + 0)
.s26:
3382 : a9 de __ LDA #$de
3384 : 8d ef 3c STA $3cef ; (velocity + 0)
3387 : a9 ff __ LDA #$ff
3389 : 8d f0 3c STA $3cf0 ; (velocity + 1)
338c : 20 65 38 JSR $3865 ; (sound_flap.s4 + 0)
.s27:
338f : ad ef 3c LDA $3cef ; (velocity + 0)
3392 : a8 __ __ TAY
3393 : 18 __ __ CLC
3394 : 69 02 __ ADC #$02
3396 : 8d ef 3c STA $3cef ; (velocity + 0)
3399 : ad f0 3c LDA $3cf0 ; (velocity + 1)
339c : aa __ __ TAX
339d : 69 00 __ ADC #$00
339f : 8d f0 3c STA $3cf0 ; (velocity + 1)
33a2 : 8a __ __ TXA
33a3 : 30 10 __ BMI $33b5 ; (prepare_frame.s29 + 0)
.s129:
33a5 : d0 04 __ BNE $33ab ; (prepare_frame.s28 + 0)
.s128:
33a7 : c0 2f __ CPY #$2f
33a9 : 90 0a __ BCC $33b5 ; (prepare_frame.s29 + 0)
.s28:
33ab : a9 30 __ LDA #$30
33ad : 8d ef 3c STA $3cef ; (velocity + 0)
33b0 : a9 00 __ LDA #$00
33b2 : 8d f0 3c STA $3cf0 ; (velocity + 1)
.s29:
33b5 : ad f1 3c LDA $3cf1 ; (bird_y + 0)
33b8 : 18 __ __ CLC
33b9 : 6d ef 3c ADC $3cef ; (velocity + 0)
33bc : 8d f1 3c STA $3cf1 ; (bird_y + 0)
33bf : ad f2 3c LDA $3cf2 ; (bird_y + 1)
33c2 : 6d f0 3c ADC $3cf0 ; (velocity + 1)
33c5 : 8d f2 3c STA $3cf2 ; (bird_y + 1)
33c8 : 10 10 __ BPL $33da ; (prepare_frame.s124 + 0)
.s30:
33ca : a9 00 __ LDA #$00
33cc : 8d ef 3c STA $3cef ; (velocity + 0)
33cf : 8d f0 3c STA $3cf0 ; (velocity + 1)
33d2 : 8d f1 3c STA $3cf1 ; (bird_y + 0)
33d5 : 8d f2 3c STA $3cf2 ; (bird_y + 1)
33d8 : f0 25 __ BEQ $33ff ; (prepare_frame.s31 + 0)
.s124:
33da : a9 09 __ LDA #$09
33dc : cd f2 3c CMP $3cf2 ; (bird_y + 1)
33df : f0 04 __ BEQ $33e5 ; (prepare_frame.s126 + 0)
.s127:
33e1 : 90 09 __ BCC $33ec ; (prepare_frame.s125 + 0)
33e3 : b0 1a __ BCS $33ff ; (prepare_frame.s31 + 0)
.s126:
33e5 : ad f1 3c LDA $3cf1 ; (bird_y + 0)
33e8 : c9 c1 __ CMP #$c1
33ea : 90 13 __ BCC $33ff ; (prepare_frame.s31 + 0)
.s125:
33ec : a9 c0 __ LDA #$c0
33ee : 8d f1 3c STA $3cf1 ; (bird_y + 0)
33f1 : a9 09 __ LDA #$09
33f3 : 8d f2 3c STA $3cf2 ; (bird_y + 1)
33f6 : 20 4a 24 JSR $244a ; (bird_draw.s4 + 0)
33f9 : 20 91 38 JSR $3891 ; (crash.s4 + 0)
33fc : 4c cb 37 JMP $37cb ; (prepare_frame.s135 + 0)
.s31:
33ff : ad f4 3c LDA $3cf4 ; (speed + 0)
3402 : 18 __ __ CLC
3403 : 6d f5 3c ADC $3cf5 ; (scroll + 0)
3406 : aa __ __ TAX
3407 : 29 07 __ AND #$07
3409 : 8d f5 3c STA $3cf5 ; (scroll + 0)
340c : 8a __ __ TXA
340d : 4a __ __ LSR
340e : 4a __ __ LSR
340f : 4a __ __ LSR
3410 : 18 __ __ CLC
3411 : 6d f3 3c ADC $3cf3 ; (phase + 0)
3414 : 85 53 __ STA T0 + 0 
3416 : b0 04 __ BCS $341c ; (prepare_frame.s32 + 0)
.s123:
3418 : c9 04 __ CMP #$04
341a : 90 1e __ BCC $343a ; (prepare_frame.s34 + 0)
.s32:
341c : ad f9 7c LDA $7cf9 ; (prerendered + 0)
341f : b0 13 __ BCS $3434 ; (prepare_frame.l154 + 0)
.s33:
3421 : ad f9 7c LDA $7cf9 ; (prerendered + 0)
3424 : 85 55 __ STA T1 + 0 
3426 : 85 17 __ STA P10 
3428 : e6 55 __ INC T1 + 0 
342a : a5 55 __ LDA T1 + 0 
342c : 8d f9 7c STA $7cf9 ; (prerendered + 0)
342f : 20 77 2f JSR $2f77 ; (prerender.s1 + 0)
3432 : a5 55 __ LDA T1 + 0 
.l154:
3434 : c9 04 __ CMP #$04
3436 : 90 e9 __ BCC $3421 ; (prepare_frame.s33 + 0)
.s149:
3438 : a5 53 __ LDA T0 + 0 
.s34:
343a : 8d f3 3c STA $3cf3 ; (phase + 0)
343d : c9 04 __ CMP #$04
343f : 90 6f __ BCC $34b0 ; (prepare_frame.s39 + 0)
.s35:
3441 : e9 04 __ SBC #$04
3443 : 8d f3 3c STA $3cf3 ; (phase + 0)
3446 : a9 01 __ LDA #$01
3448 : 8d fb 7c STA $7cfb ; (stepped + 0)
344b : a9 00 __ LDA #$00
344d : 8d f9 7c STA $7cf9 ; (prerendered + 0)
3450 : 85 5c __ STA T11 + 0 
.l36:
3452 : 0a __ __ ASL
3453 : 0a __ __ ASL
3454 : 85 57 __ STA T2 + 0 
3456 : a8 __ __ TAY
3457 : b9 ec 3e LDA $3eec,y ; (pipes[0].x + 0)
345a : aa __ __ TAX
345b : 18 __ __ CLC
345c : 69 ff __ ADC #$ff
345e : 99 ec 3e STA $3eec,y ; (pipes[0].x + 0)
3461 : b9 ed 3e LDA $3eed,y ; (pipes[0].x + 1)
3464 : 85 54 __ STA T0 + 1 
3466 : 69 ff __ ADC #$ff
3468 : 99 ed 3e STA $3eed,y ; (pipes[0].x + 1)
346b : a5 54 __ LDA T0 + 1 
346d : 49 80 __ EOR #$80
346f : c9 7f __ CMP #$7f
3471 : d0 02 __ BNE $3475 ; (prepare_frame.s122 + 0)
.s121:
3473 : e0 f9 __ CPX #$f9
.s122:
3475 : 8a __ __ TXA
3476 : b0 1b __ BCS $3493 ; (prepare_frame.s68 + 0)
.s37:
3478 : 69 73 __ ADC #$73
347a : 99 ec 3e STA $3eec,y ; (pipes[0].x + 0)
347d : a5 54 __ LDA T0 + 1 
347f : 69 00 __ ADC #$00
3481 : 99 ed 3e STA $3eed,y ; (pipes[0].x + 1)
3484 : 20 49 25 JSR $2549 ; (gap_next.s4 + 0)
3487 : a6 57 __ LDX T2 + 0 
3489 : 9d ee 3e STA $3eee,x ; (pipes[0].gap + 0)
348c : a9 00 __ LDA #$00
348e : 9d ef 3e STA $3eef,x ; (pipes[0].passed + 0)
3491 : f0 15 __ BEQ $34a8 ; (prepare_frame.s38 + 0)
.s68:
3493 : e9 02 __ SBC #$02
3495 : 85 55 __ STA T1 + 0 
3497 : a5 54 __ LDA T0 + 1 
3499 : e9 00 __ SBC #$00
349b : 10 03 __ BPL $34a0 ; (prepare_frame.s120 + 0)
349d : 4c da 35 JMP $35da ; (prepare_frame.s69 + 0)
.s120:
34a0 : d0 06 __ BNE $34a8 ; (prepare_frame.s38 + 0)
.s119:
34a2 : a5 55 __ LDA T1 + 0 
34a4 : c9 50 __ CMP #$50
34a6 : 90 f5 __ BCC $349d ; (prepare_frame.s68 + 10)
.s38:
34a8 : e6 5c __ INC T11 + 0 
34aa : a5 5c __ LDA T11 + 0 
34ac : c9 04 __ CMP #$04
34ae : d0 a2 __ BNE $3452 ; (prepare_frame.l36 + 0)
.s39:
34b0 : a9 00 __ LDA #$00
34b2 : 85 5b __ STA T5 + 0 
.l40:
34b4 : 0a __ __ ASL
34b5 : 0a __ __ ASL
34b6 : 85 57 __ STA T2 + 0 
34b8 : a8 __ __ TAY
34b9 : b9 ec 3e LDA $3eec,y ; (pipes[0].x + 0)
34bc : 0a __ __ ASL
34bd : 85 53 __ STA T0 + 0 
34bf : b9 ed 3e LDA $3eed,y ; (pipes[0].x + 1)
34c2 : 2a __ __ ROL
34c3 : 06 53 __ ASL T0 + 0 
34c5 : 2a __ __ ROL
34c6 : 06 53 __ ASL T0 + 0 
34c8 : 2a __ __ ROL
34c9 : aa __ __ TAX
34ca : ad f3 3c LDA $3cf3 ; (phase + 0)
34cd : 0a __ __ ASL
34ce : 85 55 __ STA T1 + 0 
34d0 : a9 00 __ LDA #$00
34d2 : 2a __ __ ROL
34d3 : 85 56 __ STA T1 + 1 
34d5 : 38 __ __ SEC
34d6 : a5 53 __ LDA T0 + 0 
34d8 : e5 55 __ SBC T1 + 0 
34da : 85 59 __ STA T3 + 0 
34dc : 8a __ __ TXA
34dd : e5 56 __ SBC T1 + 1 
34df : 85 5a __ STA T3 + 1 
34e1 : b9 ef 3e LDA $3eef,y ; (pipes[0].passed + 0)
34e4 : d0 0f __ BNE $34f5 ; (prepare_frame.s150 + 0)
.s57:
34e6 : a5 5a __ LDA T3 + 1 
34e8 : 30 10 __ BMI $34fa ; (prepare_frame.s58 + 0)
.s67:
34ea : f0 03 __ BEQ $34ef ; (prepare_frame.s66 + 0)
34ec : 4c cc 35 JMP $35cc ; (prepare_frame.s41 + 0)
.s66:
34ef : a5 59 __ LDA T3 + 0 
34f1 : c9 b1 __ CMP #$b1
34f3 : 90 05 __ BCC $34fa ; (prepare_frame.s58 + 0)
.s150:
34f5 : a5 5a __ LDA T3 + 1 
34f7 : 4c cc 35 JMP $35cc ; (prepare_frame.s41 + 0)
.s58:
34fa : a9 01 __ LDA #$01
34fc : 99 ef 3e STA $3eef,y ; (pipes[0].passed + 0)
34ff : ac ee 3c LDY $3cee ; (score + 1)
3502 : a9 04 __ LDA #$04
3504 : 85 11 __ STA P4 
3506 : 84 13 __ STY P6 
3508 : ae ed 3c LDX $3ced ; (score + 0)
350b : 86 12 __ STX P5 
350d : c0 27 __ CPY #$27
350f : d0 02 __ BNE $3513 ; (prepare_frame.s65 + 0)
.s64:
3511 : e0 0f __ CPX #$0f
.s65:
3513 : b0 11 __ BCS $3526 ; (prepare_frame.s60 + 0)
.s59:
3515 : 8a __ __ TXA
3516 : 69 01 __ ADC #$01
3518 : 85 12 __ STA P5 
351a : 8d ed 3c STA $3ced ; (score + 0)
351d : aa __ __ TAX
351e : 90 01 __ BCC $3521 ; (prepare_frame.s148 + 0)
.s147:
3520 : c8 __ __ INY
.s148:
3521 : 84 13 __ STY P6 
3523 : 8c ee 3c STY $3cee ; (score + 1)
.s60:
3526 : 86 1b __ STX ACCU + 0 
3528 : 84 1c __ STY ACCU + 1 
352a : a9 0a __ LDA #$0a
352c : 20 10 3c JSR $3c10 ; (divmod + 53)
352f : a5 05 __ LDA WORK + 2 
3531 : d0 0a __ BNE $353d ; (prepare_frame.s63 + 0)
.s61:
3533 : ad f4 3c LDA $3cf4 ; (speed + 0)
3536 : c9 0c __ CMP #$0c
3538 : b0 03 __ BCS $353d ; (prepare_frame.s63 + 0)
.s62:
353a : ee f4 3c INC $3cf4 ; (speed + 0)
.s63:
353d : 20 d6 25 JSR $25d6 ; (number.s4 + 0)
3540 : a9 00 __ LDA #$00
3542 : 85 11 __ STA P4 
3544 : a9 01 __ LDA #$01
3546 : 85 0d __ STA P0 
3548 : a9 38 __ LDA #$38
354a : 85 0f __ STA P2 
354c : a9 10 __ LDA #$10
354e : 85 13 __ STA P6 
3550 : a9 07 __ LDA #$07
3552 : 85 12 __ STA P5 
3554 : 20 86 38 JSR $3886 ; (start@proxy + 0)
3557 : a9 00 __ LDA #$00
3559 : 8d 11 7d STA $7d11 ; (jump_freq[0] + 2)
355c : a9 4b __ LDA #$4b
355e : 8d 12 7d STA $7d12 ; (jump_freq[0] + 3)
3561 : a9 04 __ LDA #$04
3563 : 8d 0d 7d STA $7d0d ; (jump_at[0] + 1)
.s42:
3566 : a5 5a __ LDA T3 + 1 
3568 : 30 51 __ BMI $35bb ; (prepare_frame.s46 + 0)
.s54:
356a : d0 06 __ BNE $3572 ; (prepare_frame.s43 + 0)
.s53:
356c : a5 59 __ LDA T3 + 0 
356e : c9 b1 __ CMP #$b1
3570 : 90 49 __ BCC $35bb ; (prepare_frame.s46 + 0)
.s43:
3572 : a6 57 __ LDX T2 + 0 
3574 : bd ee 3e LDA $3eee,x ; (pipes[0].gap + 0)
3577 : 4a __ __ LSR
3578 : 85 54 __ STA T0 + 1 
357a : a9 00 __ LDA #$00
357c : 6a __ __ ROR
357d : 85 53 __ STA T0 + 0 
357f : ad f2 3c LDA $3cf2 ; (bird_y + 1)
3582 : 30 2e __ BMI $35b2 ; (prepare_frame.s44 + 0)
.s52:
3584 : c5 54 __ CMP T0 + 1 
3586 : d0 05 __ BNE $358d ; (prepare_frame.s51 + 0)
.s50:
3588 : ad f1 3c LDA $3cf1 ; (bird_y + 0)
358b : c5 53 __ CMP T0 + 0 
.s51:
358d : 90 23 __ BCC $35b2 ; (prepare_frame.s44 + 0)
.s45:
358f : a5 53 __ LDA T0 + 0 
3591 : 69 7f __ ADC #$7f
3593 : aa __ __ TAX
3594 : a5 54 __ LDA T0 + 1 
3596 : 69 03 __ ADC #$03
3598 : a8 __ __ TAY
3599 : ad f1 3c LDA $3cf1 ; (bird_y + 0)
359c : 18 __ __ CLC
359d : 69 c0 __ ADC #$c0
359f : 85 55 __ STA T1 + 0 
35a1 : ad f2 3c LDA $3cf2 ; (bird_y + 1)
35a4 : 69 00 __ ADC #$00
35a6 : 30 13 __ BMI $35bb ; (prepare_frame.s46 + 0)
.s49:
35a8 : 85 56 __ STA T1 + 1 
35aa : c4 56 __ CPY T1 + 1 
35ac : d0 02 __ BNE $35b0 ; (prepare_frame.s48 + 0)
.s47:
35ae : e4 55 __ CPX T1 + 0 
.s48:
35b0 : b0 09 __ BCS $35bb ; (prepare_frame.s46 + 0)
.s44:
35b2 : 20 4a 24 JSR $244a ; (bird_draw.s4 + 0)
35b5 : 20 91 38 JSR $3891 ; (crash.s4 + 0)
35b8 : 4c 63 33 JMP $3363 ; (prepare_frame.s3 + 0)
.s46:
35bb : e6 5b __ INC T5 + 0 
35bd : a5 5b __ LDA T5 + 0 
35bf : c9 04 __ CMP #$04
35c1 : b0 03 __ BCS $35c6 ; (prepare_frame.s132 + 0)
35c3 : 4c b4 34 JMP $34b4 ; (prepare_frame.l40 + 0)
.s132:
35c6 : 20 4a 24 JSR $244a ; (bird_draw.s4 + 0)
35c9 : 4c 63 33 JMP $3363 ; (prepare_frame.s3 + 0)
.s41:
35cc : 49 80 __ EOR #$80
35ce : c9 81 __ CMP #$81
35d0 : d0 04 __ BNE $35d6 ; (prepare_frame.s56 + 0)
.s55:
35d2 : a5 59 __ LDA T3 + 0 
35d4 : c9 18 __ CMP #$18
.s56:
35d6 : b0 e3 __ BCS $35bb ; (prepare_frame.s46 + 0)
35d8 : 90 8c __ BCC $3566 ; (prepare_frame.s42 + 0)
.s69:
35da : b9 ee 3e LDA $3eee,y ; (pipes[0].gap + 0)
35dd : 85 4f __ STA T12 + 0 
35df : 8a __ __ TXA
35e0 : 18 __ __ CLC
35e1 : 69 08 __ ADC #$08
35e3 : a8 __ __ TAY
35e4 : a5 54 __ LDA T0 + 1 
35e6 : 69 00 __ ADC #$00
35e8 : 85 58 __ STA T2 + 1 
35ea : a5 55 __ LDA T1 + 0 
35ec : 30 04 __ BMI $35f2 ; (prepare_frame.s70 + 0)
.s138:
35ee : c9 23 __ CMP #$23
35f0 : b0 0f __ BCS $3601 ; (prepare_frame.s72 + 0)
.s70:
35f2 : a5 54 __ LDA T0 + 1 
35f4 : 30 0b __ BMI $3601 ; (prepare_frame.s72 + 0)
.s118:
35f6 : d0 04 __ BNE $35fc ; (prepare_frame.s71 + 0)
.s117:
35f8 : e0 17 __ CPX #$17
35fa : 90 05 __ BCC $3601 ; (prepare_frame.s72 + 0)
.s71:
35fc : a9 01 __ LDA #$01
35fe : 8d f7 3c STA $3cf7 ; (bird_stale + 0)
.s72:
3601 : 8a __ __ TXA
3602 : 18 __ __ CLC
3603 : 69 a5 __ ADC #$a5
3605 : 85 59 __ STA T3 + 0 
3607 : a9 5d __ LDA #$5d
3609 : 65 54 __ ADC T0 + 1 
360b : 85 5a __ STA T3 + 1 
360d : 8a __ __ TXA
360e : 18 __ __ CLC
360f : 69 d5 __ ADC #$d5
3611 : 85 53 __ STA T0 + 0 
3613 : a9 55 __ LDA #$55
3615 : 65 54 __ ADC T0 + 1 
3617 : 85 54 __ STA T0 + 1 
3619 : 24 55 __ BIT T1 + 0 
361b : 30 03 __ BMI $3620 ; (prepare_frame.s115 + 0)
361d : 4c 26 37 JMP $3726 ; (prepare_frame.s73 + 0)
.s115:
3620 : 38 __ __ SEC
3621 : a9 00 __ LDA #$00
3623 : e5 55 __ SBC T1 + 0 
3625 : aa __ __ TAX
3626 : bd 82 3c LDA $3c82,x ; (__shltab1023L + 0)
3629 : 85 55 __ STA T1 + 0 
362b : bd 8c 3c LDA $3c8c,x ; (__shltab1023H + 0)
362e : 29 03 __ AND #$03
3630 : 85 56 __ STA T1 + 1 
3632 : a5 58 __ LDA T2 + 1 
3634 : d0 04 __ BNE $363a ; (prepare_frame.s85 + 0)
.s116:
3636 : c0 51 __ CPY #$51
3638 : 90 10 __ BCC $364a ; (prepare_frame.s88 + 0)
.s85:
363a : 98 __ __ TYA
363b : 29 0f __ AND #$0f
363d : f0 0b __ BEQ $364a ; (prepare_frame.s88 + 0)
.s151:
363f : aa __ __ TAX
3640 : a5 56 __ LDA T1 + 1 
.l86:
3642 : 4a __ __ LSR
3643 : 66 55 __ ROR T1 + 0 
3645 : ca __ __ DEX
3646 : d0 fa __ BNE $3642 ; (prepare_frame.l86 + 0)
.s87:
3648 : 85 56 __ STA T1 + 1 
.s88:
364a : 18 __ __ CLC
364b : a5 4f __ LDA T12 + 0 
364d : 69 07 __ ADC #$07
364f : 85 57 __ STA T2 + 0 
3651 : a9 00 __ LDA #$00
3653 : 2a __ __ ROL
3654 : 85 58 __ STA T2 + 1 
3656 : a5 56 __ LDA T1 + 1 
3658 : 29 02 __ AND #$02
365a : 85 44 __ STA T4 + 1 
365c : a5 55 __ LDA T1 + 0 
365e : 29 01 __ AND #$01
3660 : 85 5b __ STA T5 + 0 
3662 : 38 __ __ SEC
3663 : a5 57 __ LDA T2 + 0 
3665 : e9 08 __ SBC #$08
3667 : 85 45 __ STA T6 + 0 
3669 : a5 58 __ LDA T2 + 1 
366b : e9 00 __ SBC #$00
366d : 85 46 __ STA T6 + 1 
366f : a5 55 __ LDA T1 + 0 
3671 : 29 02 __ AND #$02
3673 : 85 47 __ STA T7 + 0 
3675 : a5 56 __ LDA T1 + 1 
3677 : 29 01 __ AND #$01
3679 : 85 4a __ STA T8 + 1 
367b : a5 55 __ LDA T1 + 0 
367d : 29 80 __ AND #$80
367f : 85 4b __ STA T9 + 0 
3681 : a5 55 __ LDA T1 + 0 
3683 : 29 04 __ AND #$04
3685 : 85 55 __ STA T1 + 0 
3687 : a2 00 __ LDX #$00
.l152:
3689 : e4 4f __ CPX T12 + 0 
368b : 90 08 __ BCC $3695 ; (prepare_frame.s91 + 0)
.s89:
368d : a5 58 __ LDA T2 + 1 
368f : d0 3c __ BNE $36cd ; (prepare_frame.s90 + 0)
.s113:
3691 : e4 57 __ CPX T2 + 0 
3693 : 90 38 __ BCC $36cd ; (prepare_frame.s90 + 0)
.s91:
3695 : a5 46 __ LDA T6 + 1 
3697 : d0 04 __ BNE $369d ; (prepare_frame.s102 + 0)
.s112:
3699 : e4 45 __ CPX T6 + 0 
369b : f0 4f __ BEQ $36ec ; (prepare_frame.s92 + 0)
.s102:
369d : a5 58 __ LDA T2 + 1 
369f : d0 04 __ BNE $36a5 ; (prepare_frame.s103 + 0)
.s111:
36a1 : e4 57 __ CPX T2 + 0 
36a3 : f0 47 __ BEQ $36ec ; (prepare_frame.s92 + 0)
.s103:
36a5 : a5 47 __ LDA T7 + 0 
36a7 : f0 06 __ BEQ $36af ; (prepare_frame.s105 + 0)
.s104:
36a9 : a9 0a __ LDA #$0a
36ab : a0 01 __ LDY #$01
36ad : 91 53 __ STA (T0 + 0),y 
.s105:
36af : a5 55 __ LDA T1 + 0 
36b1 : f0 06 __ BEQ $36b9 ; (prepare_frame.s107 + 0)
.s106:
36b3 : a9 0b __ LDA #$0b
36b5 : a0 02 __ LDY #$02
36b7 : 91 53 __ STA (T0 + 0),y 
.s107:
36b9 : a5 4b __ LDA T9 + 0 
36bb : f0 06 __ BEQ $36c3 ; (prepare_frame.s109 + 0)
.s108:
36bd : a9 0c __ LDA #$0c
36bf : a0 07 __ LDY #$07
36c1 : 91 53 __ STA (T0 + 0),y 
.s109:
36c3 : a5 4a __ LDA T8 + 1 
36c5 : f0 06 __ BEQ $36cd ; (prepare_frame.s90 + 0)
.s110:
36c7 : a9 20 __ LDA #$20
36c9 : a0 08 __ LDY #$08
.s133:
36cb : 91 53 __ STA (T0 + 0),y 
.s90:
36cd : e8 __ __ INX
36ce : e0 15 __ CPX #$15
36d0 : 90 03 __ BCC $36d5 ; (prepare_frame.s136 + 0)
36d2 : 4c a8 34 JMP $34a8 ; (prepare_frame.s38 + 0)
.s136:
36d5 : a5 59 __ LDA T3 + 0 
36d7 : 69 50 __ ADC #$50
36d9 : 85 59 __ STA T3 + 0 
36db : 90 03 __ BCC $36e0 ; (prepare_frame.s140 + 0)
.s139:
36dd : e6 5a __ INC T3 + 1 
36df : 18 __ __ CLC
.s140:
36e0 : a5 53 __ LDA T0 + 0 
36e2 : 69 50 __ ADC #$50
36e4 : 85 53 __ STA T0 + 0 
36e6 : 90 a1 __ BCC $3689 ; (prepare_frame.l152 + 0)
.s141:
36e8 : e6 54 __ INC T0 + 1 
36ea : b0 9d __ BCS $3689 ; (prepare_frame.l152 + 0)
.s92:
36ec : a5 5b __ LDA T5 + 0 
36ee : f0 0a __ BEQ $36fa ; (prepare_frame.s94 + 0)
.s93:
36f0 : a9 05 __ LDA #$05
36f2 : a0 00 __ LDY #$00
36f4 : 91 59 __ STA (T3 + 0),y 
36f6 : a9 0d __ LDA #$0d
36f8 : 91 53 __ STA (T0 + 0),y 
.s94:
36fa : a5 47 __ LDA T7 + 0 
36fc : f0 06 __ BEQ $3704 ; (prepare_frame.s96 + 0)
.s95:
36fe : a9 0e __ LDA #$0e
3700 : a0 01 __ LDY #$01
3702 : 91 53 __ STA (T0 + 0),y 
.s96:
3704 : a5 55 __ LDA T1 + 0 
3706 : f0 06 __ BEQ $370e ; (prepare_frame.s98 + 0)
.s97:
3708 : a9 0f __ LDA #$0f
370a : a0 02 __ LDY #$02
370c : 91 53 __ STA (T0 + 0),y 
.s98:
370e : a5 4a __ LDA T8 + 1 
3710 : f0 06 __ BEQ $3718 ; (prepare_frame.s100 + 0)
.s99:
3712 : a9 10 __ LDA #$10
3714 : a0 08 __ LDY #$08
3716 : 91 53 __ STA (T0 + 0),y 
.s100:
3718 : a5 44 __ LDA T4 + 1 
371a : f0 b1 __ BEQ $36cd ; (prepare_frame.s90 + 0)
.s101:
371c : a9 04 __ LDA #$04
371e : a0 09 __ LDY #$09
3720 : 91 59 __ STA (T3 + 0),y 
3722 : a9 20 __ LDA #$20
3724 : d0 a5 __ BNE $36cb ; (prepare_frame.s133 + 0)
.s73:
3726 : a5 58 __ LDA T2 + 1 
3728 : d0 04 __ BNE $372e ; (prepare_frame.s84 + 0)
.s114:
372a : c0 51 __ CPY #$51
372c : 90 0b __ BCC $3739 ; (prepare_frame.s74 + 0)
.s84:
372e : a9 ff __ LDA #$ff
3730 : 85 55 __ STA T1 + 0 
3732 : a9 03 __ LDA #$03
3734 : 85 56 __ STA T1 + 1 
3736 : 4c 3a 36 JMP $363a ; (prepare_frame.s85 + 0)
.s74:
3739 : a5 4f __ LDA T12 + 0 
373b : 69 07 __ ADC #$07
373d : 85 55 __ STA T1 + 0 
373f : a9 00 __ LDA #$00
3741 : 2a __ __ ROL
3742 : 85 56 __ STA T1 + 1 
3744 : 38 __ __ SEC
3745 : a5 55 __ LDA T1 + 0 
3747 : e9 08 __ SBC #$08
3749 : 85 57 __ STA T2 + 0 
374b : a5 56 __ LDA T1 + 1 
374d : e9 00 __ SBC #$00
374f : 85 58 __ STA T2 + 1 
3751 : a2 00 __ LDX #$00
.l153:
3753 : e4 4f __ CPX T12 + 0 
3755 : 90 08 __ BCC $375f ; (prepare_frame.s77 + 0)
.s75:
3757 : a5 56 __ LDA T1 + 1 
3759 : d0 51 __ BNE $37ac ; (prepare_frame.s76 + 0)
.s83:
375b : e4 55 __ CPX T1 + 0 
375d : 90 4d __ BCC $37ac ; (prepare_frame.s76 + 0)
.s77:
375f : a5 58 __ LDA T2 + 1 
3761 : d0 04 __ BNE $3767 ; (prepare_frame.s79 + 0)
.s82:
3763 : e4 57 __ CPX T2 + 0 
3765 : f0 08 __ BEQ $376f ; (prepare_frame.s78 + 0)
.s79:
3767 : a5 56 __ LDA T1 + 1 
3769 : d0 2b __ BNE $3796 ; (prepare_frame.s80 + 0)
.s81:
376b : e4 55 __ CPX T1 + 0 
376d : d0 27 __ BNE $3796 ; (prepare_frame.s80 + 0)
.s78:
376f : a9 05 __ LDA #$05
3771 : a0 00 __ LDY #$00
3773 : 91 59 __ STA (T3 + 0),y 
3775 : a9 04 __ LDA #$04
3777 : a0 09 __ LDY #$09
3779 : 91 59 __ STA (T3 + 0),y 
377b : a9 0d __ LDA #$0d
377d : a0 00 __ LDY #$00
377f : 91 53 __ STA (T0 + 0),y 
3781 : a9 0e __ LDA #$0e
3783 : c8 __ __ INY
3784 : 91 53 __ STA (T0 + 0),y 
3786 : a9 0f __ LDA #$0f
3788 : c8 __ __ INY
3789 : 91 53 __ STA (T0 + 0),y 
378b : a9 10 __ LDA #$10
378d : a0 08 __ LDY #$08
378f : 91 53 __ STA (T0 + 0),y 
3791 : a9 20 __ LDA #$20
3793 : c8 __ __ INY
3794 : d0 14 __ BNE $37aa ; (prepare_frame.s134 + 0)
.s80:
3796 : a9 0a __ LDA #$0a
3798 : a0 01 __ LDY #$01
379a : 91 53 __ STA (T0 + 0),y 
379c : a9 0b __ LDA #$0b
379e : c8 __ __ INY
379f : 91 53 __ STA (T0 + 0),y 
37a1 : a9 0c __ LDA #$0c
37a3 : a0 07 __ LDY #$07
37a5 : 91 53 __ STA (T0 + 0),y 
37a7 : a9 20 __ LDA #$20
37a9 : c8 __ __ INY
.s134:
37aa : 91 53 __ STA (T0 + 0),y 
.s76:
37ac : e8 __ __ INX
37ad : e0 15 __ CPX #$15
37af : 90 03 __ BCC $37b4 ; (prepare_frame.s137 + 0)
37b1 : 4c a8 34 JMP $34a8 ; (prepare_frame.s38 + 0)
.s137:
37b4 : a5 59 __ LDA T3 + 0 
37b6 : 69 50 __ ADC #$50
37b8 : 85 59 __ STA T3 + 0 
37ba : 90 03 __ BCC $37bf ; (prepare_frame.s143 + 0)
.s142:
37bc : e6 5a __ INC T3 + 1 
37be : 18 __ __ CLC
.s143:
37bf : a5 53 __ LDA T0 + 0 
37c1 : 69 50 __ ADC #$50
37c3 : 85 53 __ STA T0 + 0 
37c5 : 90 8c __ BCC $3753 ; (prepare_frame.l153 + 0)
.s144:
37c7 : e6 54 __ INC T0 + 1 
37c9 : b0 88 __ BCS $3753 ; (prepare_frame.l153 + 0)
.s135:
37cb : 20 a3 27 JSR $27a3 ; (game_over.s4 + 0)
37ce : 4c 63 33 JMP $3363 ; (prepare_frame.s3 + 0)
.s21:
37d1 : a9 03 __ LDA #$03
37d3 : cd ec 3c CMP $3cec ; (state + 0)
37d6 : d0 0b __ BNE $37e3 ; (prepare_frame.s23 + 0)
.s22:
37d8 : a9 01 __ LDA #$01
37da : 8d ec 3c STA $3cec ; (state + 0)
37dd : 20 76 25 JSR $2576 ; (field.s4 + 0)
37e0 : 4c c6 35 JMP $35c6 ; (prepare_frame.s132 + 0)
.s23:
37e3 : 8d ec 3c STA $3cec ; (state + 0)
37e6 : 20 d0 27 JSR $27d0 ; (banner.s4 + 0)
37e9 : 4c 63 33 JMP $3363 ; (prepare_frame.s3 + 0)
.s11:
37ec : ad ef 3c LDA $3cef ; (velocity + 0)
37ef : a8 __ __ TAY
37f0 : 69 01 __ ADC #$01
37f2 : 8d ef 3c STA $3cef ; (velocity + 0)
37f5 : ad f0 3c LDA $3cf0 ; (velocity + 1)
37f8 : aa __ __ TAX
37f9 : 69 00 __ ADC #$00
37fb : 8d f0 3c STA $3cf0 ; (velocity + 1)
37fe : 8a __ __ TXA
37ff : 30 10 __ BMI $3811 ; (prepare_frame.s13 + 0)
.s18:
3801 : d0 04 __ BNE $3807 ; (prepare_frame.s12 + 0)
.s17:
3803 : c0 2f __ CPY #$2f
3805 : 90 0a __ BCC $3811 ; (prepare_frame.s13 + 0)
.s12:
3807 : a9 30 __ LDA #$30
3809 : 8d ef 3c STA $3cef ; (velocity + 0)
380c : a9 00 __ LDA #$00
380e : 8d f0 3c STA $3cf0 ; (velocity + 1)
.s13:
3811 : ad f1 3c LDA $3cf1 ; (bird_y + 0)
3814 : 18 __ __ CLC
3815 : 6d ef 3c ADC $3cef ; (velocity + 0)
3818 : 8d f1 3c STA $3cf1 ; (bird_y + 0)
381b : ad f2 3c LDA $3cf2 ; (bird_y + 1)
381e : 6d f0 3c ADC $3cf0 ; (velocity + 1)
3821 : 8d f2 3c STA $3cf2 ; (bird_y + 1)
3824 : 49 80 __ EOR #$80
3826 : c9 89 __ CMP #$89
3828 : d0 05 __ BNE $382f ; (prepare_frame.s16 + 0)
.s15:
382a : ad f1 3c LDA $3cf1 ; (bird_y + 0)
382d : c9 c0 __ CMP #$c0
.s16:
382f : 90 af __ BCC $37e0 ; (prepare_frame.s22 + 8)
.s14:
3831 : a9 c0 __ LDA #$c0
3833 : 8d f1 3c STA $3cf1 ; (bird_y + 0)
3836 : a9 09 __ LDA #$09
3838 : 8d f2 3c STA $3cf2 ; (bird_y + 1)
383b : 20 4a 24 JSR $244a ; (bird_draw.s4 + 0)
383e : 4c cb 37 JMP $37cb ; (prepare_frame.s135 + 0)
.s5:
3841 : ad fc 7c LDA $7cfc ; (death_delay + 0)
3844 : f0 06 __ BEQ $384c ; (prepare_frame.s7 + 0)
.s6:
3846 : ce fc 7c DEC $7cfc ; (death_delay + 0)
3849 : 4c 63 33 JMP $3363 ; (prepare_frame.s3 + 0)
.s7:
384c : a5 53 __ LDA T0 + 0 
384e : 29 01 __ AND #$01
3850 : f0 f7 __ BEQ $3849 ; (prepare_frame.s6 + 3)
.s8:
3852 : 8d ec 3c STA $3cec ; (state + 0)
3855 : 20 d8 23 JSR $23d8 ; (reset_game.s4 + 0)
3858 : a9 de __ LDA #$de
385a : 8d ef 3c STA $3cef ; (velocity + 0)
385d : a9 ff __ LDA #$ff
385f : 8d f0 3c STA $3cf0 ; (velocity + 1)
3862 : 4c 60 33 JMP $3360 ; (prepare_frame.s9 + 0)
--------------------------------------------------------------------
sound_flap: ; sound_flap()->void
;  16, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3865 : a9 00 __ LDA #$00
3867 : 85 0d __ STA P0 
3869 : 8d 04 d4 STA $d404 
386c : a9 35 __ LDA #$35
386e : 8d 05 d4 STA $d405 
3871 : a9 02 __ LDA #$02
3873 : 8d 06 d4 STA $d406 
3876 : a9 14 __ LDA #$14
3878 : 85 0f __ STA P2 
387a : a9 80 __ LDA #$80
387c : 85 13 __ STA P6 
387e : a9 05 __ LDA #$05
3880 : 85 11 __ STA P4 
3882 : a9 04 __ LDA #$04
3884 : 85 12 __ STA P5 
--------------------------------------------------------------------
start@proxy: ; start@proxy
3886 : a9 00 __ LDA #$00
3888 : 85 0e __ STA P1 
388a : a9 00 __ LDA #$00
388c : 85 10 __ STA P3 
388e : 4c db 38 JMP $38db ; (start.s4 + 0)
--------------------------------------------------------------------
crash: ; crash()->void
; 519, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
3891 : a9 04 __ LDA #$04
3893 : 8d ec 3c STA $3cec ; (state + 0)
3896 : a9 00 __ LDA #$00
3898 : 8d 04 d4 STA $d404 
389b : 8d ef 3c STA $3cef ; (velocity + 0)
389e : 8d f0 3c STA $3cf0 ; (velocity + 1)
38a1 : 85 0d __ STA P0 
38a3 : 85 0e __ STA P1 
38a5 : 85 10 __ STA P3 
38a7 : a9 03 __ LDA #$03
38a9 : 8d fe 3e STA $3efe ; (flash + 0)
38ac : a9 08 __ LDA #$08
38ae : 8d 05 d4 STA $d405 
38b1 : a9 88 __ LDA #$88
38b3 : 8d 06 d4 STA $d406 
38b6 : a9 0c __ LDA #$0c
38b8 : 85 0f __ STA P2 
38ba : a9 80 __ LDA #$80
38bc : 85 13 __ STA P6 
38be : a9 ff __ LDA #$ff
38c0 : 85 11 __ STA P4 
38c2 : a9 05 __ LDA #$05
38c4 : 85 12 __ STA P5 
38c6 : 20 db 38 JSR $38db ; (start.s4 + 0)
38c9 : a9 40 __ LDA #$40
38cb : 85 0f __ STA P2 
38cd : 85 13 __ STA P6 
38cf : a9 02 __ LDA #$02
38d1 : 85 0d __ STA P0 
38d3 : a9 fd __ LDA #$fd
38d5 : 85 11 __ STA P4 
38d7 : a9 1a __ LDA #$1a
38d9 : 85 12 __ STA P5 
--------------------------------------------------------------------
start: ; start(u8,u16,i16,u8,u8)->void
;  69, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.c"
.s4:
38db : a6 0d __ LDX P0 ; (v + 0)
38dd : bc 7f 3c LDY $3c7f,x ; (__multab7L + 0)
38e0 : 84 43 __ STY T4 + 0 
38e2 : a9 00 __ LDA #$00
38e4 : 9d 0c 7d STA $7d0c,x ; (jump_at[0] + 0)
38e7 : 99 04 d4 STA $d404,y 
38ea : 8a __ __ TXA
38eb : 0a __ __ ASL
38ec : a8 __ __ TAY
38ed : a5 0e __ LDA P1 ; (f + 0)
38ef : 99 00 7d STA $7d00,y ; (freq[0] + 0)
38f2 : a5 0f __ LDA P2 ; (f + 1)
38f4 : 99 01 7d STA $7d01,y ; (freq[0] + 1)
38f7 : a5 10 __ LDA P3 ; (s + 0)
38f9 : 99 06 7d STA $7d06,y ; (step[0] + 0)
38fc : a5 11 __ LDA P4 ; (s + 1)
38fe : 99 07 7d STA $7d07,y ; (step[0] + 1)
3901 : a5 12 __ LDA P5 ; (n + 0)
3903 : 9d e1 3c STA $3ce1,x ; (timer[0] + 0)
3906 : a5 13 __ LDA P6 ; (w + 0)
3908 : 9d fd 7c STA $7cfd,x ; (wave[0] + 0)
390b : 8a __ __ TXA
390c : 20 19 39 JSR $3919 ; (apply.s4 + 0)
390f : a5 13 __ LDA P6 ; (w + 0)
3911 : 09 01 __ ORA #$01
3913 : a6 43 __ LDX T4 + 0 
3915 : 9d 04 d4 STA $d404,x 
.s3:
3918 : 60 __ __ RTS
--------------------------------------------------------------------
apply: ; apply(u8)->void
;  61, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.c"
.s4:
3919 : aa __ __ TAX
391a : 0a __ __ ASL
391b : bc 7f 3c LDY $3c7f,x ; (__multab7L + 0)
391e : aa __ __ TAX
391f : bd 00 7d LDA $7d00,x ; (freq[0] + 0)
3922 : 99 00 d4 STA $d400,y 
3925 : bd 01 7d LDA $7d01,x ; (freq[0] + 1)
3928 : 99 01 d4 STA $d401,y 
.s3:
392b : 60 __ __ RTS
--------------------------------------------------------------------
sound_tick: ; sound_tick()->void
;  12, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
392c : a2 00 __ LDX #$00
392e : ad e1 3c LDA $3ce1 ; (timer[0] + 0)
3931 : d0 0b __ BNE $393e ; (sound_tick.l6 + 0)
.l21:
3933 : e8 __ __ INX
3934 : e0 03 __ CPX #$03
3936 : 90 01 __ BCC $3939 ; (sound_tick.s5 + 0)
3938 : 60 __ __ RTS
.s5:
3939 : bd e1 3c LDA $3ce1,x ; (timer[0] + 0)
393c : f0 f5 __ BEQ $3933 ; (sound_tick.l21 + 0)
.l6:
393e : 86 47 __ STX T6 + 0 
3940 : 85 48 __ STA T7 + 0 
3942 : 8a __ __ TXA
3943 : 0a __ __ ASL
3944 : 85 46 __ STA T5 + 0 
3946 : a8 __ __ TAY
3947 : b9 07 7d LDA $7d07,y ; (step[0] + 1)
394a : 19 06 7d ORA $7d06,y ; (step[0] + 0)
394d : f0 55 __ BEQ $39a4 ; (sound_tick.s10 + 0)
.s7:
394f : b9 07 7d LDA $7d07,y ; (step[0] + 1)
3952 : 29 80 __ AND #$80
3954 : 10 02 __ BPL $3958 ; (sound_tick.s7 + 9)
3956 : a9 ff __ LDA #$ff
3958 : 85 1d __ STA ACCU + 2 
395a : b9 06 7d LDA $7d06,y ; (step[0] + 0)
395d : 18 __ __ CLC
395e : 79 00 7d ADC $7d00,y ; (freq[0] + 0)
3961 : 85 43 __ STA T0 + 0 
3963 : b9 07 7d LDA $7d07,y ; (step[0] + 1)
3966 : 79 01 7d ADC $7d01,y ; (freq[0] + 1)
3969 : 85 44 __ STA T0 + 1 
396b : a5 1d __ LDA ACCU + 2 
396d : 69 00 __ ADC #$00
396f : 85 45 __ STA T0 + 2 
3971 : a5 1d __ LDA ACCU + 2 
3973 : 69 00 __ ADC #$00
3975 : 10 15 __ BPL $398c ; (sound_tick.s15 + 0)
.s8:
3977 : a9 00 __ LDA #$00
.s20:
3979 : 85 44 __ STA T0 + 1 
.s9:
397b : 99 00 7d STA $7d00,y ; (freq[0] + 0)
397e : a5 44 __ LDA T0 + 1 
3980 : 99 01 7d STA $7d01,y ; (freq[0] + 1)
3983 : 8a __ __ TXA
3984 : 20 19 39 JSR $3919 ; (apply.s4 + 0)
3987 : a6 47 __ LDX T6 + 0 
3989 : 4c a4 39 JMP $39a4 ; (sound_tick.s10 + 0)
.s15:
398c : d0 04 __ BNE $3992 ; (sound_tick.s23 + 0)
.s16:
398e : a5 45 __ LDA T0 + 2 
3990 : f0 04 __ BEQ $3996 ; (sound_tick.s17 + 0)
.s23:
3992 : a9 ff __ LDA #$ff
3994 : d0 e3 __ BNE $3979 ; (sound_tick.s20 + 0)
.s17:
3996 : a9 ff __ LDA #$ff
3998 : c5 44 __ CMP T0 + 1 
399a : d0 02 __ BNE $399e ; (sound_tick.s19 + 0)
.s18:
399c : c5 43 __ CMP T0 + 0 
.s19:
399e : 90 d9 __ BCC $3979 ; (sound_tick.s20 + 0)
.s22:
39a0 : a5 43 __ LDA T0 + 0 
39a2 : b0 d7 __ BCS $397b ; (sound_tick.s9 + 0)
.s10:
39a4 : c6 48 __ DEC T7 + 0 
39a6 : a5 48 __ LDA T7 + 0 
39a8 : 9d e1 3c STA $3ce1,x ; (timer[0] + 0)
39ab : dd 0c 7d CMP $7d0c,x ; (jump_at[0] + 0)
39ae : d0 19 __ BNE $39c9 ; (sound_tick.s14 + 0)
.s11:
39b0 : bd 0c 7d LDA $7d0c,x ; (jump_at[0] + 0)
39b3 : f0 14 __ BEQ $39c9 ; (sound_tick.s14 + 0)
.s12:
39b5 : a4 46 __ LDY T5 + 0 
39b7 : b9 0f 7d LDA $7d0f,y ; (jump_freq[0] + 0)
39ba : 99 00 7d STA $7d00,y ; (freq[0] + 0)
39bd : b9 10 7d LDA $7d10,y ; (jump_freq[0] + 1)
39c0 : 99 01 7d STA $7d01,y ; (freq[0] + 1)
39c3 : 8a __ __ TXA
39c4 : 20 19 39 JSR $3919 ; (apply.s4 + 0)
39c7 : a6 47 __ LDX T6 + 0 
.s14:
39c9 : a5 48 __ LDA T7 + 0 
39cb : f0 03 __ BEQ $39d0 ; (sound_tick.s13 + 0)
39cd : 4c 33 39 JMP $3933 ; (sound_tick.l21 + 0)
.s13:
39d0 : bd fd 7c LDA $7cfd,x ; (wave[0] + 0)
39d3 : bc 7f 3c LDY $3c7f,x ; (__multab7L + 0)
39d6 : 99 04 d4 STA $d404,y 
39d9 : 4c 33 39 JMP $3933 ; (sound_tick.l21 + 0)
.s3:
39dc : 60 __ __ RTS
--------------------------------------------------------------------
stage_frame: ; stage_frame()->void
; 713, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
39dd : a2 04 __ LDX #$04
39df : b5 53 __ LDA T2 + 0,x 
39e1 : 9d f7 bf STA $bff7,x ; (stage_frame@stack + 0)
39e4 : ca __ __ DEX
39e5 : 10 f8 __ BPL $39df ; (stage_frame.s1 + 2)
.s4:
39e7 : ad fb 7c LDA $7cfb ; (stepped + 0)
39ea : 8d ff 3e STA $3eff ; (flip + 0)
39ed : ae 15 7d LDX $7d15 ; (max_dirty + 0)
39f0 : ad 16 7d LDA $7d16 ; (max_dirty + 1)
39f3 : cd f9 3c CMP $3cf9 ; (dirty_count + 1)
39f6 : d0 03 __ BNE $39fb ; (stage_frame.s37 + 0)
.s36:
39f8 : ec f8 3c CPX $3cf8 ; (dirty_count + 0)
.s37:
39fb : b0 0c __ BCS $3a09 ; (stage_frame.s35 + 0)
.s5:
39fd : ad f8 3c LDA $3cf8 ; (dirty_count + 0)
3a00 : 8d 15 7d STA $7d15 ; (max_dirty + 0)
3a03 : ad f9 3c LDA $3cf9 ; (dirty_count + 1)
3a06 : 8d 16 7d STA $7d16 ; (max_dirty + 1)
.s35:
3a09 : ad fb 7c LDA $7cfb ; (stepped + 0)
3a0c : d0 0b __ BNE $3a19 ; (stage_frame.s6 + 0)
.s3:
3a0e : a2 04 __ LDX #$04
3a10 : bd f7 bf LDA $bff7,x ; (stage_frame@stack + 0)
3a13 : 95 53 __ STA T2 + 0,x 
3a15 : ca __ __ DEX
3a16 : 10 f8 __ BPL $3a10 ; (stage_frame.s3 + 2)
3a18 : 60 __ __ RTS
.s6:
3a19 : ad f1 3c LDA $3cf1 ; (bird_y + 0)
3a1c : 85 54 __ STA T3 + 0 
3a1e : ad f2 3c LDA $3cf2 ; (bird_y + 1)
3a21 : 4a __ __ LSR
3a22 : 66 54 __ ROR T3 + 0 
3a24 : 4a __ __ LSR
3a25 : 66 54 __ ROR T3 + 0 
3a27 : 4a __ __ LSR
3a28 : 66 54 __ ROR T3 + 0 
3a2a : 4a __ __ LSR
3a2b : 66 54 __ ROR T3 + 0 
3a2d : 4a __ __ LSR
3a2e : 66 54 __ ROR T3 + 0 
3a30 : 4a __ __ LSR
3a31 : 66 54 __ ROR T3 + 0 
3a33 : 4a __ __ LSR
3a34 : 66 54 __ ROR T3 + 0 
3a36 : a9 00 __ LDA #$00
3a38 : 85 55 __ STA T4 + 0 
.l7:
3a3a : 0a __ __ ASL
3a3b : 0a __ __ ASL
3a3c : a8 __ __ TAY
3a3d : b9 ec 3e LDA $3eec,y ; (pipes[0].x + 0)
3a40 : 38 __ __ SEC
3a41 : e9 01 __ SBC #$01
3a43 : aa __ __ TAX
3a44 : b9 ed 3e LDA $3eed,y ; (pipes[0].x + 1)
3a47 : e9 00 __ SBC #$00
3a49 : 30 06 __ BMI $3a51 ; (stage_frame.s21 + 0)
.s34:
3a4b : d0 38 __ BNE $3a85 ; (stage_frame.s8 + 0)
.s33:
3a4d : e0 23 __ CPX #$23
3a4f : b0 34 __ BCS $3a85 ; (stage_frame.s8 + 0)
.s21:
3a51 : b9 ed 3e LDA $3eed,y ; (pipes[0].x + 1)
3a54 : 30 2f __ BMI $3a85 ; (stage_frame.s8 + 0)
.s32:
3a56 : d0 07 __ BNE $3a5f ; (stage_frame.s22 + 0)
.s31:
3a58 : b9 ec 3e LDA $3eec,y ; (pipes[0].x + 0)
3a5b : c9 15 __ CMP #$15
3a5d : 90 26 __ BCC $3a85 ; (stage_frame.s8 + 0)
.s22:
3a5f : b9 ee 3e LDA $3eee,y ; (pipes[0].gap + 0)
3a62 : 85 56 __ STA T5 + 0 
3a64 : a5 54 __ LDA T3 + 0 
3a66 : 85 57 __ STA T6 + 0 
3a68 : 4c 6f 3a JMP $3a6f ; (stage_frame.l23 + 0)
.s27:
3a6b : a5 54 __ LDA T3 + 0 
3a6d : e6 57 __ INC T6 + 0 
.l23:
3a6f : 18 __ __ CLC
3a70 : 69 03 __ ADC #$03
3a72 : 85 43 __ STA T0 + 0 
3a74 : a9 00 __ LDA #$00
3a76 : a6 57 __ LDX T6 + 0 
3a78 : 86 52 __ STX T1 + 0 
3a7a : 6a __ __ ROR
3a7b : 30 04 __ BMI $3a81 ; (stage_frame.s38 + 0)
.s30:
3a7d : e4 43 __ CPX T0 + 0 
3a7f : b0 04 __ BCS $3a85 ; (stage_frame.s8 + 0)
.s38:
3a81 : e0 15 __ CPX #$15
3a83 : 90 63 __ BCC $3ae8 ; (stage_frame.s24 + 0)
.s8:
3a85 : e6 55 __ INC T4 + 0 
3a87 : a5 55 __ LDA T4 + 0 
3a89 : c9 04 __ CMP #$04
3a8b : d0 ad __ BNE $3a3a ; (stage_frame.l7 + 0)
.s9:
3a8d : a9 0c __ LDA #$0c
3a8f : 85 11 __ STA P4 
3a91 : ad 47 6d LDA $6d47 ; (page + 0)
3a94 : 85 52 __ STA T1 + 0 
3a96 : f0 06 __ BEQ $3a9e ; (stage_frame.s20 + 0)
.s10:
3a98 : a9 00 __ LDA #$00
3a9a : 85 0f __ STA P2 
3a9c : f0 06 __ BEQ $3aa4 ; (stage_frame.s11 + 0)
.s20:
3a9e : a9 00 __ LDA #$00
3aa0 : 85 0f __ STA P2 
3aa2 : a9 10 __ LDA #$10
.s11:
3aa4 : 85 10 __ STA P3 
3aa6 : 20 60 2d JSR $2d60 ; (write_cells.s4 + 0)
.l12:
3aa9 : ad 00 d6 LDA $d600 
3aac : 29 20 __ AND #$20
3aae : d0 f9 __ BNE $3aa9 ; (stage_frame.l12 + 0)
.s13:
3ab0 : a9 0c __ LDA #$0c
3ab2 : 8d 00 d6 STA $d600 
3ab5 : a5 52 __ LDA T1 + 0 
3ab7 : 49 01 __ EOR #$01
3ab9 : 8d 47 6d STA $6d47 ; (page + 0)
3abc : f0 06 __ BEQ $3ac4 ; (stage_frame.s15 + 0)
.s14:
3abe : a9 10 __ LDA #$10
3ac0 : a2 01 __ LDX #$01
3ac2 : d0 03 __ BNE $3ac7 ; (stage_frame.l16 + 0)
.s15:
3ac4 : a9 00 __ LDA #$00
3ac6 : aa __ __ TAX
.l16:
3ac7 : 2c 00 d6 BIT $d600 
3aca : 10 fb __ BPL $3ac7 ; (stage_frame.l16 + 0)
.s17:
3acc : 8d 01 d6 STA $d601 
3acf : a9 14 __ LDA #$14
3ad1 : 8d 00 d6 STA $d600 
3ad4 : 8a __ __ TXA
3ad5 : f0 04 __ BEQ $3adb ; (stage_frame.s40 + 0)
.s41:
3ad7 : a9 18 __ LDA #$18
3ad9 : d0 02 __ BNE $3add ; (stage_frame.l18 + 0)
.s40:
3adb : a9 08 __ LDA #$08
.l18:
3add : 2c 00 d6 BIT $d600 
3ae0 : 10 fb __ BPL $3add ; (stage_frame.l18 + 0)
.s19:
3ae2 : 8d 01 d6 STA $d601 
3ae5 : 4c 0e 3a JMP $3a0e ; (stage_frame.s3 + 0)
.s24:
3ae8 : e4 56 __ CPX T5 + 0 
3aea : 90 0f __ BCC $3afb ; (stage_frame.s25 + 0)
.s28:
3aec : a5 56 __ LDA T5 + 0 
3aee : 69 06 __ ADC #$06
3af0 : 90 03 __ BCC $3af5 ; (stage_frame.s29 + 0)
3af2 : 4c 6b 3a JMP $3a6b ; (stage_frame.s27 + 0)
.s29:
3af5 : c5 57 __ CMP T6 + 0 
3af7 : 90 02 __ BCC $3afb ; (stage_frame.s25 + 0)
.s39:
3af9 : d0 f7 __ BNE $3af2 ; (stage_frame.s28 + 6)
.s25:
3afb : 06 52 __ ASL T1 + 0 
3afd : a9 1e __ LDA #$1e
3aff : 85 53 __ STA T2 + 0 
.l26:
3b01 : a6 52 __ LDX T1 + 0 
3b03 : bd a5 55 LDA $55a5,x ; (row_addr[0] + 0)
3b06 : 18 __ __ CLC
3b07 : 65 53 __ ADC T2 + 0 
3b09 : a8 __ __ TAY
3b0a : bd a6 55 LDA $55a6,x ; (row_addr[0] + 1)
3b0d : 69 00 __ ADC #$00
3b0f : aa __ __ TAX
3b10 : 98 __ __ TYA
3b11 : 20 89 32 JSR $3289 ; (hidden_stale.s4 + 0)
3b14 : e6 53 __ INC T2 + 0 
3b16 : a5 53 __ LDA T2 + 0 
3b18 : c9 23 __ CMP #$23
3b1a : d0 e5 __ BNE $3b01 ; (stage_frame.l26 + 0)
3b1c : 4c 6b 3a JMP $3a6b ; (stage_frame.s27 + 0)
--------------------------------------------------------------------
restore_vdc: ; restore_vdc()->void
; 787, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
3b1f : a2 1e __ LDX #$1e
.l5:
3b21 : ca __ __ DEX
3b22 : e0 10 __ CPX #$10
3b24 : f0 fb __ BEQ $3b21 ; (restore_vdc.l5 + 0)
.s6:
3b26 : e0 11 __ CPX #$11
3b28 : f0 f7 __ BEQ $3b21 ; (restore_vdc.l5 + 0)
.s7:
3b2a : 8a __ __ TXA
3b2b : a8 __ __ TAY
3b2c : bd 00 3f LDA $3f00,x ; (saved_regs[0] + 0)
3b2f : 8c 00 d6 STY $d600 
.l8:
3b32 : 2c 00 d6 BIT $d600 
3b35 : 10 fb __ BPL $3b32 ; (restore_vdc.l8 + 0)
.s9:
3b37 : 8d 01 d6 STA $d601 
3b3a : 98 __ __ TYA
3b3b : d0 e4 __ BNE $3b21 ; (restore_vdc.l5 + 0)
.s3:
3b3d : 60 __ __ RTS
--------------------------------------------------------------------
sound_off: ; sound_off()->void
;  13, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3b3e : a9 00 __ LDA #$00
3b40 : 8d 04 d4 STA $d404 
3b43 : 8d 0b d4 STA $d40b 
3b46 : 8d 12 d4 STA $d412 
3b49 : 8d 18 d4 STA $d418 
.s3:
3b4c : 60 __ __ RTS
--------------------------------------------------------------------
putch: ; putch(u8)->void
;  89, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/conio.h"
.s4:
3b4d : aa __ __ TAX
3b4e : ad a2 3c LDA $3ca2 ; (giocharmap + 0)
3b51 : f0 2c __ BEQ $3b7f ; (putch.s7 + 0)
.s5:
3b53 : e0 0a __ CPX #$0a
3b55 : d0 05 __ BNE $3b5c ; (putch.s8 + 0)
.s6:
3b57 : a9 0d __ LDA #$0d
.s18:
3b59 : 4c d2 ff JMP $ffd2 
.s8:
3b5c : e0 09 __ CPX #$09
3b5e : f0 29 __ BEQ $3b89 ; (putch.s9 + 0)
.s11:
3b60 : c9 02 __ CMP #$02
3b62 : 90 1b __ BCC $3b7f ; (putch.s7 + 0)
.s12:
3b64 : e0 41 __ CPX #$41
3b66 : 90 17 __ BCC $3b7f ; (putch.s7 + 0)
.s13:
3b68 : e0 7b __ CPX #$7b
3b6a : b0 13 __ BCS $3b7f ; (putch.s7 + 0)
.s14:
3b6c : 8a __ __ TXA
3b6d : e0 61 __ CPX #$61
3b6f : b0 04 __ BCS $3b75 ; (putch.s15 + 0)
.s17:
3b71 : c9 5b __ CMP #$5b
3b73 : b0 0a __ BCS $3b7f ; (putch.s7 + 0)
.s15:
3b75 : 49 20 __ EOR #$20
3b77 : aa __ __ TAX
3b78 : ad a2 3c LDA $3ca2 ; (giocharmap + 0)
3b7b : c9 02 __ CMP #$02
3b7d : f0 04 __ BEQ $3b83 ; (putch.s16 + 0)
.s7:
3b7f : 8a __ __ TXA
3b80 : 4c 59 3b JMP $3b59 ; (putch.s18 + 0)
.s16:
3b83 : 8a __ __ TXA
3b84 : 29 5f __ AND #$5f
3b86 : 4c 59 3b JMP $3b59 ; (putch.s18 + 0)
.s9:
3b89 : a5 ec __ LDA $ec 
3b8b : 29 03 __ AND #$03
3b8d : a8 __ __ TAY
.l10:
3b8e : a9 20 __ LDA #$20
3b90 : 20 d2 ff JSR $ffd2 
3b93 : c8 __ __ INY
3b94 : c0 04 __ CPY #$04
3b96 : 90 f6 __ BCC $3b8e ; (putch.l10 + 0)
.s3:
3b98 : 60 __ __ RTS
--------------------------------------------------------------------
3b99 : __ __ __ BYT 54 48 41 4e 4b 20 59 4f 55 00                   : THANK YOU.
--------------------------------------------------------------------
mul16by8: ; mul16by8
3ba3 : 4a __ __ LSR
3ba4 : f0 2e __ BEQ $3bd4 ; (mul16by8 + 49)
3ba6 : a2 00 __ LDX #$00
3ba8 : a0 00 __ LDY #$00
3baa : 90 13 __ BCC $3bbf ; (mul16by8 + 28)
3bac : a4 1b __ LDY ACCU + 0 
3bae : a6 1c __ LDX ACCU + 1 
3bb0 : b0 0d __ BCS $3bbf ; (mul16by8 + 28)
3bb2 : 85 02 __ STA $02 
3bb4 : 18 __ __ CLC
3bb5 : 98 __ __ TYA
3bb6 : 65 1b __ ADC ACCU + 0 
3bb8 : a8 __ __ TAY
3bb9 : 8a __ __ TXA
3bba : 65 1c __ ADC ACCU + 1 
3bbc : aa __ __ TAX
3bbd : a5 02 __ LDA $02 
3bbf : 06 1b __ ASL ACCU + 0 
3bc1 : 26 1c __ ROL ACCU + 1 
3bc3 : 4a __ __ LSR
3bc4 : 90 f9 __ BCC $3bbf ; (mul16by8 + 28)
3bc6 : d0 ea __ BNE $3bb2 ; (mul16by8 + 15)
3bc8 : 18 __ __ CLC
3bc9 : 98 __ __ TYA
3bca : 65 1b __ ADC ACCU + 0 
3bcc : 85 1b __ STA ACCU + 0 
3bce : 8a __ __ TXA
3bcf : 65 1c __ ADC ACCU + 1 
3bd1 : 85 1c __ STA ACCU + 1 
3bd3 : 60 __ __ RTS
3bd4 : b0 04 __ BCS $3bda ; (mul16by8 + 55)
3bd6 : 85 1b __ STA ACCU + 0 
3bd8 : 85 1c __ STA ACCU + 1 
3bda : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
3bdb : a5 1c __ LDA ACCU + 1 
3bdd : d0 3b __ BNE $3c1a ; (divmod + 63)
3bdf : a5 04 __ LDA WORK + 1 
3be1 : d0 1e __ BNE $3c01 ; (divmod + 38)
3be3 : 85 06 __ STA WORK + 3 
3be5 : a2 04 __ LDX #$04
3be7 : 06 1b __ ASL ACCU + 0 
3be9 : 2a __ __ ROL
3bea : c5 03 __ CMP WORK + 0 
3bec : 90 02 __ BCC $3bf0 ; (divmod + 21)
3bee : e5 03 __ SBC WORK + 0 
3bf0 : 26 1b __ ROL ACCU + 0 
3bf2 : 2a __ __ ROL
3bf3 : c5 03 __ CMP WORK + 0 
3bf5 : 90 02 __ BCC $3bf9 ; (divmod + 30)
3bf7 : e5 03 __ SBC WORK + 0 
3bf9 : 26 1b __ ROL ACCU + 0 
3bfb : ca __ __ DEX
3bfc : d0 eb __ BNE $3be9 ; (divmod + 14)
3bfe : 85 05 __ STA WORK + 2 
3c00 : 60 __ __ RTS
3c01 : a5 1b __ LDA ACCU + 0 
3c03 : 85 05 __ STA WORK + 2 
3c05 : a5 1c __ LDA ACCU + 1 
3c07 : 85 06 __ STA WORK + 3 
3c09 : a9 00 __ LDA #$00
3c0b : 85 1b __ STA ACCU + 0 
3c0d : 85 1c __ STA ACCU + 1 
3c0f : 60 __ __ RTS
3c10 : 85 03 __ STA WORK + 0 
3c12 : a9 00 __ LDA #$00
3c14 : 85 04 __ STA WORK + 1 
3c16 : a5 1c __ LDA ACCU + 1 
3c18 : f0 c9 __ BEQ $3be3 ; (divmod + 8)
3c1a : a5 04 __ LDA WORK + 1 
3c1c : d0 1f __ BNE $3c3d ; (divmod + 98)
3c1e : a5 03 __ LDA WORK + 0 
3c20 : 30 1b __ BMI $3c3d ; (divmod + 98)
3c22 : a9 00 __ LDA #$00
3c24 : 85 06 __ STA WORK + 3 
3c26 : a2 10 __ LDX #$10
3c28 : 06 1b __ ASL ACCU + 0 
3c2a : 26 1c __ ROL ACCU + 1 
3c2c : 2a __ __ ROL
3c2d : c5 03 __ CMP WORK + 0 
3c2f : 90 02 __ BCC $3c33 ; (divmod + 88)
3c31 : e5 03 __ SBC WORK + 0 
3c33 : 26 1b __ ROL ACCU + 0 
3c35 : 26 1c __ ROL ACCU + 1 
3c37 : ca __ __ DEX
3c38 : d0 f2 __ BNE $3c2c ; (divmod + 81)
3c3a : 85 05 __ STA WORK + 2 
3c3c : 60 __ __ RTS
3c3d : a9 00 __ LDA #$00
3c3f : 85 05 __ STA WORK + 2 
3c41 : 85 06 __ STA WORK + 3 
3c43 : a0 10 __ LDY #$10
3c45 : 18 __ __ CLC
3c46 : 26 1b __ ROL ACCU + 0 
3c48 : 26 1c __ ROL ACCU + 1 
3c4a : 26 05 __ ROL WORK + 2 
3c4c : 26 06 __ ROL WORK + 3 
3c4e : 38 __ __ SEC
3c4f : a5 05 __ LDA WORK + 2 
3c51 : e5 03 __ SBC WORK + 0 
3c53 : aa __ __ TAX
3c54 : a5 06 __ LDA WORK + 3 
3c56 : e5 04 __ SBC WORK + 1 
3c58 : 90 04 __ BCC $3c5e ; (divmod + 131)
3c5a : 86 05 __ STX WORK + 2 
3c5c : 85 06 __ STA WORK + 3 
3c5e : 88 __ __ DEY
3c5f : d0 e5 __ BNE $3c46 ; (divmod + 107)
3c61 : 26 1b __ ROL ACCU + 0 
3c63 : 26 1c __ ROL ACCU + 1 
3c65 : 60 __ __ RTS
--------------------------------------------------------------------
__multab60L:
3c66 : __ __ __ BYT 00 3c 78                                        : .<x
--------------------------------------------------------------------
__multab5L:
3c69 : __ __ __ BYT 00 05 0a 0f 14 19 1e 23 28 2d 32 37             : .......#(-27
--------------------------------------------------------------------
__multab8192L:
3c75 : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
__multab8192H:
3c7a : __ __ __ BYT 00 20 40 60 80                                  : . @`.
--------------------------------------------------------------------
__multab7L:
3c7f : __ __ __ BYT 00 07 0e                                        : ...
--------------------------------------------------------------------
__shltab1023L:
3c82 : __ __ __ BYT ff fe fc f8 f0 e0 c0 80 00 00                   : ..........
--------------------------------------------------------------------
__shltab1023H:
3c8c : __ __ __ BYT 03 07 0f 1f 3f 7f ff ff ff fe                   : ....?.....
--------------------------------------------------------------------
panel_text@proxy: ; panel_text@proxy
3c96 : a5 1b __ LDA ACCU + 0 
3c98 : 85 12 __ STA P5 
3c9a : a5 1c __ LDA ACCU + 1 
3c9c : 85 13 __ STA P6 
3c9e : 4c ce 28 JMP $28ce ; (panel_text.s4 + 0)
--------------------------------------------------------------------
spentry:
3ca1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
3ca2 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
round:
3ca3 : __ __ __ BYT 0f 3f 7f 7f ff ff ff ff                         : .?......
--------------------------------------------------------------------
stripe:
3cab : __ __ __ BYT f0 78 3c 1e 0f 87 c3 e1                         : .x<.....
--------------------------------------------------------------------
random_state:
3cb3 : __ __ __ BYT e1 ac                                           : ..
--------------------------------------------------------------------
flap:
3cb5 : __ __ __ BYT 00 01 02 01                                     : ....
--------------------------------------------------------------------
bird_row:
3cb9 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
shown_row:
3cba : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
bird_colours:
3cbb : __ __ __ BYT 0d 0d 0d 0f 09                                  : .....
--------------------------------------------------------------------
pipe_tiles:
3cc0 : __ __ __ BYT 20 0a 0b 0b 0b 0b 0b 0c 20 20 20 0d 0e 0f 0f 0f :  .......   .....
3cd0 : __ __ __ BYT 0f 0f 0f 10 20 20                               : ....  
--------------------------------------------------------------------
cap_attr:
3cd6 : __ __ __ BYT 05 05 05 05 05 05 05 05 05 04 04                : ...........
--------------------------------------------------------------------
timer:
3ce1 : __ __ __ BSS	3
--------------------------------------------------------------------
set_pose:
3ce4 : __ __ __ BSS	8
--------------------------------------------------------------------
state:
3cec : __ __ __ BSS	1
--------------------------------------------------------------------
score:
3ced : __ __ __ BSS	2
--------------------------------------------------------------------
velocity:
3cef : __ __ __ BSS	2
--------------------------------------------------------------------
bird_y:
3cf1 : __ __ __ BSS	2
--------------------------------------------------------------------
phase:
3cf3 : __ __ __ BSS	1
--------------------------------------------------------------------
speed:
3cf4 : __ __ __ BSS	1
--------------------------------------------------------------------
scroll:
3cf5 : __ __ __ BSS	1
--------------------------------------------------------------------
redrawn:
3cf6 : __ __ __ BSS	1
--------------------------------------------------------------------
bird_stale:
3cf7 : __ __ __ BSS	1
--------------------------------------------------------------------
dirty_count:
3cf8 : __ __ __ BSS	2
--------------------------------------------------------------------
front_count:
3cfa : __ __ __ BSS	2
--------------------------------------------------------------------
best:
3cfc : __ __ __ BSS	2
--------------------------------------------------------------------
frame_count:
3cfe : __ __ __ BSS	2
--------------------------------------------------------------------
letters:
3d00 : __ __ __ BYT 0e 11 13 15 19 11 0e 04 0c 04 04 04 04 0e 0e 11 : ................
3d10 : __ __ __ BYT 01 02 04 08 1f 1e 01 01 0e 01 01 1e 02 06 0a 12 : ................
3d20 : __ __ __ BYT 1f 02 02 1f 10 10 1e 01 01 1e 0e 10 10 1e 11 11 : ................
3d30 : __ __ __ BYT 0e 1f 01 02 04 08 08 08 0e 11 11 0e 11 11 0e 0e : ................
3d40 : __ __ __ BYT 11 11 0f 01 01 0e 0e 11 11 1f 11 11 11 1e 11 11 : ................
3d50 : __ __ __ BYT 1e 11 11 1e 0e 11 10 10 10 11 0e 1e 11 11 11 11 : ................
3d60 : __ __ __ BYT 11 1e 1f 10 10 1e 10 10 1f 1f 10 10 1e 10 10 10 : ................
3d70 : __ __ __ BYT 0e 11 10 17 11 11 0f 11 11 11 1f 11 11 11 0e 04 : ................
3d80 : __ __ __ BYT 04 04 04 04 0e 07 02 02 02 02 12 0c 11 12 14 18 : ................
3d90 : __ __ __ BYT 14 12 11 10 10 10 10 10 10 1f 11 1b 15 15 11 11 : ................
3da0 : __ __ __ BYT 11 11 19 15 13 11 11 11 0e 11 11 11 11 11 0e 1e : ................
3db0 : __ __ __ BYT 11 11 1e 10 10 10 0e 11 11 11 15 12 0d 1e 11 11 : ................
3dc0 : __ __ __ BYT 1e 14 12 11 0f 10 10 0e 01 01 1e 1f 04 04 04 04 : ................
3dd0 : __ __ __ BYT 04 04 11 11 11 11 11 11 0e 11 11 11 11 11 0a 04 : ................
3de0 : __ __ __ BYT 11 11 11 15 15 15 0a 11 11 0a 04 0a 11 11 11 11 : ................
3df0 : __ __ __ BYT 0a 04 04 04 04 1f 01 02 04 08 10 1f             : ............
--------------------------------------------------------------------
bird_pose:
3dfc : __ __ __ BSS	1
--------------------------------------------------------------------
shown_set:
3dfd : __ __ __ BSS	1
--------------------------------------------------------------------
bird_set:
3dfe : __ __ __ BSS	1
--------------------------------------------------------------------
panel_y:
3dff : __ __ __ BSS	1
--------------------------------------------------------------------
bird_art:
3e00 : __ __ __ BYT 00 1f ff fc 00 01 ff ff fe 00 0c 07 ff f1 00 30 : ...............0
3e10 : __ __ __ BYT 01 ff f1 00 70 01 ff ff 00 fc 07 ff fe 00 ff ff : ....p...........
3e20 : __ __ __ BYT ff 00 fe ff ff ff ff ff 7f ff ff fe 00 3f ff ff : .............?..
3e30 : __ __ __ BYT fc fc 0f ff ff f0 f0 00 ff ff 00 00 00 1f ff fc : ................
3e40 : __ __ __ BYT 00 01 ff ff fe 00 0f ff ff f1 00 3f ff ff f1 00 : ...........?....
3e50 : __ __ __ BYT 78 03 ff ff 00 e0 00 ff fe 00 e0 00 ff 00 fe f8 : x...............
3e60 : __ __ __ BYT 03 ff ff ff 7f ff ff fe 00 3f ff ff fc fc 0f ff : .........?......
3e70 : __ __ __ BYT ff f0 f0 00 ff ff 00 00 00 1f ff fc 00 01 ff ff : ................
3e80 : __ __ __ BYT fe 00 0f ff ff f1 00 3f ff ff f1 00 7f ff ff ff : .......?........
3e90 : __ __ __ BYT 00 ff ff ff fe 00 f8 03 ff 00 fe e0 00 ff ff ff : ................
3ea0 : __ __ __ BYT 60 00 ff fe 00 30 01 ff fc fc 0c 07 ff f0 f0 00 : `....0..........
3eb0 : __ __ __ BYT 1f ff 00 00                                     : ....
--------------------------------------------------------------------
bitshift:
3eb4 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
3ec4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ed4 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
3ee4 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
pipes:
3eec : __ __ __ BSS	16
--------------------------------------------------------------------
show_time:
3efc : __ __ __ BSS	2
--------------------------------------------------------------------
flash:
3efe : __ __ __ BSS	1
--------------------------------------------------------------------
flip:
3eff : __ __ __ BSS	1
--------------------------------------------------------------------
saved_regs:
3f00 : __ __ __ BSS	37
--------------------------------------------------------------------
saved_font:
3f25 : __ __ __ BSS	3840
--------------------------------------------------------------------
shapes:
4e25 : __ __ __ BSS	1920
--------------------------------------------------------------------
row_addr:
55a5 : __ __ __ BSS	50
--------------------------------------------------------------------
screen:
55d7 : __ __ __ BSS	2000
--------------------------------------------------------------------
attr:
5da7 : __ __ __ BSS	2000
--------------------------------------------------------------------
marked:
6577 : __ __ __ BSS	2000
--------------------------------------------------------------------
page:
6d47 : __ __ __ BSS	1
--------------------------------------------------------------------
dirty:
6d48 : __ __ __ BSS	4000
--------------------------------------------------------------------
line:
7ce8 : __ __ __ BSS	11
--------------------------------------------------------------------
copy_src:
7cf3 : __ __ __ BSS	2
--------------------------------------------------------------------
copy_dst:
7cf5 : __ __ __ BSS	2
--------------------------------------------------------------------
blank_overruns:
7cf7 : __ __ __ BSS	2
--------------------------------------------------------------------
prerendered:
7cf9 : __ __ __ BSS	1
--------------------------------------------------------------------
previous_keys:
7cfa : __ __ __ BSS	1
--------------------------------------------------------------------
stepped:
7cfb : __ __ __ BSS	1
--------------------------------------------------------------------
death_delay:
7cfc : __ __ __ BSS	1
--------------------------------------------------------------------
wave:
7cfd : __ __ __ BSS	3
--------------------------------------------------------------------
freq:
7d00 : __ __ __ BSS	6
--------------------------------------------------------------------
step:
7d06 : __ __ __ BSS	6
--------------------------------------------------------------------
jump_at:
7d0c : __ __ __ BSS	3
--------------------------------------------------------------------
jump_freq:
7d0f : __ __ __ BSS	6
--------------------------------------------------------------------
max_dirty:
7d15 : __ __ __ BSS	2
