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
1c13 : 8e eb 3c STX $3ceb ; (spentry + 0)
1c16 : a2 3f __ LDX #$3f
1c18 : a0 38 __ LDY #$38
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
1c2f : c0 65 __ CPY #$65
1c31 : d0 f9 __ BNE $1c2c ; (startup + 43)
1c33 : a9 00 __ LDA #$00
1c35 : a2 f7 __ LDX #$f7
1c37 : d0 03 __ BNE $1c3c ; (startup + 59)
1c39 : 95 00 __ STA $00,x 
1c3b : e8 __ __ INX
1c3c : e0 f7 __ CPX #$f7
1c3e : d0 f9 __ BNE $1c39 ; (startup + 56)
1c40 : a9 d2 __ LDA #$d2
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
; 818, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
1c80 : a2 0b __ LDX #$0b
1c82 : b5 53 __ LDA T1 + 0,x 
1c84 : 9d d4 bf STA $bfd4,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1 + 2)
.s4:
1c8a : a9 01 __ LDA #$01
1c8c : 8d ec 3c STA $3cec ; (giocharmap + 0)
1c8f : 20 9f 20 JSR $209f ; (dispmode80col.s4 + 0)
1c92 : a9 01 __ LDA #$01
1c94 : 85 cc __ STA $cc 
1c96 : 20 a7 20 JSR $20a7 ; (sound_init.s4 + 0)
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
1cdb : 8d de 3e STA $3ede ; (set_pose[0][0] + 0)
1cde : 8d df 3e STA $3edf ; (set_pose[0][0] + 1)
1ce1 : 8d e0 3e STA $3ee0 ; (set_pose[0][0] + 2)
1ce4 : 8d e1 3e STA $3ee1 ; (set_pose[0][0] + 3)
1ce7 : 8d e2 3e STA $3ee2 ; (set_pose[0][0] + 4)
1cea : 8d e3 3e STA $3ee3 ; (set_pose[0][0] + 5)
1ced : 8d e4 3e STA $3ee4 ; (set_pose[0][0] + 6)
1cf0 : 8d e5 3e STA $3ee5 ; (set_pose[0][0] + 7)
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
1d05 : 9d 38 3f STA $3f38,x ; (saved_regs[0] + 0)
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
1d20 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
1d23 : a9 5d __ LDA #$5d
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
1d4b : ad 54 3f LDA $3f54 ; (saved_regs[0] + 28)
1d4e : 29 0f __ AND #$0f
1d50 : 09 30 __ ORA #$30
1d52 : 85 56 __ STA T4 + 0 
.l14:
1d54 : 2c 00 d6 BIT $d600 
1d57 : 10 fb __ BPL $1d54 ; (main.l14 + 0)
.s15:
1d59 : 8d 01 d6 STA $d601 
1d5c : 20 11 21 JSR $2111 ; (make_shapes.s4 + 0)
1d5f : 20 7a 22 JSR $227a ; (make_poses.s4 + 0)
1d62 : a9 00 __ LDA #$00
1d64 : a2 20 __ LDX #$20
1d66 : 86 58 __ STX T5 + 1 
1d68 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
1d6b : a9 00 __ LDA #$00
1d6d : 85 5e __ STA T13 + 0 
.l16:
1d6f : 20 f4 22 JSR $22f4 ; (pipe_shapes.s4 + 0)
1d72 : a9 00 __ LDA #$00
1d74 : a6 58 __ LDX T5 + 1 
1d76 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
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
1d8a : a9 5d __ LDA #$5d
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
1f0c : 9d 00 56 STA $5600,x ; (row_addr[0] + 0)
1f0f : 18 __ __ CLC
1f10 : 69 50 __ ADC #$50
1f12 : a8 __ __ TAY
1f13 : a5 54 __ LDA T1 + 1 
1f15 : 9d 01 56 STA $5601,x ; (row_addr[0] + 1)
1f18 : 69 00 __ ADC #$00
1f1a : 85 54 __ STA T1 + 1 
1f1c : e8 __ __ INX
1f1d : e8 __ __ INX
1f1e : e0 32 __ CPX #$32
1f20 : d0 e9 __ BNE $1f0b ; (main.l105 + 0)
.s70:
1f22 : a9 00 __ LDA #$00
1f24 : 85 56 __ STA T4 + 0 
1f26 : 8d e6 3e STA $3ee6 ; (state + 0)
1f29 : 20 dd 23 JSR $23dd ; (reset_game.s4 + 0)
1f2c : 20 d5 27 JSR $27d5 ; (banner.s4 + 0)
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
1f41 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
1f44 : a9 56 __ LDA #$56
1f46 : 85 44 __ STA T0 + 1 
1f48 : a0 32 __ LDY #$32
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
1f59 : c0 02 __ CPY #$02
1f5b : d0 ed __ BNE $1f4a ; (main.l74 + 0)
.s101:
1f5d : a5 44 __ LDA T0 + 1 
1f5f : c9 5e __ CMP #$5e
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
1f6f : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
1f72 : a9 5e __ LDA #$5e
1f74 : 85 44 __ STA T0 + 1 
1f76 : a0 02 __ LDY #$02
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
1f87 : c0 d2 __ CPY #$d2
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
1fab : a9 d2 __ LDA #$d2
1fad : 85 0d __ STA P0 
1faf : 20 f2 29 JSR $29f2 ; (memset.s4 + 0)
1fb2 : a9 00 __ LDA #$00
1fb4 : 8d df 55 STA $55df ; (dirty_count + 0)
1fb7 : 8d e0 55 STA $55e0 ; (dirty_count + 1)
1fba : 8d dd 55 STA $55dd ; (redrawn + 0)
1fbd : 20 0e 2a JSR $2a0e ; (wait_frame.s4 + 0)
1fc0 : 20 55 2a JSR $2a55 ; (show_frame.s1 + 0)
1fc3 : a9 22 __ LDA #$22
1fc5 : 8d 00 d6 STA $d600 
1fc8 : ad 5a 3f LDA $3f5a ; (saved_regs[0] + 34)
1fcb : 85 56 __ STA T4 + 0 
.l83:
1fcd : 2c 00 d6 BIT $d600 
1fd0 : 10 fb __ BPL $1fcd ; (main.l83 + 0)
.s84:
1fd2 : 8d 01 d6 STA $d601 
1fd5 : 4c ec 1f JMP $1fec ; (main.l85 + 0)
.s99:
1fd8 : 20 13 33 JSR $3313 ; (prepare_frame.s1 + 0)
1fdb : ad 46 7d LDA $7d46 ; (frame_ticks + 0)
1fde : 85 0e __ STA P1 
1fe0 : 20 68 39 JSR $3968 ; (sound_tick.s4 + 0)
1fe3 : 20 27 3a JSR $3a27 ; (stage_frame.s1 + 0)
1fe6 : 20 0e 2a JSR $2a0e ; (wait_frame.s4 + 0)
1fe9 : 20 55 2a JSR $2a55 ; (show_frame.s1 + 0)
.l85:
1fec : 20 d7 32 JSR $32d7 ; (keys.s4 + 0)
1fef : 85 18 __ STA P11 
1ff1 : 29 10 __ AND #$10
1ff3 : f0 e3 __ BEQ $1fd8 ; (main.s99 + 0)
.s86:
1ff5 : a9 22 __ LDA #$22
1ff7 : 8d 00 d6 STA $d600 
.l87:
1ffa : 2c 00 d6 BIT $d600 
1ffd : 10 fb __ BPL $1ffa ; (main.l87 + 0)
.s88:
1fff : a9 80 __ LDA #$80
2001 : 8d 01 d6 STA $d601 
2004 : a9 1c __ LDA #$1c
2006 : 8d 00 d6 STA $d600 
2009 : ad 54 3f LDA $3f54 ; (saved_regs[0] + 28)
.l89:
200c : 2c 00 d6 BIT $d600 
200f : 10 fb __ BPL $200c ; (main.l89 + 0)
.s90:
2011 : 8d 01 d6 STA $d601 
2014 : a9 00 __ LDA #$00
2016 : 85 43 __ STA T0 + 0 
2018 : a2 20 __ LDX #$20
201a : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
201d : a9 3f __ LDA #$3f
201f : 85 44 __ STA T0 + 1 
2021 : a0 5d __ LDY #$5d
.l91:
2023 : b1 43 __ LDA (T0 + 0),y 
.l92:
2025 : 2c 00 d6 BIT $d600 
2028 : 10 fb __ BPL $2025 ; (main.l92 + 0)
.s93:
202a : 8d 01 d6 STA $d601 
202d : c8 __ __ INY
202e : d0 02 __ BNE $2032 ; (main.s117 + 0)
.s116:
2030 : e6 44 __ INC T0 + 1 
.s117:
2032 : c0 5d __ CPY #$5d
2034 : d0 ed __ BNE $2023 ; (main.l91 + 0)
.s98:
2036 : a5 44 __ LDA T0 + 1 
2038 : c9 4e __ CMP #$4e
203a : d0 e7 __ BNE $2023 ; (main.l91 + 0)
.s94:
203c : 20 69 3b JSR $3b69 ; (restore_vdc.s4 + 0)
203f : a9 22 __ LDA #$22
2041 : 8d 00 d6 STA $d600 
.l95:
2044 : 2c 00 d6 BIT $d600 
2047 : 10 fb __ BPL $2044 ; (main.l95 + 0)
.s96:
2049 : a5 56 __ LDA T4 + 0 
204b : 8d 01 d6 STA $d601 
204e : 20 88 3b JSR $3b88 ; (sound_off.s4 + 0)
2051 : a5 5a __ LDA T9 + 0 
2053 : 8d 00 dc STA $dc00 
2056 : a5 5b __ LDA T10 + 0 
2058 : 8d 02 dc STA $dc02 
205b : a5 5c __ LDA T11 + 0 
205d : 8d 03 dc STA $dc03 
2060 : a5 59 __ LDA T8 + 0 
2062 : 8d 30 d0 STA $d030 
2065 : a5 55 __ LDA T3 + 0 
2067 : 8d 11 d0 STA $d011 
206a : a5 5d __ LDA T12 + 0 
206c : 8d 0e dd STA $dd0e 
206f : 58 __ __ CLI
2070 : a9 93 __ LDA #$93
2072 : 20 d2 ff JSR $ffd2 
2075 : a0 23 __ LDY #$23
2077 : a2 0a __ LDX #$0a
2079 : 18 __ __ CLC
207a : 20 f0 ff JSR $fff0 
207d : a2 00 __ LDX #$00
.l104:
207f : 86 53 __ STX T1 + 0 
2081 : bd e3 3b LDA $3be3,x 
2084 : 20 97 3b JSR $3b97 ; (putch.s4 + 0)
2087 : a6 53 __ LDX T1 + 0 
2089 : e8 __ __ INX
208a : e0 09 __ CPX #$09
208c : 90 f1 __ BCC $207f ; (main.l104 + 0)
.s97:
208e : a9 00 __ LDA #$00
2090 : 85 1b __ STA ACCU + 0 
2092 : 85 1c __ STA ACCU + 1 
.s3:
2094 : a2 0b __ LDX #$0b
2096 : bd d4 bf LDA $bfd4,x ; (main@stack + 0)
2099 : 95 53 __ STA T1 + 0,x 
209b : ca __ __ DEX
209c : 10 f8 __ BPL $2096 ; (main.s3 + 2)
209e : 60 __ __ RTS
--------------------------------------------------------------------
dispmode80col: ; dispmode80col()->void
;  23, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/conio.h"
.s4:
209f : 24 d7 __ BIT $d7 
20a1 : 10 01 __ BPL $20a4 ; (dispmode80col.s5 + 0)
.s3:
20a3 : 60 __ __ RTS
.s5:
20a4 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
sound_init: ; sound_init()->void
;  11, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
20a7 : a9 00 __ LDA #$00
20a9 : 8d db 3e STA $3edb ; (timer[0] + 0)
20ac : 8d dc 3e STA $3edc ; (timer[0] + 1)
20af : 8d dd 3e STA $3edd ; (timer[0] + 2)
20b2 : a2 0f __ LDX #$0f
20b4 : 8e 18 d4 STX $d418 
20b7 : 8d 04 d4 STA $d404 
20ba : 8d 02 d4 STA $d402 
20bd : a2 08 __ LDX #$08
20bf : 8e 03 d4 STX $d403 
20c2 : 8d 0b d4 STA $d40b 
20c5 : 8d 09 d4 STA $d409 
20c8 : 8e 0a d4 STX $d40a 
20cb : 8d 12 d4 STA $d412 
20ce : 8d 10 d4 STA $d410 
20d1 : 8e 11 d4 STX $d411 
20d4 : a9 35 __ LDA #$35
20d6 : 8d 05 d4 STA $d405 
20d9 : a9 02 __ LDA #$02
20db : 8d 06 d4 STA $d406 
20de : a9 09 __ LDA #$09
20e0 : 8d 0c d4 STA $d40c 
20e3 : a9 0a __ LDA #$0a
20e5 : 8d 0d d4 STA $d40d 
20e8 : 8e 13 d4 STX $d413 
20eb : a9 89 __ LDA #$89
20ed : 8d 14 d4 STA $d414 
.s3:
20f0 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
;  76, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/c128/vdc.h"
.s4:
20f1 : a0 12 __ LDY #$12
20f3 : 8c 00 d6 STY $d600 
.l5:
20f6 : 2c 00 d6 BIT $d600 
20f9 : 10 fb __ BPL $20f6 ; (vdc_mem_addr.l5 + 0)
.s6:
20fb : 8e 01 d6 STX $d601 
20fe : a2 13 __ LDX #$13
2100 : 8e 00 d6 STX $d600 
.l7:
2103 : 2c 00 d6 BIT $d600 
2106 : 10 fb __ BPL $2103 ; (vdc_mem_addr.l7 + 0)
.s8:
2108 : 8d 01 d6 STA $d601 
210b : a9 1f __ LDA #$1f
210d : 8d 00 d6 STA $d600 
.s3:
2110 : 60 __ __ RTS
--------------------------------------------------------------------
make_shapes: ; make_shapes()->void
; 235, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2111 : a9 00 __ LDA #$00
2113 : 85 43 __ STA T2 + 0 
.l5:
2115 : a9 ff __ LDA #$ff
2117 : a4 43 __ LDY T2 + 0 
2119 : 99 5d 4e STA $4e5d,y ; (shapes[0][0] + 0)
211c : a9 7f __ LDA #$7f
211e : 99 65 4e STA $4e65,y ; (shapes[0][0] + 8)
2121 : a9 fe __ LDA #$fe
2123 : 99 95 4e STA $4e95,y ; (shapes[0][0] + 56)
2126 : c0 01 __ CPY #$01
2128 : d0 04 __ BNE $212e ; (make_shapes.s30 + 0)
.s6:
212a : a9 00 __ LDA #$00
212c : f0 02 __ BEQ $2130 ; (make_shapes.s34 + 0)
.s30:
212e : a9 ff __ LDA #$ff
.s34:
2130 : 99 6d 4e STA $4e6d,y ; (shapes[0][0] + 16)
2133 : a9 00 __ LDA #$00
2135 : c5 43 __ CMP T2 + 0 
2137 : 6a __ __ ROR
2138 : aa __ __ TAX
2139 : d0 04 __ BNE $213f ; (make_shapes.s7 + 0)
.s28:
213b : c0 07 __ CPY #$07
213d : d0 04 __ BNE $2143 ; (make_shapes.s29 + 0)
.s7:
213f : a9 7f __ LDA #$7f
2141 : d0 02 __ BNE $2145 ; (make_shapes.s35 + 0)
.s29:
2143 : a9 60 __ LDA #$60
.s35:
2145 : 99 75 4e STA $4e75,y ; (shapes[0][0] + 24)
2148 : 8a __ __ TXA
2149 : 30 04 __ BMI $214f ; (make_shapes.s8 + 0)
.s26:
214b : c0 07 __ CPY #$07
214d : d0 04 __ BNE $2153 ; (make_shapes.s27 + 0)
.s8:
214f : a9 fe __ LDA #$fe
2151 : d0 02 __ BNE $2155 ; (make_shapes.s36 + 0)
.s27:
2153 : a9 06 __ LDA #$06
.s36:
2155 : 99 7d 4e STA $4e7d,y ; (shapes[0][0] + 32)
2158 : e6 43 __ INC T2 + 0 
215a : a5 43 __ LDA T2 + 0 
215c : c9 08 __ CMP #$08
215e : 90 b5 __ BCC $2115 ; (make_shapes.l5 + 0)
.s9:
2160 : a9 00 __ LDA #$00
2162 : 85 1c __ STA ACCU + 1 
2164 : 85 1b __ STA ACCU + 0 
2166 : a9 30 __ LDA #$30
2168 : 85 43 __ STA T2 + 0 
216a : a2 37 __ LDX #$37
.l12:
216c : 0a __ __ ASL
216d : 85 45 __ STA T3 + 0 
216f : 18 __ __ CLC
2170 : a9 00 __ LDA #$00
2172 : 65 1b __ ADC ACCU + 0 
2174 : 85 47 __ STA T4 + 0 
2176 : a9 3d __ LDA #$3d
2178 : 69 00 __ ADC #$00
217a : 85 48 __ STA T4 + 1 
217c : a9 00 __ LDA #$00
217e : 06 45 __ ASL T3 + 0 
2180 : 2a __ __ ROL
2181 : 06 45 __ ASL T3 + 0 
2183 : 2a __ __ ROL
2184 : a8 __ __ TAY
2185 : a9 5d __ LDA #$5d
2187 : 65 45 __ ADC T3 + 0 
2189 : 85 45 __ STA T3 + 0 
218b : 98 __ __ TYA
218c : 69 4e __ ADC #$4e
218e : 85 46 __ STA T3 + 1 
2190 : a0 00 __ LDY #$00
.l31:
2192 : b1 47 __ LDA (T4 + 0),y 
2194 : 0a __ __ ASL
2195 : 91 45 __ STA (T3 + 0),y 
2197 : c8 __ __ INY
2198 : c0 07 __ CPY #$07
219a : d0 f6 __ BNE $2192 ; (make_shapes.l31 + 0)
.s32:
219c : a5 1b __ LDA ACCU + 0 
219e : 69 06 __ ADC #$06
21a0 : 85 1b __ STA ACCU + 0 
21a2 : e6 1c __ INC ACCU + 1 
21a4 : a5 1c __ LDA ACCU + 1 
21a6 : c9 24 __ CMP #$24
21a8 : b0 03 __ BCS $21ad ; (make_shapes.s13 + 0)
21aa : 4c 6a 22 JMP $226a ; (make_shapes.s10 + 0)
.s13:
21ad : a2 00 __ LDX #$00
21af : 86 1b __ STX ACCU + 0 
21b1 : a9 f8 __ LDA #$f8
21b3 : 85 1c __ STA ACCU + 1 
.l14:
21b5 : a9 e5 __ LDA #$e5
21b7 : 85 43 __ STA T2 + 0 
21b9 : a9 4e __ LDA #$4e
21bb : 85 44 __ STA T2 + 1 
.l15:
21bd : a4 1c __ LDY ACCU + 1 
21bf : b1 43 __ LDA (T2 + 0),y 
21c1 : 49 ff __ EOR #$ff
21c3 : a4 1b __ LDY ACCU + 0 
21c5 : 91 43 __ STA (T2 + 0),y 
21c7 : 18 __ __ CLC
21c8 : a5 43 __ LDA T2 + 0 
21ca : 69 08 __ ADC #$08
21cc : 85 43 __ STA T2 + 0 
21ce : 90 02 __ BCC $21d2 ; (make_shapes.s38 + 0)
.s37:
21d0 : e6 44 __ INC T2 + 1 
.s38:
21d2 : c9 35 __ CMP #$35
21d4 : d0 e7 __ BNE $21bd ; (make_shapes.l15 + 0)
.s16:
21d6 : b9 f5 50 LDA $50f5,y ; (shapes[0][0] + 664)
21d9 : 49 ff __ EOR #$ff
21db : 99 35 4f STA $4f35,y ; (shapes[0][0] + 216)
21de : b9 6d 50 LDA $506d,y ; (shapes[0][0] + 528)
21e1 : 49 ff __ EOR #$ff
21e3 : 99 3d 4f STA $4f3d,y ; (shapes[0][0] + 224)
21e6 : a9 65 __ LDA #$65
21e8 : 85 43 __ STA T2 + 0 
21ea : a9 50 __ LDA #$50
21ec : 85 44 __ STA T2 + 1 
21ee : a9 5d __ LDA #$5d
21f0 : 85 45 __ STA T3 + 0 
21f2 : a9 52 __ LDA #$52
21f4 : 85 46 __ STA T3 + 1 
.l33:
21f6 : b1 43 __ LDA (T2 + 0),y 
21f8 : 49 ff __ EOR #$ff
21fa : 91 45 __ STA (T3 + 0),y 
21fc : 18 __ __ CLC
21fd : a5 43 __ LDA T2 + 0 
21ff : 69 08 __ ADC #$08
2201 : 85 43 __ STA T2 + 0 
2203 : 90 03 __ BCC $2208 ; (make_shapes.s40 + 0)
.s39:
2205 : e6 44 __ INC T2 + 1 
2207 : 18 __ __ CLC
.s40:
2208 : a5 45 __ LDA T3 + 0 
220a : 69 08 __ ADC #$08
220c : 85 45 __ STA T3 + 0 
220e : 90 02 __ BCC $2212 ; (make_shapes.s42 + 0)
.s41:
2210 : e6 46 __ INC T3 + 1 
.s42:
2212 : c9 2d __ CMP #$2d
2214 : d0 e0 __ BNE $21f6 ; (make_shapes.l33 + 0)
.s17:
2216 : a5 1c __ LDA ACCU + 1 
2218 : 69 00 __ ADC #$00
221a : 85 1c __ STA ACCU + 1 
221c : 90 01 __ BCC $221f ; (make_shapes.s44 + 0)
.s43:
221e : e8 __ __ INX
.s44:
221f : e6 1b __ INC ACCU + 0 
2221 : e0 01 __ CPX #$01
2223 : d0 90 __ BNE $21b5 ; (make_shapes.l14 + 0)
.s24:
2225 : a8 __ __ TAY
2226 : d0 8d __ BNE $21b5 ; (make_shapes.l14 + 0)
.s18:
2228 : 85 1d __ STA ACCU + 2 
222a : aa __ __ TAX
.l19:
222b : 86 1b __ STX ACCU + 0 
222d : bc ed 3c LDY $3ced,x ; (round[0] + 0)
2230 : 84 1c __ STY ACCU + 1 
2232 : a2 00 __ LDX #$00
2234 : 86 45 __ STX T3 + 0 
.l20:
2236 : bd 08 3f LDA $3f08,x ; (bitshift[0] + 8)
2239 : 25 1c __ AND ACCU + 1 
223b : f0 07 __ BEQ $2244 ; (make_shapes.s22 + 0)
.s21:
223d : bd 20 3f LDA $3f20,x ; (bitshift[0] + 32)
2240 : 05 45 __ ORA T3 + 0 
2242 : 85 45 __ STA T3 + 0 
.s22:
2244 : e8 __ __ INX
2245 : e0 08 __ CPX #$08
2247 : d0 ed __ BNE $2236 ; (make_shapes.l20 + 0)
.s23:
2249 : 98 __ __ TYA
224a : a6 1b __ LDX ACCU + 0 
224c : 9d 2d 53 STA $532d,x ; (shapes[0][0] + 1232)
224f : a5 45 __ LDA T3 + 0 
2251 : 9d 35 53 STA $5335,x ; (shapes[0][0] + 1240)
2254 : 8a __ __ TXA
2255 : 49 07 __ EOR #$07
2257 : aa __ __ TAX
2258 : 98 __ __ TYA
2259 : 9d 3d 53 STA $533d,x ; (shapes[0][0] + 1248)
225c : a5 45 __ LDA T3 + 0 
225e : 9d 45 53 STA $5345,x ; (shapes[0][0] + 1256)
2261 : e6 1d __ INC ACCU + 2 
2263 : a6 1d __ LDX ACCU + 2 
2265 : e0 08 __ CPX #$08
2267 : 90 c2 __ BCC $222b ; (make_shapes.l19 + 0)
.s3:
2269 : 60 __ __ RTS
.s10:
226a : c9 0a __ CMP #$0a
226c : e6 43 __ INC T2 + 0 
226e : e8 __ __ INX
226f : b0 05 __ BCS $2276 ; (make_shapes.s25 + 0)
.s11:
2271 : a5 43 __ LDA T2 + 0 
2273 : 4c 6c 21 JMP $216c ; (make_shapes.l12 + 0)
.s25:
2276 : 8a __ __ TXA
2277 : 4c 6c 21 JMP $216c ; (make_shapes.l12 + 0)
--------------------------------------------------------------------
make_poses: ; make_poses()->void
; 266, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
227a : a9 00 __ LDA #$00
227c : a2 90 __ LDX #$90
227e : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
2281 : a9 00 __ LDA #$00
2283 : 85 1b __ STA ACCU + 0 
.l5:
2285 : 4a __ __ LSR
2286 : 4a __ __ LSR
2287 : 4a __ __ LSR
2288 : aa __ __ TAX
2289 : bd b0 3c LDA $3cb0,x ; (__multab60L + 0)
228c : 85 1c __ STA ACCU + 1 
228e : a5 1b __ LDA ACCU + 0 
2290 : 29 07 __ AND #$07
2292 : 85 1d __ STA ACCU + 2 
2294 : a9 00 __ LDA #$00
2296 : 85 1e __ STA ACCU + 3 
.l6:
2298 : 0a __ __ ASL
2299 : 0a __ __ ASL
229a : 0a __ __ ASL
229b : 85 43 __ STA T4 + 0 
229d : a2 00 __ LDX #$00
.l19:
229f : 38 __ __ SEC
22a0 : e5 1d __ SBC ACCU + 2 
22a2 : 85 44 __ STA T5 + 0 
22a4 : a9 08 __ LDA #$08
22a6 : 85 45 __ STA T9 + 0 
.l8:
22a8 : a4 44 __ LDY T5 + 0 
22aa : c0 0c __ CPY #$0c
22ac : 90 04 __ BCC $22b2 ; (make_poses.s9 + 0)
.s18:
22ae : a9 00 __ LDA #$00
22b0 : b0 0b __ BCS $22bd ; (make_poses.l10 + 0)
.s9:
22b2 : 8a __ __ TXA
22b3 : 79 b3 3c ADC $3cb3,y ; (__multab5L + 0)
22b6 : 18 __ __ CLC
22b7 : 65 1c __ ADC ACCU + 1 
22b9 : a8 __ __ TAY
22ba : b9 00 3e LDA $3e00,y ; (bird_art[0][0][0] + 0)
.l10:
22bd : 2c 00 d6 BIT $d600 
22c0 : 10 fb __ BPL $22bd ; (make_poses.l10 + 0)
.s11:
22c2 : 8d 01 d6 STA $d601 
22c5 : e6 44 __ INC T5 + 0 
22c7 : c6 45 __ DEC T9 + 0 
22c9 : d0 dd __ BNE $22a8 ; (make_poses.l8 + 0)
.s12:
22cb : a0 08 __ LDY #$08
.l13:
22cd : 2c 00 d6 BIT $d600 
22d0 : 10 fb __ BPL $22cd ; (make_poses.l13 + 0)
.s14:
22d2 : a9 00 __ LDA #$00
22d4 : 8d 01 d6 STA $d601 
22d7 : 88 __ __ DEY
22d8 : d0 f3 __ BNE $22cd ; (make_poses.l13 + 0)
.s15:
22da : e8 __ __ INX
22db : e0 05 __ CPX #$05
22dd : b0 04 __ BCS $22e3 ; (make_poses.s16 + 0)
.s7:
22df : a5 43 __ LDA T4 + 0 
22e1 : 90 bc __ BCC $229f ; (make_poses.l19 + 0)
.s16:
22e3 : e6 1e __ INC ACCU + 3 
22e5 : a5 1e __ LDA ACCU + 3 
22e7 : c9 03 __ CMP #$03
22e9 : d0 ad __ BNE $2298 ; (make_poses.l6 + 0)
.s17:
22eb : e6 1b __ INC ACCU + 0 
22ed : a5 1b __ LDA ACCU + 0 
22ef : c9 18 __ CMP #$18
22f1 : d0 92 __ BNE $2285 ; (make_poses.l5 + 0)
.s3:
22f3 : 60 __ __ RTS
--------------------------------------------------------------------
pipe_shapes: ; pipe_shapes(u8)->void
; 283, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
22f4 : 0a __ __ ASL
22f5 : 85 1b __ STA ACCU + 0 
22f7 : a9 00 __ LDA #$00
22f9 : 2a __ __ ROL
22fa : 85 1c __ STA ACCU + 1 
22fc : a9 0a __ LDA #$0a
22fe : 85 43 __ STA T5 + 0 
2300 : 85 1d __ STA ACCU + 2 
.l5:
2302 : a5 43 __ LDA T5 + 0 
2304 : c9 0d __ CMP #$0d
2306 : d0 04 __ BNE $230c ; (pipe_shapes.s7 + 0)
.s6:
2308 : a9 01 __ LDA #$01
230a : d0 02 __ BNE $230e ; (pipe_shapes.s8 + 0)
.s7:
230c : a9 00 __ LDA #$00
.s8:
230e : 85 44 __ STA T6 + 0 
2310 : a9 00 __ LDA #$00
2312 : 85 45 __ STA T7 + 0 
.l9:
2314 : a9 00 __ LDA #$00
2316 : 85 1e __ STA ACCU + 3 
2318 : 85 46 __ STA T8 + 0 
.l42:
231a : a5 44 __ LDA T6 + 0 
231c : f0 06 __ BEQ $2324 ; (pipe_shapes.s16 + 0)
.s10:
231e : a2 ff __ LDX #$ff
2320 : a0 f8 __ LDY #$f8
2322 : d0 24 __ BNE $2348 ; (pipe_shapes.s11 + 0)
.s16:
2324 : a5 43 __ LDA T5 + 0 
2326 : c9 0c __ CMP #$0c
2328 : d0 06 __ BNE $2330 ; (pipe_shapes.s18 + 0)
.s17:
232a : a0 30 __ LDY #$30
.s41:
232c : a2 00 __ LDX #$00
232e : f0 18 __ BEQ $2348 ; (pipe_shapes.s11 + 0)
.s18:
2330 : c9 10 __ CMP #$10
2332 : d0 04 __ BNE $2338 ; (pipe_shapes.s20 + 0)
.s19:
2334 : a0 38 __ LDY #$38
2336 : d0 f4 __ BNE $232c ; (pipe_shapes.s41 + 0)
.s20:
2338 : c9 0a __ CMP #$0a
233a : f0 04 __ BEQ $2340 ; (pipe_shapes.s21 + 0)
.s22:
233c : c9 0e __ CMP #$0e
233e : d0 04 __ BNE $2344 ; (pipe_shapes.s23 + 0)
.s21:
2340 : a0 00 __ LDY #$00
2342 : f0 e8 __ BEQ $232c ; (pipe_shapes.s41 + 0)
.s23:
2344 : a0 18 __ LDY #$18
2346 : a2 00 __ LDX #$00
.s11:
2348 : 98 __ __ TYA
2349 : 18 __ __ CLC
234a : 65 46 __ ADC T8 + 0 
234c : 90 02 __ BCC $2350 ; (pipe_shapes.s40 + 0)
.s39:
234e : e8 __ __ INX
234f : 18 __ __ CLC
.s40:
2350 : 65 1b __ ADC ACCU + 0 
2352 : a8 __ __ TAY
2353 : 8a __ __ TXA
2354 : 65 1c __ ADC ACCU + 1 
2356 : aa __ __ TAX
2357 : a5 43 __ LDA T5 + 0 
2359 : c9 0d __ CMP #$0d
235b : 8a __ __ TXA
235c : b0 6b __ BCS $23c9 ; (pipe_shapes.s33 + 0)
.s12:
235e : 30 16 __ BMI $2376 ; (pipe_shapes.s15 + 0)
.s32:
2360 : d0 04 __ BNE $2366 ; (pipe_shapes.s13 + 0)
.s31:
2362 : c0 08 __ CPY #$08
2364 : 90 10 __ BCC $2376 ; (pipe_shapes.s15 + 0)
.s13:
2366 : 8a __ __ TXA
2367 : d0 0d __ BNE $2376 ; (pipe_shapes.s15 + 0)
.s30:
2369 : c0 38 __ CPY #$38
236b : b0 09 __ BCS $2376 ; (pipe_shapes.s15 + 0)
.s14:
236d : a6 46 __ LDX T8 + 0 
236f : bd 20 3f LDA $3f20,x ; (bitshift[0] + 32)
2372 : 05 1e __ ORA ACCU + 3 
2374 : 85 1e __ STA ACCU + 3 
.s15:
2376 : e6 46 __ INC T8 + 0 
2378 : a5 46 __ LDA T8 + 0 
237a : c9 08 __ CMP #$08
237c : 90 9c __ BCC $231a ; (pipe_shapes.l42 + 0)
.s24:
237e : a5 1d __ LDA ACCU + 2 
2380 : 0a __ __ ASL
2381 : 0a __ __ ASL
2382 : 0a __ __ ASL
2383 : 18 __ __ CLC
2384 : 65 45 __ ADC T7 + 0 
2386 : aa __ __ TAX
2387 : a5 1e __ LDA ACCU + 3 
2389 : 9d 5d 4e STA $4e5d,x ; (shapes[0][0] + 0)
238c : e6 45 __ INC T7 + 0 
238e : a5 45 __ LDA T7 + 0 
2390 : c9 08 __ CMP #$08
2392 : 90 80 __ BCC $2314 ; (pipe_shapes.l9 + 0)
.s25:
2394 : a5 43 __ LDA T5 + 0 
2396 : c9 10 __ CMP #$10
2398 : e6 1d __ INC ACCU + 2 
239a : e6 43 __ INC T5 + 0 
239c : b0 03 __ BCS $23a1 ; (pipe_shapes.s26 + 0)
239e : 4c 02 23 JMP $2302 ; (pipe_shapes.l5 + 0)
.s26:
23a1 : a2 00 __ LDX #$00
23a3 : 86 1d __ STX ACCU + 2 
.l27:
23a5 : a9 ff __ LDA #$ff
23a7 : b0 0d __ BCS $23b6 ; (pipe_shapes.l38 + 0)
.s29:
23a9 : a5 1d __ LDA ACCU + 2 
23ab : 69 08 __ ADC #$08
23ad : 38 __ __ SEC
23ae : e5 1b __ SBC ACCU + 0 
23b0 : 29 07 __ AND #$07
23b2 : a8 __ __ TAY
23b3 : b9 f5 3c LDA $3cf5,y ; (stripe[0] + 0)
.l38:
23b6 : a4 1d __ LDY ACCU + 2 
23b8 : 99 85 4e STA $4e85,y ; (shapes[0][0] + 40)
23bb : e8 __ __ INX
23bc : e0 08 __ CPX #$08
23be : b0 08 __ BCS $23c8 ; (pipe_shapes.s3 + 0)
.s28:
23c0 : e0 06 __ CPX #$06
23c2 : e6 1d __ INC ACCU + 2 
23c4 : 90 e3 __ BCC $23a9 ; (pipe_shapes.s29 + 0)
23c6 : b0 dd __ BCS $23a5 ; (pipe_shapes.l27 + 0)
.s3:
23c8 : 60 __ __ RTS
.s33:
23c9 : d0 ab __ BNE $2376 ; (pipe_shapes.s15 + 0)
.s37:
23cb : c0 40 __ CPY #$40
23cd : b0 a7 __ BCS $2376 ; (pipe_shapes.s15 + 0)
.s34:
23cf : a6 45 __ LDX T7 + 0 
23d1 : ca __ __ DEX
23d2 : d0 99 __ BNE $236d ; (pipe_shapes.s14 + 0)
.s35:
23d4 : 98 __ __ TYA
23d5 : f0 96 __ BEQ $236d ; (pipe_shapes.s14 + 0)
.s36:
23d7 : c9 3f __ CMP #$3f
23d9 : d0 9b __ BNE $2376 ; (pipe_shapes.s15 + 0)
23db : f0 90 __ BEQ $236d ; (pipe_shapes.s14 + 0)
--------------------------------------------------------------------
reset_game: ; reset_game()->void
; 509, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
23dd : a9 00 __ LDA #$00
23df : 8d f1 3e STA $3ef1 ; (pipes[0].x + 1)
23e2 : 8d e7 3e STA $3ee7 ; (score + 0)
23e5 : 8d e8 3e STA $3ee8 ; (score + 1)
23e8 : 8d e9 3e STA $3ee9 ; (velocity + 0)
23eb : 8d ea 3e STA $3eea ; (velocity + 1)
23ee : 8d ed 3e STA $3eed ; (phase + 0)
23f1 : 8d ef 3e STA $3eef ; (scroll + 0)
23f4 : a9 54 __ LDA #$54
23f6 : 8d f0 3e STA $3ef0 ; (pipes[0].x + 0)
23f9 : a9 80 __ LDA #$80
23fb : 8d eb 3e STA $3eeb ; (bird_y + 0)
23fe : a9 05 __ LDA #$05
2400 : 8d ec 3e STA $3eec ; (bird_y + 1)
2403 : a9 0a __ LDA #$0a
2405 : 8d ee 3e STA $3eee ; (speed + 0)
2408 : 20 4e 25 JSR $254e ; (gap_next.s4 + 0)
240b : 8d f2 3e STA $3ef2 ; (pipes[0].gap + 0)
240e : a9 00 __ LDA #$00
2410 : 8d f3 3e STA $3ef3 ; (pipes[0].passed + 0)
2413 : 8d f5 3e STA $3ef5 ; (pipes[0] + 5)
2416 : a9 71 __ LDA #$71
2418 : 8d f4 3e STA $3ef4 ; (pipes[0] + 4)
241b : 20 4e 25 JSR $254e ; (gap_next.s4 + 0)
241e : 8d f6 3e STA $3ef6 ; (pipes[0] + 6)
2421 : a9 00 __ LDA #$00
2423 : 8d f7 3e STA $3ef7 ; (pipes[0] + 7)
2426 : 8d f9 3e STA $3ef9 ; (pipes[0] + 9)
2429 : a9 8e __ LDA #$8e
242b : 8d f8 3e STA $3ef8 ; (pipes[0] + 8)
242e : 20 4e 25 JSR $254e ; (gap_next.s4 + 0)
2431 : 8d fa 3e STA $3efa ; (pipes[0] + 10)
2434 : a9 00 __ LDA #$00
2436 : 8d fb 3e STA $3efb ; (pipes[0] + 11)
2439 : 8d fd 3e STA $3efd ; (pipes[0] + 13)
243c : a9 ab __ LDA #$ab
243e : 8d fc 3e STA $3efc ; (pipes[0] + 12)
2441 : 20 4e 25 JSR $254e ; (gap_next.s4 + 0)
2444 : 8d fe 3e STA $3efe ; (pipes[0] + 14)
2447 : a9 00 __ LDA #$00
2449 : 8d ff 3e STA $3eff ; (pipes[0] + 15)
244c : 20 7b 25 JSR $257b ; (field.s4 + 0)
--------------------------------------------------------------------
bird_draw: ; bird_draw()->void
; 312, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
244f : ad ff 3c LDA $3cff ; (bird_row + 0)
2452 : 85 4b __ STA T4 + 0 
2454 : ad eb 3e LDA $3eeb ; (bird_y + 0)
2457 : 85 49 __ STA T2 + 0 
2459 : ad ec 3e LDA $3eec ; (bird_y + 1)
245c : 4a __ __ LSR
245d : 66 49 __ ROR T2 + 0 
245f : 4a __ __ LSR
2460 : 66 49 __ ROR T2 + 0 
2462 : 4a __ __ LSR
2463 : 66 49 __ ROR T2 + 0 
2465 : 4a __ __ LSR
2466 : 66 49 __ ROR T2 + 0 
2468 : a6 49 __ LDX T2 + 0 
246a : 86 4a __ STX T3 + 0 
246c : 4a __ __ LSR
246d : 66 4a __ ROR T3 + 0 
246f : 4a __ __ LSR
2470 : 66 4a __ ROR T3 + 0 
2472 : 4a __ __ LSR
2473 : 66 4a __ ROR T3 + 0 
2475 : a5 4a __ LDA T3 + 0 
2477 : 8d ff 3c STA $3cff ; (bird_row + 0)
247a : a5 4b __ LDA T4 + 0 
247c : c9 ff __ CMP #$ff
247e : f0 1b __ BEQ $249b ; (bird_draw.s13 + 0)
.s5:
2480 : 85 4c __ STA T5 + 0 
2482 : 4c 89 24 JMP $2489 ; (bird_draw.l6 + 0)
.s10:
2485 : a5 4b __ LDA T4 + 0 
2487 : e6 4c __ INC T5 + 0 
.l6:
2489 : 18 __ __ CLC
248a : 69 02 __ ADC #$02
248c : b0 04 __ BCS $2492 ; (bird_draw.s7 + 0)
.s23:
248e : c5 4c __ CMP T5 + 0 
2490 : 90 09 __ BCC $249b ; (bird_draw.s13 + 0)
.s7:
2492 : a5 4c __ LDA T5 + 0 
2494 : c9 15 __ CMP #$15
2496 : b0 03 __ BCS $249b ; (bird_draw.s13 + 0)
2498 : 4c 27 25 JMP $2527 ; (bird_draw.s8 + 0)
.s13:
249b : a9 01 __ LDA #$01
249d : cd e6 3e CMP $3ee6 ; (state + 0)
24a0 : d0 0b __ BNE $24ad ; (bird_draw.s25 + 0)
.s14:
24a2 : ad e5 55 LDA $55e5 ; (simulation_count + 0)
24a5 : 29 0c __ AND #$0c
24a7 : 4a __ __ LSR
24a8 : 4a __ __ LSR
24a9 : aa __ __ TAX
24aa : bd fc 3d LDA $3dfc,x ; (flap[0] + 0)
.s25:
24ad : 0a __ __ ASL
24ae : 0a __ __ ASL
24af : 0a __ __ ASL
24b0 : 45 49 __ EOR T2 + 0 
24b2 : 29 f8 __ AND #$f8
24b4 : 45 49 __ EOR T2 + 0 
24b6 : 8d e7 55 STA $55e7 ; (bird_pose + 0)
24b9 : a5 4a __ LDA T3 + 0 
24bb : ae e8 55 LDX $55e8 ; (shown_set + 0)
24be : cd b4 3e CMP $3eb4 ; (shown_row + 0)
24c1 : f0 06 __ BEQ $24c9 ; (bird_draw.s15 + 0)
.s22:
24c3 : 8a __ __ TXA
24c4 : 49 01 __ EOR #$01
24c6 : aa __ __ TAX
24c7 : a5 4a __ LDA T3 + 0 
.s15:
24c9 : 8e e9 55 STX $55e9 ; (bird_set + 0)
24cc : c5 4b __ CMP T4 + 0 
24ce : d0 05 __ BNE $24d5 ; (bird_draw.s17 + 0)
.s16:
24d0 : ad de 55 LDA $55de ; (bird_stale + 0)
24d3 : f0 51 __ BEQ $2526 ; (bird_draw.s3 + 0)
.s17:
24d5 : 86 1b __ STX ACCU + 0 
24d7 : a9 00 __ LDA #$00
24d9 : 8d de 55 STA $55de ; (bird_stale + 0)
24dc : 85 1c __ STA ACCU + 1 
24de : a9 0f __ LDA #$0f
24e0 : 20 ed 3b JSR $3bed ; (mul16by8 + 0)
24e3 : 18 __ __ CLC
24e4 : a5 1b __ LDA ACCU + 0 
24e6 : 69 60 __ ADC #$60
24e8 : 85 49 __ STA T2 + 0 
24ea : a9 00 __ LDA #$00
24ec : 85 4b __ STA T4 + 0 
24ee : 18 __ __ CLC
.l18:
24ef : 65 4a __ ADC T3 + 0 
24f1 : b0 33 __ BCS $2526 ; (bird_draw.s3 + 0)
.s21:
24f3 : c9 15 __ CMP #$15
24f5 : b0 2f __ BCS $2526 ; (bird_draw.s3 + 0)
.s19:
24f7 : 85 0e __ STA P1 
24f9 : a9 1e __ LDA #$1e
24fb : 85 4d __ STA T6 + 0 
24fd : a2 00 __ LDX #$00
24ff : 90 04 __ BCC $2505 ; (bird_draw.l27 + 0)
.s26:
2501 : e6 4d __ INC T6 + 0 
2503 : a5 4d __ LDA T6 + 0 
.l27:
2505 : 86 4c __ STX T5 + 0 
2507 : 85 0d __ STA P0 
2509 : a5 49 __ LDA T2 + 0 
250b : 85 0f __ STA P2 
250d : bd b5 3e LDA $3eb5,x ; (bird_colours[0] + 0)
2510 : 85 10 __ STA P3 
2512 : 20 05 27 JSR $2705 ; (cell.s4 + 0)
2515 : a6 4c __ LDX T5 + 0 
2517 : e8 __ __ INX
2518 : e0 05 __ CPX #$05
251a : e6 49 __ INC T2 + 0 
251c : 90 e3 __ BCC $2501 ; (bird_draw.s26 + 0)
.s20:
251e : e6 4b __ INC T4 + 0 
2520 : a5 4b __ LDA T4 + 0 
2522 : c9 03 __ CMP #$03
2524 : 90 c9 __ BCC $24ef ; (bird_draw.l18 + 0)
.s3:
2526 : 60 __ __ RTS
.s8:
2527 : c5 4a __ CMP T3 + 0 
2529 : 90 0f __ BCC $253a ; (bird_draw.s9 + 0)
.s11:
252b : a5 4a __ LDA T3 + 0 
252d : 69 01 __ ADC #$01
252f : 90 03 __ BCC $2534 ; (bird_draw.s12 + 0)
2531 : 4c 85 24 JMP $2485 ; (bird_draw.s10 + 0)
.s12:
2534 : c5 4c __ CMP T5 + 0 
2536 : b0 f9 __ BCS $2531 ; (bird_draw.s11 + 6)
.s28:
2538 : a5 4c __ LDA T5 + 0 
.s9:
253a : 85 0e __ STA P1 
253c : a9 1e __ LDA #$1e
253e : 85 0d __ STA P0 
.l24:
2540 : 20 1f 26 JSR $261f ; (background.s4 + 0)
2543 : e6 0d __ INC P0 
2545 : a5 0d __ LDA P0 
2547 : c9 23 __ CMP #$23
2549 : 90 f5 __ BCC $2540 ; (bird_draw.l24 + 0)
254b : 4c 85 24 JMP $2485 ; (bird_draw.s10 + 0)
--------------------------------------------------------------------
gap_next: ; gap_next()->u8
; 202, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
254e : ad fe 3c LDA $3cfe ; (random_state + 1)
2551 : 85 1c __ STA ACCU + 1 
2553 : ad fd 3c LDA $3cfd ; (random_state + 0)
2556 : 29 01 __ AND #$01
2558 : f0 02 __ BEQ $255c ; (gap_next.s6 + 0)
.s5:
255a : a9 b4 __ LDA #$b4
.s6:
255c : aa __ __ TAX
255d : ad fd 3c LDA $3cfd ; (random_state + 0)
2560 : 46 1c __ LSR ACCU + 1 
2562 : 6a __ __ ROR
2563 : 85 1b __ STA ACCU + 0 
2565 : 8d fd 3c STA $3cfd ; (random_state + 0)
2568 : 8a __ __ TXA
2569 : 45 1c __ EOR ACCU + 1 
256b : 85 1c __ STA ACCU + 1 
256d : 8d fe 3c STA $3cfe ; (random_state + 1)
2570 : a9 0c __ LDA #$0c
2572 : 20 5a 3c JSR $3c5a ; (divmod + 53)
2575 : 18 __ __ CLC
2576 : a5 05 __ LDA WORK + 2 
2578 : 69 02 __ ADC #$02
.s3:
257a : 60 __ __ RTS
--------------------------------------------------------------------
field: ; field()->void
; 498, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
257b : a9 01 __ LDA #$01
257d : 8d dd 55 STA $55dd ; (redrawn + 0)
2580 : 8d de 55 STA $55de ; (bird_stale + 0)
2583 : a9 00 __ LDA #$00
2585 : 85 4a __ STA T1 + 0 
.l5:
2587 : 85 0e __ STA P1 
2589 : a9 00 __ LDA #$00
258b : 85 0d __ STA P0 
.l8:
258d : 20 1f 26 JSR $261f ; (background.s4 + 0)
2590 : e6 0d __ INC P0 
2592 : a5 0d __ LDA P0 
2594 : c9 50 __ CMP #$50
2596 : 90 f5 __ BCC $258d ; (field.l8 + 0)
.s6:
2598 : e6 4a __ INC T1 + 0 
259a : a5 4a __ LDA T1 + 0 
259c : c9 19 __ CMP #$19
259e : 90 e7 __ BCC $2587 ; (field.l5 + 0)
.s7:
25a0 : a9 02 __ LDA #$02
25a2 : 85 0d __ STA P0 
25a4 : a9 0d __ LDA #$0d
25a6 : 85 10 __ STA P3 
25a8 : a9 17 __ LDA #$17
25aa : 85 0e __ STA P1 
25ac : a9 1b __ LDA #$1b
25ae : 85 0f __ STA P2 
25b0 : 20 05 27 JSR $2705 ; (cell.s4 + 0)
25b3 : e6 0f __ INC P2 
25b5 : a9 48 __ LDA #$48
25b7 : 85 0d __ STA P0 
25b9 : 20 05 27 JSR $2705 ; (cell.s4 + 0)
25bc : ad e7 3e LDA $3ee7 ; (score + 0)
25bf : 85 12 __ STA P5 
25c1 : a9 04 __ LDA #$04
25c3 : 85 11 __ STA P4 
25c5 : ad e8 3e LDA $3ee8 ; (score + 1)
25c8 : 85 13 __ STA P6 
25ca : 20 db 25 JSR $25db ; (number.s4 + 0)
25cd : a9 4a __ LDA #$4a
25cf : 85 11 __ STA P4 
--------------------------------------------------------------------
number@proxy: ; number@proxy
25d1 : ad e3 55 LDA $55e3 ; (best + 0)
25d4 : 85 12 __ STA P5 
25d6 : ad e4 55 LDA $55e4 ; (best + 1)
25d9 : 85 13 __ STA P6 
--------------------------------------------------------------------
number: ; number(u8,u16)->void
; 194, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
25db : a5 12 __ LDA P5 ; (n + 0)
25dd : 85 1b __ STA ACCU + 0 
25df : a9 04 __ LDA #$04
25e1 : 85 49 __ STA T3 + 0 
25e3 : a5 13 __ LDA P6 ; (n + 1)
25e5 : 85 1c __ STA ACCU + 1 
25e7 : 18 __ __ CLC
25e8 : a9 17 __ LDA #$17
25ea : 85 0e __ STA P1 
25ec : a9 0d __ LDA #$0d
25ee : 85 10 __ STA P3 
25f0 : a5 11 __ LDA P4 ; (x + 0)
25f2 : 69 03 __ ADC #$03
.l5:
25f4 : 85 0d __ STA P0 
25f6 : a9 0a __ LDA #$0a
25f8 : 20 5a 3c JSR $3c5a ; (divmod + 53)
25fb : a5 1b __ LDA ACCU + 0 
25fd : 85 47 __ STA T0 + 0 
25ff : a5 1c __ LDA ACCU + 1 
2601 : 85 48 __ STA T0 + 1 
2603 : 18 __ __ CLC
2604 : a5 05 __ LDA WORK + 2 
2606 : 69 11 __ ADC #$11
2608 : 85 0f __ STA P2 
260a : 20 05 27 JSR $2705 ; (cell.s4 + 0)
260d : a5 47 __ LDA T0 + 0 
260f : 85 1b __ STA ACCU + 0 
2611 : a5 48 __ LDA T0 + 1 
2613 : 85 1c __ STA ACCU + 1 
2615 : 38 __ __ SEC
2616 : a5 0d __ LDA P0 
2618 : e9 01 __ SBC #$01
261a : c6 49 __ DEC T3 + 0 
261c : d0 d6 __ BNE $25f4 ; (number.l5 + 0)
.s3:
261e : 60 __ __ RTS
--------------------------------------------------------------------
background: ; background(u8,u8)->void
; 208, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
261f : a9 20 __ LDA #$20
2621 : 85 43 __ STA T0 + 0 
2623 : 85 0f __ STA P2 
2625 : a9 04 __ LDA #$04
2627 : 85 1d __ STA ACCU + 2 
2629 : 85 10 __ STA P3 
262b : a5 0d __ LDA P0 ; (x + 0)
262d : c9 50 __ CMP #$50
262f : b0 0c __ BCS $263d ; (background.s5 + 0)
.s6:
2631 : a5 0e __ LDA P1 ; (y + 0)
2633 : c9 15 __ CMP #$15
2635 : d0 09 __ BNE $2640 ; (background.s8 + 0)
.s7:
2637 : a9 05 __ LDA #$05
2639 : 85 0f __ STA P2 
.s42:
263b : 85 10 __ STA P3 
.s5:
263d : 4c 05 27 JMP $2705 ; (cell.s4 + 0)
.s8:
2640 : c9 16 __ CMP #$16
2642 : a9 00 __ LDA #$00
2644 : 90 06 __ BCC $264c ; (background.s10 + 0)
.s9:
2646 : 85 0f __ STA P2 
2648 : a9 0d __ LDA #$0d
264a : b0 ef __ BCS $263b ; (background.s42 + 0)
.s10:
264c : 85 1b __ STA ACCU + 0 
.l11:
264e : 0a __ __ ASL
264f : 0a __ __ ASL
2650 : aa __ __ TAX
2651 : 38 __ __ SEC
2652 : a5 0d __ LDA P0 ; (x + 0)
2654 : fd f0 3e SBC $3ef0,x ; (pipes[0].x + 0)
2657 : a8 __ __ TAY
2658 : a9 00 __ LDA #$00
265a : fd f1 3e SBC $3ef1,x ; (pipes[0].x + 1)
265d : 85 1c __ STA ACCU + 1 
265f : 49 80 __ EOR #$80
2661 : c9 7f __ CMP #$7f
2663 : d0 02 __ BNE $2667 ; (background.s38 + 0)
.s37:
2665 : c0 ff __ CPY #$ff
.s38:
2667 : 90 69 __ BCC $26d2 ; (background.s17 + 0)
.s12:
2669 : a5 1c __ LDA ACCU + 1 
266b : 30 06 __ BMI $2673 ; (background.s13 + 0)
.s36:
266d : d0 63 __ BNE $26d2 ; (background.s17 + 0)
.s35:
266f : c0 08 __ CPY #$08
2671 : b0 5f __ BCS $26d2 ; (background.s17 + 0)
.s13:
2673 : a5 0e __ LDA P1 ; (y + 0)
2675 : dd f2 3e CMP $3ef2,x ; (pipes[0].gap + 0)
2678 : 90 0d __ BCC $2687 ; (background.s14 + 0)
.s33:
267a : bd f2 3e LDA $3ef2,x ; (pipes[0].gap + 0)
267d : 69 06 __ ADC #$06
267f : b0 51 __ BCS $26d2 ; (background.s17 + 0)
.s34:
2681 : c5 0e __ CMP P1 ; (y + 0)
2683 : 90 02 __ BCC $2687 ; (background.s14 + 0)
.s41:
2685 : d0 4b __ BNE $26d2 ; (background.s17 + 0)
.s14:
2687 : bd f2 3e LDA $3ef2,x ; (pipes[0].gap + 0)
268a : 38 __ __ SEC
268b : e9 01 __ SBC #$01
268d : 85 47 __ STA T3 + 0 
268f : a9 00 __ LDA #$00
2691 : e9 00 __ SBC #$00
2693 : 85 48 __ STA T3 + 1 
2695 : d0 06 __ BNE $269d ; (background.s23 + 0)
.s32:
2697 : a5 0e __ LDA P1 ; (y + 0)
2699 : c5 47 __ CMP T3 + 0 
269b : f0 49 __ BEQ $26e6 ; (background.s15 + 0)
.s23:
269d : 18 __ __ CLC
269e : a5 47 __ LDA T3 + 0 
26a0 : 69 08 __ ADC #$08
26a2 : 85 47 __ STA T3 + 0 
26a4 : a5 48 __ LDA T3 + 1 
26a6 : 69 00 __ ADC #$00
26a8 : d0 06 __ BNE $26b0 ; (background.s24 + 0)
.s31:
26aa : a5 0e __ LDA P1 ; (y + 0)
26ac : c5 47 __ CMP T3 + 0 
26ae : f0 36 __ BEQ $26e6 ; (background.s15 + 0)
.s24:
26b0 : a5 1c __ LDA ACCU + 1 
26b2 : d0 1e __ BNE $26d2 ; (background.s17 + 0)
.s30:
26b4 : c0 07 __ CPY #$07
26b6 : b0 1a __ BCS $26d2 ; (background.s17 + 0)
.s25:
26b8 : a9 04 __ LDA #$04
26ba : 85 1d __ STA ACCU + 2 
26bc : 98 __ __ TYA
26bd : d0 07 __ BNE $26c6 ; (background.s27 + 0)
.s26:
26bf : a9 0a __ LDA #$0a
.s39:
26c1 : 85 43 __ STA T0 + 0 
26c3 : 4c d2 26 JMP $26d2 ; (background.s17 + 0)
.s27:
26c6 : c9 06 __ CMP #$06
26c8 : d0 04 __ BNE $26ce ; (background.s29 + 0)
.s28:
26ca : a9 0c __ LDA #$0c
26cc : d0 f3 __ BNE $26c1 ; (background.s39 + 0)
.s29:
26ce : a9 0b __ LDA #$0b
26d0 : 85 43 __ STA T0 + 0 
.s17:
26d2 : e6 1b __ INC ACCU + 0 
26d4 : a5 1b __ LDA ACCU + 0 
26d6 : c9 04 __ CMP #$04
26d8 : f0 03 __ BEQ $26dd ; (background.s40 + 0)
26da : 4c 4e 26 JMP $264e ; (background.l11 + 0)
.s40:
26dd : a5 43 __ LDA T0 + 0 
26df : 85 0f __ STA P2 
26e1 : a5 1d __ LDA ACCU + 2 
26e3 : 4c 3b 26 JMP $263b ; (background.s42 + 0)
.s15:
26e6 : a9 05 __ LDA #$05
26e8 : 85 1d __ STA ACCU + 2 
26ea : c0 ff __ CPY #$ff
26ec : d0 04 __ BNE $26f2 ; (background.s18 + 0)
.s16:
26ee : a9 0d __ LDA #$0d
26f0 : d0 cf __ BNE $26c1 ; (background.s39 + 0)
.s18:
26f2 : 98 __ __ TYA
26f3 : d0 04 __ BNE $26f9 ; (background.s20 + 0)
.s19:
26f5 : a9 0e __ LDA #$0e
26f7 : d0 c8 __ BNE $26c1 ; (background.s39 + 0)
.s20:
26f9 : c9 07 __ CMP #$07
26fb : d0 04 __ BNE $2701 ; (background.s22 + 0)
.s21:
26fd : a9 10 __ LDA #$10
26ff : d0 c0 __ BNE $26c1 ; (background.s39 + 0)
.s22:
2701 : a9 0f __ LDA #$0f
2703 : d0 bc __ BNE $26c1 ; (background.s39 + 0)
--------------------------------------------------------------------
cell: ; cell(u8,u8,u8,u8)->void
; 189, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2705 : a5 0e __ LDA P1 ; (y + 0)
2707 : 0a __ __ ASL
2708 : aa __ __ TAX
2709 : bd 00 56 LDA $5600,x ; (row_addr[0] + 0)
270c : 65 0d __ ADC P0 ; (x + 0)
270e : a8 __ __ TAY
270f : bd 01 56 LDA $5601,x ; (row_addr[0] + 1)
2712 : 69 00 __ ADC #$00
2714 : 85 1c __ STA ACCU + 1 
2716 : 18 __ __ CLC
2717 : 69 56 __ ADC #$56
2719 : 85 44 __ STA T1 + 1 
271b : a9 32 __ LDA #$32
271d : 85 43 __ STA T1 + 0 
271f : a5 0f __ LDA P2 ; (g + 0)
2721 : d1 43 __ CMP (T1 + 0),y 
2723 : d0 04 __ BNE $2729 ; (cell.s5 + 0)
.s13:
2725 : a9 00 __ LDA #$00
2727 : f0 04 __ BEQ $272d ; (cell.s6 + 0)
.s5:
2729 : 91 43 __ STA (T1 + 0),y 
272b : a9 01 __ LDA #$01
.s6:
272d : 85 45 __ STA T2 + 0 
272f : a9 02 __ LDA #$02
2731 : 85 43 __ STA T1 + 0 
2733 : 18 __ __ CLC
2734 : a9 5e __ LDA #$5e
2736 : 65 1c __ ADC ACCU + 1 
2738 : 85 44 __ STA T1 + 1 
273a : a5 10 __ LDA P3 ; (col + 0)
273c : d1 43 __ CMP (T1 + 0),y 
273e : f0 0b __ BEQ $274b ; (cell.s12 + 0)
.s7:
2740 : 91 43 __ STA (T1 + 0),y 
2742 : a5 45 __ LDA T2 + 0 
2744 : 09 02 __ ORA #$02
2746 : 85 45 __ STA T2 + 0 
2748 : 4c 4f 27 JMP $274f ; (cell.s8 + 0)
.s12:
274b : a5 45 __ LDA T2 + 0 
274d : f0 58 __ BEQ $27a7 ; (cell.s3 + 0)
.s8:
274f : 0a __ __ ASL
2750 : 0a __ __ ASL
2751 : 05 45 __ ORA T2 + 0 
2753 : 85 43 __ STA T1 + 0 
2755 : a9 d2 __ LDA #$d2
2757 : 85 45 __ STA T2 + 0 
2759 : 18 __ __ CLC
275a : a9 65 __ LDA #$65
275c : 65 1c __ ADC ACCU + 1 
275e : 85 46 __ STA T2 + 1 
2760 : b1 45 __ LDA (T2 + 0),y 
2762 : aa __ __ TAX
2763 : 05 43 __ ORA T1 + 0 
2765 : 91 45 __ STA (T2 + 0),y 
2767 : 8a __ __ TXA
2768 : d0 31 __ BNE $279b ; (cell.s9 + 0)
.s11:
276a : ad df 55 LDA $55df ; (dirty_count + 0)
276d : 85 43 __ STA T1 + 0 
276f : 18 __ __ CLC
2770 : 69 01 __ ADC #$01
2772 : 8d df 55 STA $55df ; (dirty_count + 0)
2775 : ad e0 55 LDA $55e0 ; (dirty_count + 1)
2778 : 85 44 __ STA T1 + 1 
277a : 69 00 __ ADC #$00
277c : 8d e0 55 STA $55e0 ; (dirty_count + 1)
277f : 06 43 __ ASL T1 + 0 
2781 : 26 44 __ ROL T1 + 1 
2783 : 18 __ __ CLC
2784 : a9 a2 __ LDA #$a2
2786 : 65 43 __ ADC T1 + 0 
2788 : 85 43 __ STA T1 + 0 
278a : a9 6d __ LDA #$6d
278c : 65 44 __ ADC T1 + 1 
278e : 85 44 __ STA T1 + 1 
2790 : 98 __ __ TYA
2791 : a0 00 __ LDY #$00
2793 : 91 43 __ STA (T1 + 0),y 
2795 : a5 1c __ LDA ACCU + 1 
2797 : c8 __ __ INY
2798 : 91 43 __ STA (T1 + 0),y 
279a : 8a __ __ TXA
.s9:
279b : 29 03 __ AND #$03
279d : d0 08 __ BNE $27a7 ; (cell.s3 + 0)
.s10:
279f : ee e1 55 INC $55e1 ; (front_count + 0)
27a2 : d0 03 __ BNE $27a7 ; (cell.s3 + 0)
.s14:
27a4 : ee e2 55 INC $55e2 ; (front_count + 1)
.s3:
27a7 : 60 __ __ RTS
--------------------------------------------------------------------
game_over: ; game_over()->void
; 531, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
27a8 : a9 1e __ LDA #$1e
27aa : 8d 4a 7d STA $7d4a ; (death_delay + 0)
27ad : a9 02 __ LDA #$02
27af : 8d e6 3e STA $3ee6 ; (state + 0)
27b2 : a9 4a __ LDA #$4a
27b4 : 85 11 __ STA P4 
27b6 : ad e4 55 LDA $55e4 ; (best + 1)
27b9 : cd e8 3e CMP $3ee8 ; (score + 1)
27bc : d0 06 __ BNE $27c4 ; (game_over.s8 + 0)
.s7:
27be : ad e3 55 LDA $55e3 ; (best + 0)
27c1 : cd e7 3e CMP $3ee7 ; (score + 0)
.s8:
27c4 : b0 0c __ BCS $27d2 ; (game_over.s6 + 0)
.s5:
27c6 : ad e7 3e LDA $3ee7 ; (score + 0)
27c9 : 8d e3 55 STA $55e3 ; (best + 0)
27cc : ad e8 3e LDA $3ee8 ; (score + 1)
27cf : 8d e4 55 STA $55e4 ; (best + 1)
.s6:
27d2 : 20 d1 25 JSR $25d1 ; (number@proxy + 0)
--------------------------------------------------------------------
banner: ; banner()->void
; 473, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
27d5 : a2 00 __ LDX #$00
27d7 : ad e6 3e LDA $3ee6 ; (state + 0)
27da : 85 4a __ STA T4 + 0 
27dc : d0 08 __ BNE $27e6 ; (banner.s6 + 0)
.s5:
27de : a9 01 __ LDA #$01
27e0 : 85 4b __ STA T5 + 0 
27e2 : a9 02 __ LDA #$02
27e4 : d0 04 __ BNE $27ea ; (banner.s7 + 0)
.s6:
27e6 : 86 4b __ STX T5 + 0 
27e8 : a9 06 __ LDA #$06
.s7:
27ea : 86 4c __ STX T6 + 0 
27ec : 8d ea 55 STA $55ea ; (panel_y + 0)
27ef : 85 49 __ STA T3 + 0 
27f1 : a9 0d __ LDA #$0d
27f3 : 85 10 __ STA P3 
.l8:
27f5 : a0 00 __ LDY #$00
27f7 : 84 4d __ STY T7 + 0 
27f9 : 84 43 __ STY T1 + 0 
.l24:
27fb : a5 4c __ LDA T6 + 0 
27fd : f0 08 __ BEQ $2807 ; (banner.s11 + 0)
.s9:
27ff : c9 07 __ CMP #$07
2801 : d0 10 __ BNE $2813 ; (banner.s23 + 0)
.s10:
2803 : a9 02 __ LDA #$02
2805 : 85 43 __ STA T1 + 0 
.s11:
2807 : a5 4d __ LDA T7 + 0 
2809 : c9 01 __ CMP #$01
280b : a9 00 __ LDA #$00
280d : 69 9a __ ADC #$9a
280f : 65 43 __ ADC T1 + 0 
2811 : 85 43 __ STA T1 + 0 
.s23:
2813 : a5 49 __ LDA T3 + 0 
2815 : 85 0e __ STA P1 
.l12:
2817 : a5 43 __ LDA T1 + 0 
2819 : 85 0f __ STA P2 
281b : 98 __ __ TYA
281c : 18 __ __ CLC
281d : 69 1c __ ADC #$1c
281f : 85 0d __ STA P0 
2821 : 20 05 27 JSR $2705 ; (cell.s4 + 0)
2824 : e6 4d __ INC T7 + 0 
2826 : a5 4d __ LDA T7 + 0 
2828 : c9 18 __ CMP #$18
282a : b0 11 __ BCS $283d ; (banner.s14 + 0)
.s13:
282c : a5 0d __ LDA P0 
282e : 69 e5 __ ADC #$e5
2830 : a8 __ __ TAY
2831 : a9 00 __ LDA #$00
2833 : 85 43 __ STA T1 + 0 
2835 : a5 4d __ LDA T7 + 0 
2837 : c9 17 __ CMP #$17
2839 : d0 dc __ BNE $2817 ; (banner.l12 + 0)
283b : f0 be __ BEQ $27fb ; (banner.l24 + 0)
.s14:
283d : e6 49 __ INC T3 + 0 
283f : e6 4c __ INC T6 + 0 
2841 : a5 4c __ LDA T6 + 0 
2843 : c9 08 __ CMP #$08
2845 : 90 ae __ BCC $27f5 ; (banner.l8 + 0)
.s15:
2847 : a5 4b __ LDA T5 + 0 
2849 : f0 1a __ BEQ $2865 ; (banner.s18 + 0)
.s16:
284b : a9 29 __ LDA #$29
284d : 85 13 __ STA P6 
284f : a9 57 __ LDA #$57
2851 : 85 12 __ STA P5 
2853 : 20 cf 28 JSR $28cf ; (panel_text@proxy + 0)
2856 : a9 05 __ LDA #$05
.s22:
2858 : 85 11 __ STA P4 
285a : a9 29 __ LDA #$29
285c : a0 61 __ LDY #$61
.s17:
285e : 84 12 __ STY P5 
2860 : 85 13 __ STA P6 
2862 : 4c d3 28 JMP $28d3 ; (panel_text.s4 + 0)
.s18:
2865 : a5 4a __ LDA T4 + 0 
2867 : c9 02 __ CMP #$02
2869 : d0 49 __ BNE $28b4 ; (banner.s20 + 0)
.s19:
286b : a9 01 __ LDA #$01
286d : 85 11 __ STA P4 
286f : a9 29 __ LDA #$29
2871 : 85 13 __ STA P6 
2873 : a9 6f __ LDA #$6f
2875 : 85 12 __ STA P5 
2877 : 20 d3 28 JSR $28d3 ; (panel_text.s4 + 0)
287a : ad e7 3e LDA $3ee7 ; (score + 0)
287d : 85 0f __ STA P2 
287f : a9 cf __ LDA #$cf
2881 : 85 0d __ STA P0 
2883 : a9 29 __ LDA #$29
2885 : 85 0e __ STA P1 
2887 : ad e8 3e LDA $3ee8 ; (score + 1)
288a : 85 10 __ STA P3 
288c : 20 79 29 JSR $2979 ; (score_line.s4 + 0)
288f : a9 03 __ LDA #$03
2891 : 85 11 __ STA P4 
2893 : 20 e0 3c JSR $3ce0 ; (panel_text@proxy + 0)
2896 : ad e3 55 LDA $55e3 ; (best + 0)
2899 : 85 0f __ STA P2 
289b : a9 d6 __ LDA #$d6
289d : 85 0d __ STA P0 
289f : a9 29 __ LDA #$29
28a1 : 85 0e __ STA P1 
28a3 : ad e4 55 LDA $55e4 ; (best + 1)
28a6 : 85 10 __ STA P3 
28a8 : 20 79 29 JSR $2979 ; (score_line.s4 + 0)
28ab : e6 11 __ INC P4 
28ad : 20 e0 3c JSR $3ce0 ; (panel_text@proxy + 0)
28b0 : a9 06 __ LDA #$06
28b2 : d0 a4 __ BNE $2858 ; (banner.s22 + 0)
.s20:
28b4 : c9 03 __ CMP #$03
28b6 : d0 16 __ BNE $28ce ; (banner.s3 + 0)
.s21:
28b8 : a9 29 __ LDA #$29
28ba : 85 13 __ STA P6 
28bc : a9 dd __ LDA #$dd
28be : 85 12 __ STA P5 
28c0 : 20 cf 28 JSR $28cf ; (panel_text@proxy + 0)
28c3 : a9 05 __ LDA #$05
28c5 : 85 11 __ STA P4 
28c7 : a9 29 __ LDA #$29
28c9 : a0 e4 __ LDY #$e4
28cb : 4c 5e 28 JMP $285e ; (banner.s17 + 0)
.s3:
28ce : 60 __ __ RTS
--------------------------------------------------------------------
panel_text@proxy: ; panel_text@proxy
28cf : a9 02 __ LDA #$02
28d1 : 85 11 __ STA P4 
--------------------------------------------------------------------
panel_text: ; panel_text(u8,const u8*)->void
; 451, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
28d3 : a0 00 __ LDY #$00
28d5 : b1 12 __ LDA (P5),y ; (s + 0)
28d7 : f0 7d __ BEQ $2956 ; (panel_text.s3 + 0)
.s5:
28d9 : 85 48 __ STA T4 + 0 
28db : a5 12 __ LDA P5 ; (s + 0)
28dd : 85 43 __ STA T0 + 0 
28df : a5 13 __ LDA P6 ; (s + 1)
28e1 : 85 44 __ STA T0 + 1 
28e3 : ad ea 55 LDA $55ea ; (panel_y + 0)
28e6 : 18 __ __ CLC
28e7 : 65 11 __ ADC P4 ; (y + 0)
28e9 : 85 47 __ STA T2 + 0 
28eb : a2 00 __ LDX #$00
.l15:
28ed : c8 __ __ INY
28ee : d0 02 __ BNE $28f2 ; (panel_text.s18 + 0)
.s17:
28f0 : e6 44 __ INC T0 + 1 
.s18:
28f2 : e8 __ __ INX
28f3 : b1 43 __ LDA (T0 + 0),y 
28f5 : d0 f6 __ BNE $28ed ; (panel_text.l15 + 0)
.s6:
28f7 : a5 48 __ LDA T4 + 0 
28f9 : f0 5b __ BEQ $2956 ; (panel_text.s3 + 0)
.s7:
28fb : 86 45 __ STX T1 + 0 
28fd : 38 __ __ SEC
28fe : a9 18 __ LDA #$18
2900 : e5 45 __ SBC T1 + 0 
2902 : a8 __ __ TAY
2903 : a9 00 __ LDA #$00
2905 : e9 00 __ SBC #$00
2907 : aa __ __ TAX
2908 : 0a __ __ ASL
2909 : 98 __ __ TYA
290a : 69 00 __ ADC #$00
290c : a8 __ __ TAY
290d : 8a __ __ TXA
290e : 69 00 __ ADC #$00
2910 : 4a __ __ LSR
2911 : 98 __ __ TYA
2912 : 6a __ __ ROR
2913 : 18 __ __ CLC
2914 : 69 1c __ ADC #$1c
2916 : 85 48 __ STA T4 + 0 
2918 : a9 0d __ LDA #$0d
291a : 85 10 __ STA P3 
.l8:
291c : a0 00 __ LDY #$00
291e : 84 0f __ STY P2 
2920 : b1 12 __ LDA (P5),y ; (s + 0)
2922 : c9 30 __ CMP #$30
2924 : 90 17 __ BCC $293d ; (panel_text.s11 + 0)
.s9:
2926 : c9 3a __ CMP #$3a
2928 : b0 07 __ BCS $2931 ; (panel_text.s12 + 0)
.s10:
292a : e9 1e __ SBC #$1e
.s16:
292c : 85 0f __ STA P2 
292e : 4c 3d 29 JMP $293d ; (panel_text.s11 + 0)
.s12:
2931 : c9 41 __ CMP #$41
2933 : 90 08 __ BCC $293d ; (panel_text.s11 + 0)
.s13:
2935 : c9 5b __ CMP #$5b
2937 : b0 04 __ BCS $293d ; (panel_text.s11 + 0)
.s14:
2939 : e9 c0 __ SBC #$c0
293b : 85 0f __ STA P2 
.s11:
293d : a5 48 __ LDA T4 + 0 
293f : 85 0d __ STA P0 
2941 : a5 47 __ LDA T2 + 0 
2943 : 85 0e __ STA P1 
2945 : 20 05 27 JSR $2705 ; (cell.s4 + 0)
2948 : e6 12 __ INC P5 ; (s + 0)
294a : d0 02 __ BNE $294e ; (panel_text.s20 + 0)
.s19:
294c : e6 13 __ INC P6 ; (s + 1)
.s20:
294e : e6 48 __ INC T4 + 0 
2950 : a0 00 __ LDY #$00
2952 : b1 12 __ LDA (P5),y ; (s + 0)
2954 : d0 c6 __ BNE $291c ; (panel_text.l8 + 0)
.s3:
2956 : 60 __ __ RTS
--------------------------------------------------------------------
2957 : __ __ __ BYT 46 4c 41 50 50 59 20 38 30 00                   : FLAPPY 80.
--------------------------------------------------------------------
2961 : __ __ __ BYT 53 50 41 43 45 20 4f 52 20 46 49 52 45 00       : SPACE OR FIRE.
--------------------------------------------------------------------
296f : __ __ __ BYT 47 41 4d 45 20 4f 56 45 52 00                   : GAME OVER.
--------------------------------------------------------------------
score_line: ; score_line(const u8*,u16)->const u8*
; 463, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2979 : a0 00 __ LDY #$00
.l5:
297b : b1 0d __ LDA (P0),y ; (label + 0)
297d : 99 eb 55 STA $55eb,y ; (line[0] + 0)
2980 : c8 __ __ INY
2981 : c0 06 __ CPY #$06
2983 : d0 f6 __ BNE $297b ; (score_line.l5 + 0)
.s6:
2985 : a9 00 __ LDA #$00
2987 : 8d f5 55 STA $55f5 ; (line[0] + 10)
298a : a5 0f __ LDA P2 ; (n + 0)
298c : 85 1b __ STA ACCU + 0 
298e : a5 10 __ LDA P3 ; (n + 1)
2990 : 85 1c __ STA ACCU + 1 
2992 : a9 0a __ LDA #$0a
2994 : 20 5a 3c JSR $3c5a ; (divmod + 53)
2997 : 18 __ __ CLC
2998 : a5 05 __ LDA WORK + 2 
299a : 69 30 __ ADC #$30
299c : 8d f4 55 STA $55f4 ; (line[0] + 9)
299f : a9 0a __ LDA #$0a
29a1 : 20 5a 3c JSR $3c5a ; (divmod + 53)
29a4 : 18 __ __ CLC
29a5 : a5 05 __ LDA WORK + 2 
29a7 : 69 30 __ ADC #$30
29a9 : 8d f3 55 STA $55f3 ; (line[0] + 8)
29ac : a9 0a __ LDA #$0a
29ae : 20 5a 3c JSR $3c5a ; (divmod + 53)
29b1 : 18 __ __ CLC
29b2 : a5 05 __ LDA WORK + 2 
29b4 : 69 30 __ ADC #$30
29b6 : 8d f2 55 STA $55f2 ; (line[0] + 7)
29b9 : a9 0a __ LDA #$0a
29bb : 20 5a 3c JSR $3c5a ; (divmod + 53)
29be : 18 __ __ CLC
29bf : a5 05 __ LDA WORK + 2 
29c1 : 69 30 __ ADC #$30
29c3 : 8d f1 55 STA $55f1 ; (line[0] + 6)
29c6 : a9 eb __ LDA #$eb
29c8 : 85 1b __ STA ACCU + 0 
29ca : a9 55 __ LDA #$55
29cc : 85 1c __ STA ACCU + 1 
.s3:
29ce : 60 __ __ RTS
--------------------------------------------------------------------
29cf : __ __ __ BYT 53 43 4f 52 45 20 00                            : SCORE .
--------------------------------------------------------------------
29d6 : __ __ __ BYT 42 45 53 54 20 20 00                            : BEST  .
--------------------------------------------------------------------
29dd : __ __ __ BYT 50 41 55 53 45 44 00                            : PAUSED.
--------------------------------------------------------------------
29e4 : __ __ __ BYT 50 20 54 4f 20 43 4f 4e 54 49 4e 55 45 00       : P TO CONTINUE.
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/string.h"
.s4:
29f2 : a5 0f __ LDA P2 
29f4 : a6 12 __ LDX P5 
29f6 : f0 0c __ BEQ $2a04 ; (memset.s4 + 18)
29f8 : a0 00 __ LDY #$00
29fa : 91 0d __ STA (P0),y 
29fc : c8 __ __ INY
29fd : d0 fb __ BNE $29fa ; (memset.s4 + 8)
29ff : e6 0e __ INC P1 
2a01 : ca __ __ DEX
2a02 : d0 f6 __ BNE $29fa ; (memset.s4 + 8)
2a04 : a4 11 __ LDY P4 
2a06 : f0 05 __ BEQ $2a0d ; (memset.s3 + 0)
2a08 : 88 __ __ DEY
2a09 : 91 0d __ STA (P0),y 
2a0b : d0 fb __ BNE $2a08 ; (memset.s4 + 22)
.s3:
2a0d : 60 __ __ RTS
--------------------------------------------------------------------
wait_frame: ; wait_frame()->void
; 168, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2a0e : ad 00 d6 LDA $d600 
2a11 : 29 20 __ AND #$20
2a13 : f0 21 __ BEQ $2a36 ; (wait_frame.l6 + 0)
.s5:
2a15 : 20 45 2a JSR $2a45 ; (stopwatch.l4 + 0)
2a18 : ad f6 55 LDA $55f6 ; (show_time + 0)
2a1b : 38 __ __ SEC
2a1c : e5 1b __ SBC ACCU + 0 
2a1e : 85 1b __ STA ACCU + 0 
2a20 : ad f7 55 LDA $55f7 ; (show_time + 1)
2a23 : e5 1c __ SBC ACCU + 1 
2a25 : 85 1c __ STA ACCU + 1 
2a27 : a9 27 __ LDA #$27
2a29 : c5 1c __ CMP ACCU + 1 
2a2b : f0 03 __ BEQ $2a30 ; (wait_frame.s8 + 0)
.s9:
2a2d : b0 07 __ BCS $2a36 ; (wait_frame.l6 + 0)
2a2f : 60 __ __ RTS
.s8:
2a30 : a5 1b __ LDA ACCU + 0 
2a32 : c9 11 __ CMP #$11
2a34 : b0 0e __ BCS $2a44 ; (wait_frame.s3 + 0)
.l6:
2a36 : ad 00 d6 LDA $d600 
2a39 : 29 20 __ AND #$20
2a3b : d0 f9 __ BNE $2a36 ; (wait_frame.l6 + 0)
.l7:
2a3d : ad 00 d6 LDA $d600 
2a40 : 29 20 __ AND #$20
2a42 : f0 f9 __ BEQ $2a3d ; (wait_frame.l7 + 0)
.s3:
2a44 : 60 __ __ RTS
--------------------------------------------------------------------
stopwatch: ; stopwatch()->u16
; 154, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.l4:
2a45 : ac 05 dd LDY $dd05 
2a48 : ad 04 dd LDA $dd04 
2a4b : cc 05 dd CPY $dd05 
2a4e : d0 f5 __ BNE $2a45 ; (stopwatch.l4 + 0)
.s3:
2a50 : 84 1c __ STY ACCU + 1 
2a52 : 85 1b __ STA ACCU + 0 
2a54 : 60 __ __ RTS
--------------------------------------------------------------------
show_frame: ; show_frame()->void
; 767, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
2a55 : a5 53 __ LDA T0 + 0 
2a57 : 8d f0 bf STA $bff0 ; (show_frame@stack + 0)
2a5a : a5 54 __ LDA T0 + 1 
2a5c : 8d f1 bf STA $bff1 ; (show_frame@stack + 1)
.s4:
2a5f : 20 45 2a JSR $2a45 ; (stopwatch.l4 + 0)
2a62 : a9 1c __ LDA #$1c
2a64 : 8d 00 d6 STA $d600 
2a67 : a5 1b __ LDA ACCU + 0 
2a69 : 8d f6 55 STA $55f6 ; (show_time + 0)
2a6c : a5 1c __ LDA ACCU + 1 
2a6e : 8d f7 55 STA $55f7 ; (show_time + 1)
2a71 : ad 54 3f LDA $3f54 ; (saved_regs[0] + 28)
2a74 : 29 0f __ AND #$0f
2a76 : 09 10 __ ORA #$10
2a78 : 85 53 __ STA T0 + 0 
2a7a : ad ed 3e LDA $3eed ; (phase + 0)
2a7d : 18 __ __ CLC
2a7e : 69 01 __ ADC #$01
2a80 : 0a __ __ ASL
2a81 : 0a __ __ ASL
2a82 : 0a __ __ ASL
2a83 : 0a __ __ ASL
2a84 : 0a __ __ ASL
2a85 : 05 53 __ ORA T0 + 0 
.l5:
2a87 : 2c 00 d6 BIT $d600 
2a8a : 10 fb __ BPL $2a87 ; (show_frame.l5 + 0)
.s6:
2a8c : 8d 01 d6 STA $d601 
2a8f : ad f8 55 LDA $55f8 ; (flash + 0)
2a92 : f0 18 __ BEQ $2aac ; (show_frame.s11 + 0)
.s7:
2a94 : a9 1a __ LDA #$1a
2a96 : 8d 00 d6 STA $d600 
2a99 : ce f8 55 DEC $55f8 ; (flash + 0)
2a9c : f0 04 __ BEQ $2aa2 ; (show_frame.s61 + 0)
.s8:
2a9e : a9 0f __ LDA #$0f
2aa0 : d0 02 __ BNE $2aa4 ; (show_frame.l9 + 0)
.s61:
2aa2 : a9 06 __ LDA #$06
.l9:
2aa4 : 2c 00 d6 BIT $d600 
2aa7 : 10 fb __ BPL $2aa4 ; (show_frame.l9 + 0)
.s10:
2aa9 : 8d 01 d6 STA $d601 
.s11:
2aac : 20 bb 2c JSR $2cbb ; (load_pose.s4 + 0)
2aaf : ad e9 55 LDA $55e9 ; (bird_set + 0)
2ab2 : 8d e8 55 STA $55e8 ; (shown_set + 0)
2ab5 : ad ff 3c LDA $3cff ; (bird_row + 0)
2ab8 : 8d b4 3e STA $3eb4 ; (shown_row + 0)
2abb : ad 00 d6 LDA $d600 
2abe : 29 20 __ AND #$20
2ac0 : d0 08 __ BNE $2aca ; (show_frame.s12 + 0)
.s60:
2ac2 : ee fd 55 INC $55fd ; (blank_overruns + 0)
2ac5 : d0 03 __ BNE $2aca ; (show_frame.s12 + 0)
.s72:
2ac7 : ee fe 55 INC $55fe ; (blank_overruns + 1)
.s12:
2aca : ee 42 7d INC $7d42 ; (frame_count + 0)
2acd : d0 03 __ BNE $2ad2 ; (show_frame.s63 + 0)
.s62:
2acf : ee 43 7d INC $7d43 ; (frame_count + 1)
.s63:
2ad2 : ad ff 55 LDA $55ff ; (flip + 0)
2ad5 : d0 25 __ BNE $2afc ; (show_frame.s13 + 0)
.s16:
2ad7 : ad e2 55 LDA $55e2 ; (front_count + 1)
2ada : 0d e1 55 ORA $55e1 ; (front_count + 0)
2add : f0 18 __ BEQ $2af7 ; (show_frame.s20 + 0)
.s17:
2adf : a9 03 __ LDA #$03
2ae1 : 85 11 __ STA P4 
2ae3 : ad 44 7d LDA $7d44 ; (page + 0)
2ae6 : f0 08 __ BEQ $2af0 ; (show_frame.s59 + 0)
.s18:
2ae8 : a9 00 __ LDA #$00
2aea : 85 0f __ STA P2 
2aec : a9 10 __ LDA #$10
2aee : d0 02 __ BNE $2af2 ; (show_frame.s19 + 0)
.s59:
2af0 : 85 0f __ STA P2 
.s19:
2af2 : 85 10 __ STA P3 
2af4 : 20 65 2d JSR $2d65 ; (write_cells.s4 + 0)
.s20:
2af7 : ad dd 55 LDA $55dd ; (redrawn + 0)
2afa : d0 2e __ BNE $2b2a ; (show_frame.s21 + 0)
.s13:
2afc : ae e6 3e LDX $3ee6 ; (state + 0)
2aff : ca __ __ DEX
2b00 : d0 1d __ BNE $2b1f ; (show_frame.s3 + 0)
.s14:
2b02 : ad 45 7d LDA $7d45 ; (prerendered + 0)
2b05 : 4c 1b 2b JMP $2b1b ; (show_frame.l74 + 0)
.s15:
2b08 : ad 45 7d LDA $7d45 ; (prerendered + 0)
2b0b : 85 53 __ STA T0 + 0 
2b0d : 85 17 __ STA P10 
2b0f : e6 53 __ INC T0 + 0 
2b11 : a5 53 __ LDA T0 + 0 
2b13 : 8d 45 7d STA $7d45 ; (prerendered + 0)
2b16 : 20 7c 2f JSR $2f7c ; (prerender.s1 + 0)
2b19 : a5 53 __ LDA T0 + 0 
.l74:
2b1b : c9 04 __ CMP #$04
2b1d : 90 e9 __ BCC $2b08 ; (show_frame.s15 + 0)
.s3:
2b1f : ad f0 bf LDA $bff0 ; (show_frame@stack + 0)
2b22 : 85 53 __ STA T0 + 0 
2b24 : ad f1 bf LDA $bff1 ; (show_frame@stack + 1)
2b27 : 85 54 __ STA T0 + 1 
2b29 : 60 __ __ RTS
.s21:
2b2a : a9 ff __ LDA #$ff
2b2c : 8d fb 55 STA $55fb ; (copy_dst + 0)
2b2f : 8d fc 55 STA $55fc ; (copy_dst + 1)
2b32 : 8d f9 55 STA $55f9 ; (copy_src + 0)
2b35 : 8d fa 55 STA $55fa ; (copy_src + 1)
2b38 : a9 00 __ LDA #$00
2b3a : 85 45 __ STA T2 + 0 
2b3c : 85 46 __ STA T2 + 1 
2b3e : a2 18 __ LDX #$18
2b40 : ad 44 7d LDA $7d44 ; (page + 0)
2b43 : f0 10 __ BEQ $2b55 ; (show_frame.s58 + 0)
.s22:
2b45 : 86 44 __ STX T1 + 1 
2b47 : a9 00 __ LDA #$00
2b49 : 85 53 __ STA T0 + 0 
2b4b : a9 10 __ LDA #$10
2b4d : 85 54 __ STA T0 + 1 
2b4f : a9 08 __ LDA #$08
2b51 : 85 48 __ STA T3 + 1 
2b53 : d0 0e __ BNE $2b63 ; (show_frame.s23 + 0)
.s58:
2b55 : 86 48 __ STX T3 + 1 
2b57 : 85 53 __ STA T0 + 0 
2b59 : 85 54 __ STA T0 + 1 
2b5b : a9 10 __ LDA #$10
2b5d : 85 46 __ STA T2 + 1 
2b5f : a9 08 __ LDA #$08
2b61 : 85 44 __ STA T1 + 1 
.s23:
2b63 : a2 00 __ LDX #$00
2b65 : 86 4a __ STX T4 + 1 
.l24:
2b67 : ad fc 55 LDA $55fc ; (copy_dst + 1)
2b6a : 45 46 __ EOR T2 + 1 
2b6c : f0 0f __ BEQ $2b7d ; (show_frame.s28 + 0)
.s25:
2b6e : a9 12 __ LDA #$12
2b70 : 8d 00 d6 STA $d600 
.l26:
2b73 : 2c 00 d6 BIT $d600 
2b76 : 10 fb __ BPL $2b73 ; (show_frame.l26 + 0)
.s27:
2b78 : a5 46 __ LDA T2 + 1 
2b7a : 8d 01 d6 STA $d601 
.s28:
2b7d : a9 13 __ LDA #$13
2b7f : 8d 00 d6 STA $d600 
.l29:
2b82 : 2c 00 d6 BIT $d600 
2b85 : 10 fb __ BPL $2b82 ; (show_frame.l29 + 0)
.s30:
2b87 : a5 45 __ LDA T2 + 0 
2b89 : 8d 01 d6 STA $d601 
2b8c : ad fa 55 LDA $55fa ; (copy_src + 1)
2b8f : 45 54 __ EOR T0 + 1 
2b91 : f0 0f __ BEQ $2ba2 ; (show_frame.s34 + 0)
.s31:
2b93 : a9 20 __ LDA #$20
2b95 : 8d 00 d6 STA $d600 
.l32:
2b98 : 2c 00 d6 BIT $d600 
2b9b : 10 fb __ BPL $2b98 ; (show_frame.l32 + 0)
.s33:
2b9d : a5 54 __ LDA T0 + 1 
2b9f : 8d 01 d6 STA $d601 
.s34:
2ba2 : a9 21 __ LDA #$21
2ba4 : 8d 00 d6 STA $d600 
.l35:
2ba7 : 2c 00 d6 BIT $d600 
2baa : 10 fb __ BPL $2ba7 ; (show_frame.l35 + 0)
.s36:
2bac : a5 53 __ LDA T0 + 0 
2bae : 8d 01 d6 STA $d601 
2bb1 : a9 1e __ LDA #$1e
2bb3 : 8d 00 d6 STA $d600 
.l37:
2bb6 : 2c 00 d6 BIT $d600 
2bb9 : 10 fb __ BPL $2bb6 ; (show_frame.l37 + 0)
.s38:
2bbb : a9 fa __ LDA #$fa
2bbd : 8d 01 d6 STA $d601 
2bc0 : 18 __ __ CLC
2bc1 : a5 44 __ LDA T1 + 1 
2bc3 : 65 4a __ ADC T4 + 1 
2bc5 : a8 __ __ TAY
2bc6 : 18 __ __ CLC
2bc7 : a5 53 __ LDA T0 + 0 
2bc9 : 69 fa __ ADC #$fa
2bcb : 85 53 __ STA T0 + 0 
2bcd : 90 03 __ BCC $2bd2 ; (show_frame.s65 + 0)
.s64:
2bcf : e6 54 __ INC T0 + 1 
2bd1 : 18 __ __ CLC
.s65:
2bd2 : a5 48 __ LDA T3 + 1 
2bd4 : 65 4a __ ADC T4 + 1 
2bd6 : 85 4e __ STA T6 + 1 
2bd8 : 18 __ __ CLC
2bd9 : a5 45 __ LDA T2 + 0 
2bdb : 69 fa __ ADC #$fa
2bdd : 85 45 __ STA T2 + 0 
2bdf : a5 46 __ LDA T2 + 1 
2be1 : 69 00 __ ADC #$00
2be3 : 85 46 __ STA T2 + 1 
2be5 : 45 4e __ EOR T6 + 1 
2be7 : f0 0f __ BEQ $2bf8 ; (show_frame.s42 + 0)
.s39:
2be9 : a9 12 __ LDA #$12
2beb : 8d 00 d6 STA $d600 
.l40:
2bee : 2c 00 d6 BIT $d600 
2bf1 : 10 fb __ BPL $2bee ; (show_frame.l40 + 0)
.s41:
2bf3 : a5 4e __ LDA T6 + 1 
2bf5 : 8d 01 d6 STA $d601 
.s42:
2bf8 : a9 13 __ LDA #$13
2bfa : 8d 00 d6 STA $d600 
.l43:
2bfd : 2c 00 d6 BIT $d600 
2c00 : 10 fb __ BPL $2bfd ; (show_frame.l43 + 0)
.s44:
2c02 : 8e 01 d6 STX $d601 
2c05 : 98 __ __ TYA
2c06 : 45 54 __ EOR T0 + 1 
2c08 : f0 0d __ BEQ $2c17 ; (show_frame.s48 + 0)
.s45:
2c0a : a9 20 __ LDA #$20
2c0c : 8d 00 d6 STA $d600 
.l46:
2c0f : 2c 00 d6 BIT $d600 
2c12 : 10 fb __ BPL $2c0f ; (show_frame.l46 + 0)
.s47:
2c14 : 8c 01 d6 STY $d601 
.s48:
2c17 : a9 21 __ LDA #$21
2c19 : 8d 00 d6 STA $d600 
.l49:
2c1c : 2c 00 d6 BIT $d600 
2c1f : 10 fb __ BPL $2c1c ; (show_frame.l49 + 0)
.s50:
2c21 : 8e 01 d6 STX $d601 
2c24 : a9 1e __ LDA #$1e
2c26 : 8d 00 d6 STA $d600 
.l51:
2c29 : 2c 00 d6 BIT $d600 
2c2c : 10 fb __ BPL $2c29 ; (show_frame.l51 + 0)
.s52:
2c2e : a9 fa __ LDA #$fa
2c30 : 8d 01 d6 STA $d601 
2c33 : 8a __ __ TXA
2c34 : 18 __ __ CLC
2c35 : 69 fa __ ADC #$fa
2c37 : 8d fb 55 STA $55fb ; (copy_dst + 0)
2c3a : a5 4e __ LDA T6 + 1 
2c3c : 69 00 __ ADC #$00
2c3e : 8d fc 55 STA $55fc ; (copy_dst + 1)
2c41 : 8a __ __ TXA
2c42 : 18 __ __ CLC
2c43 : 69 fa __ ADC #$fa
2c45 : 8d f9 55 STA $55f9 ; (copy_src + 0)
2c48 : 90 02 __ BCC $2c4c ; (show_frame.s67 + 0)
.s66:
2c4a : c8 __ __ INY
2c4b : 18 __ __ CLC
.s67:
2c4c : 8c fa 55 STY $55fa ; (copy_src + 1)
2c4f : 8a __ __ TXA
2c50 : 69 fa __ ADC #$fa
2c52 : aa __ __ TAX
2c53 : a5 4a __ LDA T4 + 1 
2c55 : 69 00 __ ADC #$00
2c57 : 85 4a __ STA T4 + 1 
2c59 : c9 06 __ CMP #$06
2c5b : b0 03 __ BCS $2c60 ; (show_frame.s73 + 0)
2c5d : 4c 67 2b JMP $2b67 ; (show_frame.l24 + 0)
.s73:
2c60 : d0 04 __ BNE $2c66 ; (show_frame.s53 + 0)
.s57:
2c62 : e0 d7 __ CPX #$d7
2c64 : 90 f7 __ BCC $2c5d ; (show_frame.s67 + 17)
.s53:
2c66 : a9 00 __ LDA #$00
2c68 : 8d 45 7d STA $7d45 ; (prerendered + 0)
2c6b : ad df 55 LDA $55df ; (dirty_count + 0)
2c6e : 85 53 __ STA T0 + 0 
2c70 : 0d e0 55 ORA $55e0 ; (dirty_count + 1)
2c73 : f0 3a __ BEQ $2caf ; (show_frame.s56 + 0)
.s54:
2c75 : a9 a2 __ LDA #$a2
2c77 : 85 43 __ STA T1 + 0 
2c79 : a9 6d __ LDA #$6d
2c7b : 85 44 __ STA T1 + 1 
2c7d : ae e0 55 LDX $55e0 ; (dirty_count + 1)
.l55:
2c80 : a0 00 __ LDY #$00
2c82 : b1 43 __ LDA (T1 + 0),y 
2c84 : 18 __ __ CLC
2c85 : 69 d2 __ ADC #$d2
2c87 : 85 45 __ STA T2 + 0 
2c89 : a9 65 __ LDA #$65
2c8b : c8 __ __ INY
2c8c : 71 43 __ ADC (T1 + 0),y 
2c8e : 85 46 __ STA T2 + 1 
2c90 : a9 00 __ LDA #$00
2c92 : a8 __ __ TAY
2c93 : 91 45 __ STA (T2 + 0),y 
2c95 : 18 __ __ CLC
2c96 : a5 43 __ LDA T1 + 0 
2c98 : 69 02 __ ADC #$02
2c9a : 85 43 __ STA T1 + 0 
2c9c : 90 02 __ BCC $2ca0 ; (show_frame.s69 + 0)
.s68:
2c9e : e6 44 __ INC T1 + 1 
.s69:
2ca0 : 38 __ __ SEC
2ca1 : a5 53 __ LDA T0 + 0 
2ca3 : e9 01 __ SBC #$01
2ca5 : 85 53 __ STA T0 + 0 
2ca7 : b0 01 __ BCS $2caa ; (show_frame.s71 + 0)
.s70:
2ca9 : ca __ __ DEX
.s71:
2caa : 8a __ __ TXA
2cab : 05 53 __ ORA T0 + 0 
2cad : d0 d1 __ BNE $2c80 ; (show_frame.l55 + 0)
.s56:
2caf : 8d dd 55 STA $55dd ; (redrawn + 0)
2cb2 : 8d df 55 STA $55df ; (dirty_count + 0)
2cb5 : 8d e0 55 STA $55e0 ; (dirty_count + 1)
2cb8 : 4c fc 2a JMP $2afc ; (show_frame.s13 + 0)
--------------------------------------------------------------------
load_pose: ; load_pose()->void
; 394, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2cbb : ad e9 55 LDA $55e9 ; (bird_set + 0)
2cbe : 0a __ __ ASL
2cbf : 0a __ __ ASL
2cc0 : 6d ed 3e ADC $3eed ; (phase + 0)
2cc3 : aa __ __ TAX
2cc4 : ad e7 55 LDA $55e7 ; (bird_pose + 0)
2cc7 : dd de 3e CMP $3ede,x ; (set_pose[0][0] + 0)
2cca : d0 01 __ BNE $2ccd ; (load_pose.s5 + 0)
2ccc : 60 __ __ RTS
.s5:
2ccd : 9d de 3e STA $3ede,x ; (set_pose[0][0] + 0)
2cd0 : a9 12 __ LDA #$12
2cd2 : 8d 00 d6 STA $d600 
2cd5 : ad e7 55 LDA $55e7 ; (bird_pose + 0)
2cd8 : 85 1b __ STA ACCU + 0 
2cda : a9 00 __ LDA #$00
2cdc : 85 1c __ STA ACCU + 1 
2cde : a9 f0 __ LDA #$f0
2ce0 : 20 ed 3b JSR $3bed ; (mul16by8 + 0)
2ce3 : 18 __ __ CLC
2ce4 : a5 1c __ LDA ACCU + 1 
2ce6 : 69 90 __ ADC #$90
2ce8 : aa __ __ TAX
2ce9 : 38 __ __ SEC
2cea : a9 00 __ LDA #$00
2cec : ed e9 55 SBC $55e9 ; (bird_set + 0)
2cef : 29 f0 __ AND #$f0
2cf1 : ac ed 3e LDY $3eed ; (phase + 0)
2cf4 : 19 bf 3c ORA $3cbf,y ; (__multab8192L + 0)
2cf7 : 85 1d __ STA ACCU + 2 
2cf9 : b9 c4 3c LDA $3cc4,y ; (__multab8192H + 0)
2cfc : 18 __ __ CLC
2cfd : 69 26 __ ADC #$26
.l6:
2cff : 2c 00 d6 BIT $d600 
2d02 : 10 fb __ BPL $2cff ; (load_pose.l6 + 0)
.s7:
2d04 : 8d 01 d6 STA $d601 
2d07 : a0 13 __ LDY #$13
2d09 : 8c 00 d6 STY $d600 
.l8:
2d0c : 2c 00 d6 BIT $d600 
2d0f : 10 fb __ BPL $2d0c ; (load_pose.l8 + 0)
.s9:
2d11 : a8 __ __ TAY
2d12 : a5 1d __ LDA ACCU + 2 
2d14 : 8d 01 d6 STA $d601 
2d17 : 8a __ __ TXA
2d18 : 49 ff __ EOR #$ff
2d1a : f0 0d __ BEQ $2d29 ; (load_pose.s13 + 0)
.s10:
2d1c : a9 20 __ LDA #$20
2d1e : 8d 00 d6 STA $d600 
.l11:
2d21 : 2c 00 d6 BIT $d600 
2d24 : 10 fb __ BPL $2d21 ; (load_pose.l11 + 0)
.s12:
2d26 : 8e 01 d6 STX $d601 
.s13:
2d29 : a9 21 __ LDA #$21
2d2b : 8d 00 d6 STA $d600 
.l14:
2d2e : 2c 00 d6 BIT $d600 
2d31 : 10 fb __ BPL $2d2e ; (load_pose.l14 + 0)
.s15:
2d33 : a5 1b __ LDA ACCU + 0 
2d35 : 8d 01 d6 STA $d601 
2d38 : a9 1e __ LDA #$1e
2d3a : 8d 00 d6 STA $d600 
.l16:
2d3d : 2c 00 d6 BIT $d600 
2d40 : 10 fb __ BPL $2d3d ; (load_pose.l16 + 0)
.s17:
2d42 : a9 f0 __ LDA #$f0
2d44 : 8d 01 d6 STA $d601 
2d47 : 18 __ __ CLC
2d48 : a5 1d __ LDA ACCU + 2 
2d4a : 69 f0 __ ADC #$f0
2d4c : 8d fb 55 STA $55fb ; (copy_dst + 0)
2d4f : 90 02 __ BCC $2d53 ; (load_pose.s19 + 0)
.s18:
2d51 : c8 __ __ INY
2d52 : 18 __ __ CLC
.s19:
2d53 : 8c fc 55 STY $55fc ; (copy_dst + 1)
2d56 : a5 1b __ LDA ACCU + 0 
2d58 : 69 f0 __ ADC #$f0
2d5a : 8d f9 55 STA $55f9 ; (copy_src + 0)
2d5d : a5 1c __ LDA ACCU + 1 
2d5f : 69 90 __ ADC #$90
2d61 : 8d fa 55 STA $55fa ; (copy_src + 1)
.s3:
2d64 : 60 __ __ RTS
--------------------------------------------------------------------
write_cells: ; write_cells(u16,u8)->void
; 684, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
2d65 : ad df 55 LDA $55df ; (dirty_count + 0)
2d68 : 0a __ __ ASL
2d69 : aa __ __ TAX
2d6a : ad e0 55 LDA $55e0 ; (dirty_count + 1)
2d6d : 2a __ __ ROL
2d6e : 85 1c __ STA ACCU + 1 
2d70 : 8a __ __ TXA
2d71 : 18 __ __ CLC
2d72 : 69 a2 __ ADC #$a2
2d74 : 85 45 __ STA T2 + 0 
2d76 : a9 6d __ LDA #$6d
2d78 : 65 1c __ ADC ACCU + 1 
2d7a : 85 46 __ STA T2 + 1 
2d7c : a5 11 __ LDA P4 ; (bits + 0)
2d7e : 85 47 __ STA T3 + 0 
2d80 : a9 a2 __ LDA #$a2
2d82 : 85 48 __ STA T4 + 0 
2d84 : a9 6d __ LDA #$6d
2d86 : 85 49 __ STA T4 + 1 
2d88 : 8a __ __ TXA
2d89 : 05 1c __ ORA ACCU + 1 
2d8b : f0 48 __ BEQ $2dd5 ; (write_cells.s17 + 0)
.s5:
2d8d : a5 11 __ LDA P4 ; (bits + 0)
2d8f : 29 05 __ AND #$05
2d91 : 85 4a __ STA T5 + 0 
2d93 : a9 ff __ LDA #$ff
2d95 : 85 1b __ STA ACCU + 0 
2d97 : 85 1c __ STA ACCU + 1 
2d99 : a9 a2 __ LDA #$a2
2d9b : 85 4b __ STA T6 + 0 
2d9d : a9 6d __ LDA #$6d
2d9f : 85 4c __ STA T6 + 1 
.l6:
2da1 : a0 00 __ LDY #$00
2da3 : b1 4b __ LDA (T6 + 0),y 
2da5 : 85 4d __ STA T7 + 0 
2da7 : a9 d2 __ LDA #$d2
2da9 : 85 43 __ STA T1 + 0 
2dab : 18 __ __ CLC
2dac : c8 __ __ INY
2dad : b1 4b __ LDA (T6 + 0),y 
2daf : 85 4e __ STA T7 + 1 
2db1 : 69 65 __ ADC #$65
2db3 : 85 44 __ STA T1 + 1 
2db5 : a4 4d __ LDY T7 + 0 
2db7 : b1 43 __ LDA (T1 + 0),y 
2db9 : 25 4a __ AND T5 + 0 
2dbb : f0 03 __ BEQ $2dc0 ; (write_cells.s16 + 0)
2dbd : 4c f9 2e JMP $2ef9 ; (write_cells.s7 + 0)
.s16:
2dc0 : 18 __ __ CLC
2dc1 : a5 4b __ LDA T6 + 0 
2dc3 : 69 02 __ ADC #$02
2dc5 : 85 4b __ STA T6 + 0 
2dc7 : 90 02 __ BCC $2dcb ; (write_cells.s58 + 0)
.s57:
2dc9 : e6 4c __ INC T6 + 1 
.s58:
2dcb : c5 45 __ CMP T2 + 0 
2dcd : d0 d2 __ BNE $2da1 ; (write_cells.l6 + 0)
.s46:
2dcf : a5 4c __ LDA T6 + 1 
2dd1 : c5 46 __ CMP T2 + 1 
2dd3 : d0 cc __ BNE $2da1 ; (write_cells.l6 + 0)
.s17:
2dd5 : a5 45 __ LDA T2 + 0 
2dd7 : c9 a2 __ CMP #$a2
2dd9 : d0 06 __ BNE $2de1 ; (write_cells.s18 + 0)
.s45:
2ddb : a5 46 __ LDA T2 + 1 
2ddd : c9 6d __ CMP #$6d
2ddf : f0 78 __ BEQ $2e59 ; (write_cells.s34 + 0)
.s18:
2de1 : a5 47 __ LDA T3 + 0 
2de3 : 29 0a __ AND #$0a
2de5 : 85 47 __ STA T3 + 0 
2de7 : 18 __ __ CLC
2de8 : a5 10 __ LDA P3 ; (base + 1)
2dea : 69 08 __ ADC #$08
2dec : 85 10 __ STA P3 ; (base + 1)
2dee : a9 ff __ LDA #$ff
2df0 : 85 1b __ STA ACCU + 0 
2df2 : 85 1c __ STA ACCU + 1 
2df4 : a9 a2 __ LDA #$a2
2df6 : 85 4b __ STA T6 + 0 
2df8 : a9 6d __ LDA #$6d
2dfa : 85 4c __ STA T6 + 1 
2dfc : a9 d2 __ LDA #$d2
2dfe : 85 4f __ STA T8 + 0 
.l19:
2e00 : a0 00 __ LDY #$00
2e02 : b1 4b __ LDA (T6 + 0),y 
2e04 : 85 4d __ STA T7 + 0 
2e06 : 18 __ __ CLC
2e07 : c8 __ __ INY
2e08 : b1 4b __ LDA (T6 + 0),y 
2e0a : 85 4e __ STA T7 + 1 
2e0c : 69 65 __ ADC #$65
2e0e : 85 50 __ STA T8 + 1 
2e10 : a4 4d __ LDY T7 + 0 
2e12 : b1 4f __ LDA (T8 + 0),y 
2e14 : 85 51 __ STA T11 + 0 
2e16 : 25 47 __ AND T3 + 0 
2e18 : d0 5c __ BNE $2e76 ; (write_cells.s20 + 0)
.s29:
2e1a : a5 51 __ LDA T11 + 0 
2e1c : a6 11 __ LDX P4 ; (bits + 0)
2e1e : e0 0c __ CPX #$0c
2e20 : f0 05 __ BEQ $2e27 ; (write_cells.s30 + 0)
.s36:
2e22 : 29 0c __ AND #$0c
2e24 : 4c 2b 2e JMP $2e2b ; (write_cells.s31 + 0)
.s30:
2e27 : 29 03 __ AND #$03
2e29 : 0a __ __ ASL
2e2a : 0a __ __ ASL
.s31:
2e2b : 91 4f __ STA (T8 + 0),y 
2e2d : f0 15 __ BEQ $2e44 ; (write_cells.s33 + 0)
.s32:
2e2f : 98 __ __ TYA
2e30 : a0 00 __ LDY #$00
2e32 : 91 48 __ STA (T4 + 0),y 
2e34 : a5 4e __ LDA T7 + 1 
2e36 : c8 __ __ INY
2e37 : 91 48 __ STA (T4 + 0),y 
2e39 : 18 __ __ CLC
2e3a : a5 48 __ LDA T4 + 0 
2e3c : 69 02 __ ADC #$02
2e3e : 85 48 __ STA T4 + 0 
2e40 : 90 02 __ BCC $2e44 ; (write_cells.s33 + 0)
.s59:
2e42 : e6 49 __ INC T4 + 1 
.s33:
2e44 : 18 __ __ CLC
2e45 : a5 4b __ LDA T6 + 0 
2e47 : 69 02 __ ADC #$02
2e49 : 85 4b __ STA T6 + 0 
2e4b : 90 02 __ BCC $2e4f ; (write_cells.s61 + 0)
.s60:
2e4d : e6 4c __ INC T6 + 1 
.s61:
2e4f : c5 45 __ CMP T2 + 0 
2e51 : d0 ad __ BNE $2e00 ; (write_cells.l19 + 0)
.s35:
2e53 : a5 4c __ LDA T6 + 1 
2e55 : c5 46 __ CMP T2 + 1 
2e57 : d0 a7 __ BNE $2e00 ; (write_cells.l19 + 0)
.s34:
2e59 : a9 00 __ LDA #$00
2e5b : 8d e1 55 STA $55e1 ; (front_count + 0)
2e5e : 8d e2 55 STA $55e2 ; (front_count + 1)
2e61 : a5 48 __ LDA T4 + 0 
2e63 : e9 a2 __ SBC #$a2
2e65 : aa __ __ TAX
2e66 : a5 49 __ LDA T4 + 1 
2e68 : e9 6d __ SBC #$6d
2e6a : c9 80 __ CMP #$80
2e6c : 6a __ __ ROR
2e6d : 8d e0 55 STA $55e0 ; (dirty_count + 1)
2e70 : 8a __ __ TXA
2e71 : 6a __ __ ROR
2e72 : 8d df 55 STA $55df ; (dirty_count + 0)
.s3:
2e75 : 60 __ __ RTS
.s20:
2e76 : a5 1c __ LDA ACCU + 1 
2e78 : c5 4e __ CMP T7 + 1 
2e7a : d0 04 __ BNE $2e80 ; (write_cells.s44 + 0)
.s43:
2e7c : a5 1b __ LDA ACCU + 0 
2e7e : c5 4d __ CMP T7 + 0 
.s44:
2e80 : b0 5c __ BCS $2ede ; (write_cells.s39 + 0)
.s21:
2e82 : 98 __ __ TYA
2e83 : 38 __ __ SEC
2e84 : e5 1b __ SBC ACCU + 0 
2e86 : aa __ __ TAX
2e87 : a5 4e __ LDA T7 + 1 
2e89 : e5 1c __ SBC ACCU + 1 
2e8b : d0 51 __ BNE $2ede ; (write_cells.s39 + 0)
.s42:
2e8d : e0 03 __ CPX #$03
2e8f : b0 4d __ BCS $2ede ; (write_cells.s39 + 0)
.s55:
2e91 : a9 02 __ LDA #$02
2e93 : 85 43 __ STA T1 + 0 
2e95 : a4 1b __ LDY ACCU + 0 
2e97 : 90 03 __ BCC $2e9c ; (write_cells.l22 + 0)
.s25:
2e99 : 8d 01 d6 STA $d601 
.l22:
2e9c : a5 1c __ LDA ACCU + 1 
2e9e : c5 4e __ CMP T7 + 1 
2ea0 : d0 02 __ BNE $2ea4 ; (write_cells.s38 + 0)
.s37:
2ea2 : c4 4d __ CPY T7 + 0 
.s38:
2ea4 : 90 26 __ BCC $2ecc ; (write_cells.s23 + 0)
.s65:
2ea6 : a4 4d __ LDY T7 + 0 
.s26:
2ea8 : a9 02 __ LDA #$02
2eaa : 85 1b __ STA ACCU + 0 
2eac : 18 __ __ CLC
2ead : a9 5e __ LDA #$5e
2eaf : 65 4e __ ADC T7 + 1 
2eb1 : 85 1c __ STA ACCU + 1 
2eb3 : b1 1b __ LDA (ACCU + 0),y 
.l27:
2eb5 : 2c 00 d6 BIT $d600 
2eb8 : 10 fb __ BPL $2eb5 ; (write_cells.l27 + 0)
.s28:
2eba : 8d 01 d6 STA $d601 
2ebd : 98 __ __ TYA
2ebe : 18 __ __ CLC
2ebf : 69 01 __ ADC #$01
2ec1 : 85 1b __ STA ACCU + 0 
2ec3 : a5 4e __ LDA T7 + 1 
2ec5 : 69 00 __ ADC #$00
2ec7 : 85 1c __ STA ACCU + 1 
2ec9 : 4c 1a 2e JMP $2e1a ; (write_cells.s29 + 0)
.s23:
2ecc : 69 5e __ ADC #$5e
2ece : 85 44 __ STA T1 + 1 
2ed0 : b1 43 __ LDA (T1 + 0),y 
2ed2 : c8 __ __ INY
2ed3 : d0 02 __ BNE $2ed7 ; (write_cells.l24 + 0)
.s62:
2ed5 : e6 1c __ INC ACCU + 1 
.l24:
2ed7 : 2c 00 d6 BIT $d600 
2eda : 10 fb __ BPL $2ed7 ; (write_cells.l24 + 0)
2edc : 30 bb __ BMI $2e99 ; (write_cells.s25 + 0)
.s39:
2ede : a5 4e __ LDA T7 + 1 
2ee0 : c5 1c __ CMP ACCU + 1 
2ee2 : d0 04 __ BNE $2ee8 ; (write_cells.s40 + 0)
.s41:
2ee4 : c4 1b __ CPY ACCU + 0 
2ee6 : f0 c0 __ BEQ $2ea8 ; (write_cells.s26 + 0)
.s40:
2ee8 : 98 __ __ TYA
2ee9 : 18 __ __ CLC
2eea : 65 0f __ ADC P2 ; (base + 0)
2eec : a8 __ __ TAY
2eed : a5 10 __ LDA P3 ; (base + 1)
2eef : 65 4e __ ADC T7 + 1 
2ef1 : aa __ __ TAX
2ef2 : 98 __ __ TYA
2ef3 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
2ef6 : 4c a6 2e JMP $2ea6 ; (write_cells.s65 + 0)
.s7:
2ef9 : a5 1c __ LDA ACCU + 1 
2efb : c5 4e __ CMP T7 + 1 
2efd : d0 04 __ BNE $2f03 ; (write_cells.s54 + 0)
.s53:
2eff : a5 1b __ LDA ACCU + 0 
2f01 : c5 4d __ CMP T7 + 0 
.s54:
2f03 : b0 5c __ BCS $2f61 ; (write_cells.s49 + 0)
.s8:
2f05 : 98 __ __ TYA
2f06 : 38 __ __ SEC
2f07 : e5 1b __ SBC ACCU + 0 
2f09 : aa __ __ TAX
2f0a : a5 4e __ LDA T7 + 1 
2f0c : e5 1c __ SBC ACCU + 1 
2f0e : d0 51 __ BNE $2f61 ; (write_cells.s49 + 0)
.s52:
2f10 : e0 03 __ CPX #$03
2f12 : b0 4d __ BCS $2f61 ; (write_cells.s49 + 0)
.s56:
2f14 : a9 32 __ LDA #$32
2f16 : 85 43 __ STA T1 + 0 
2f18 : a4 1b __ LDY ACCU + 0 
2f1a : 90 03 __ BCC $2f1f ; (write_cells.l9 + 0)
.s12:
2f1c : 8d 01 d6 STA $d601 
.l9:
2f1f : a5 1c __ LDA ACCU + 1 
2f21 : c5 4e __ CMP T7 + 1 
2f23 : d0 02 __ BNE $2f27 ; (write_cells.s48 + 0)
.s47:
2f25 : c4 4d __ CPY T7 + 0 
.s48:
2f27 : 90 26 __ BCC $2f4f ; (write_cells.s10 + 0)
.s64:
2f29 : a4 4d __ LDY T7 + 0 
.s13:
2f2b : a9 32 __ LDA #$32
2f2d : 85 1b __ STA ACCU + 0 
2f2f : 18 __ __ CLC
2f30 : a9 56 __ LDA #$56
2f32 : 65 4e __ ADC T7 + 1 
2f34 : 85 1c __ STA ACCU + 1 
2f36 : b1 1b __ LDA (ACCU + 0),y 
.l14:
2f38 : 2c 00 d6 BIT $d600 
2f3b : 10 fb __ BPL $2f38 ; (write_cells.l14 + 0)
.s15:
2f3d : 8d 01 d6 STA $d601 
2f40 : 98 __ __ TYA
2f41 : 18 __ __ CLC
2f42 : 69 01 __ ADC #$01
2f44 : 85 1b __ STA ACCU + 0 
2f46 : a5 4e __ LDA T7 + 1 
2f48 : 69 00 __ ADC #$00
2f4a : 85 1c __ STA ACCU + 1 
2f4c : 4c c0 2d JMP $2dc0 ; (write_cells.s16 + 0)
.s10:
2f4f : 69 56 __ ADC #$56
2f51 : 85 44 __ STA T1 + 1 
2f53 : b1 43 __ LDA (T1 + 0),y 
2f55 : c8 __ __ INY
2f56 : d0 02 __ BNE $2f5a ; (write_cells.l11 + 0)
.s63:
2f58 : e6 1c __ INC ACCU + 1 
.l11:
2f5a : 2c 00 d6 BIT $d600 
2f5d : 10 fb __ BPL $2f5a ; (write_cells.l11 + 0)
2f5f : 30 bb __ BMI $2f1c ; (write_cells.s12 + 0)
.s49:
2f61 : a5 4e __ LDA T7 + 1 
2f63 : c5 1c __ CMP ACCU + 1 
2f65 : d0 04 __ BNE $2f6b ; (write_cells.s50 + 0)
.s51:
2f67 : c4 1b __ CPY ACCU + 0 
2f69 : f0 c0 __ BEQ $2f2b ; (write_cells.s13 + 0)
.s50:
2f6b : 98 __ __ TYA
2f6c : 18 __ __ CLC
2f6d : 65 0f __ ADC P2 ; (base + 0)
2f6f : a8 __ __ TAY
2f70 : a5 10 __ LDA P3 ; (base + 1)
2f72 : 65 4e __ ADC T7 + 1 
2f74 : aa __ __ TAX
2f75 : 98 __ __ TYA
2f76 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
2f79 : 4c 29 2f JMP $2f29 ; (write_cells.s64 + 0)
--------------------------------------------------------------------
prerender: ; prerender(u8)->void
; 409, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
2f7c : a2 06 __ LDX #$06
2f7e : b5 53 __ LDA T11 + 0,x 
2f80 : 9d f2 bf STA $bff2,x ; (prerender@stack + 0)
2f83 : ca __ __ DEX
2f84 : 10 f8 __ BPL $2f7e ; (prerender.s1 + 2)
.s4:
2f86 : a5 17 __ LDA P10 ; (i + 0)
2f88 : 0a __ __ ASL
2f89 : 0a __ __ ASL
2f8a : a8 __ __ TAY
2f8b : b9 f0 3e LDA $3ef0,y ; (pipes[0].x + 0)
2f8e : e9 01 __ SBC #$01
2f90 : 85 47 __ STA T2 + 0 
2f92 : b9 f1 3e LDA $3ef1,y ; (pipes[0].x + 1)
2f95 : e9 00 __ SBC #$00
2f97 : 85 48 __ STA T2 + 1 
2f99 : 30 0b __ BMI $2fa6 ; (prerender.s5 + 0)
.s39:
2f9b : f0 03 __ BEQ $2fa0 ; (prerender.s38 + 0)
2f9d : 4c 97 31 JMP $3197 ; (prerender.s3 + 0)
.s38:
2fa0 : a5 47 __ LDA T2 + 0 
2fa2 : c9 50 __ CMP #$50
2fa4 : b0 f7 __ BCS $2f9d ; (prerender.s39 + 2)
.s5:
2fa6 : b9 f1 3e LDA $3ef1,y ; (pipes[0].x + 1)
2fa9 : 49 80 __ EOR #$80
2fab : c9 7f __ CMP #$7f
2fad : d0 05 __ BNE $2fb4 ; (prerender.s37 + 0)
.s36:
2faf : b9 f0 3e LDA $3ef0,y ; (pipes[0].x + 0)
2fb2 : c9 f8 __ CMP #$f8
.s37:
2fb4 : 90 e7 __ BCC $2f9d ; (prerender.s39 + 2)
.s6:
2fb6 : a9 ff __ LDA #$ff
2fb8 : 8d fb 55 STA $55fb ; (copy_dst + 0)
2fbb : 8d fc 55 STA $55fc ; (copy_dst + 1)
2fbe : a2 10 __ LDX #$10
2fc0 : ad 44 7d LDA $7d44 ; (page + 0)
2fc3 : f0 08 __ BEQ $2fcd ; (prerender.s35 + 0)
.s7:
2fc5 : 86 4a __ STX T3 + 1 
2fc7 : a9 00 __ LDA #$00
2fc9 : 85 4c __ STA T4 + 1 
2fcb : b0 04 __ BCS $2fd1 ; (prerender.s8 + 0)
.s35:
2fcd : 86 4c __ STX T4 + 1 
2fcf : 85 4a __ STA T3 + 1 
.s8:
2fd1 : b9 f2 3e LDA $3ef2,y ; (pipes[0].gap + 0)
2fd4 : 85 57 __ STA T13 + 0 
2fd6 : 24 48 __ BIT T2 + 1 
2fd8 : 10 03 __ BPL $2fdd ; (prerender.s32 + 0)
2fda : 4c a2 31 JMP $31a2 ; (prerender.s9 + 0)
.s32:
2fdd : a5 47 __ LDA T2 + 0 
2fdf : 85 4d __ STA T5 + 0 
2fe1 : 18 __ __ CLC
2fe2 : 69 0b __ ADC #$0b
2fe4 : aa __ __ TAX
2fe5 : a9 00 __ LDA #$00
2fe7 : 85 43 __ STA T0 + 0 
2fe9 : a5 48 __ LDA T2 + 1 
2feb : 69 00 __ ADC #$00
2fed : d0 08 __ BNE $2ff7 ; (prerender.s10 + 0)
.s34:
2fef : e0 51 __ CPX #$51
2ff1 : b0 04 __ BCS $2ff7 ; (prerender.s10 + 0)
.s33:
2ff3 : a9 0b __ LDA #$0b
2ff5 : 90 05 __ BCC $2ffc ; (prerender.s11 + 0)
.s10:
2ff7 : 38 __ __ SEC
2ff8 : a9 50 __ LDA #$50
2ffa : e5 4d __ SBC T5 + 0 
.s11:
2ffc : a2 ff __ LDX #$ff
2ffe : 8e f9 55 STX $55f9 ; (copy_src + 0)
3001 : 8e fa 55 STX $55fa ; (copy_src + 1)
3004 : a8 __ __ TAY
3005 : 18 __ __ CLC
3006 : 65 4d __ ADC T5 + 0 
3008 : 85 4e __ STA T6 + 0 
300a : c9 50 __ CMP #$50
300c : d0 04 __ BNE $3012 ; (prerender.s13 + 0)
.s12:
300e : a9 01 __ LDA #$01
3010 : d0 02 __ BNE $3014 ; (prerender.s14 + 0)
.s13:
3012 : a9 00 __ LDA #$00
.s14:
3014 : 85 15 __ STA P8 
3016 : a5 4d __ LDA T5 + 0 
3018 : 85 0f __ STA P2 
301a : 18 __ __ CLC
301b : 69 01 __ ADC #$01
301d : 85 11 __ STA P4 
301f : a5 4c __ LDA T4 + 1 
3021 : 85 10 __ STA P3 
3023 : a5 4a __ LDA T3 + 1 
3025 : 69 00 __ ADC #$00
3027 : 85 12 __ STA P5 
3029 : a6 57 __ LDX T13 + 0 
302b : ca __ __ DEX
302c : 86 4f __ STX T8 + 0 
302e : 86 13 __ STX P6 
3030 : 98 __ __ TYA
3031 : 38 __ __ SEC
3032 : e5 15 __ SBC P8 
3034 : 85 14 __ STA P7 
3036 : a5 15 __ LDA P8 
3038 : f0 08 __ BEQ $3042 ; (prerender.s31 + 0)
.s15:
303a : 38 __ __ SEC
303b : a9 4f __ LDA #$4f
303d : e5 0f __ SBC P2 
303f : 18 __ __ CLC
3040 : 65 43 __ ADC T0 + 0 
.s31:
3042 : 85 45 __ STA T1 + 0 
3044 : aa __ __ TAX
3045 : bd ba 3e LDA $3eba,x ; (pipe_tiles[0][0] + 0)
3048 : 85 58 __ STA T15 + 0 
304a : 85 16 __ STA P9 
304c : 20 ba 31 JSR $31ba ; (copy_rows.s4 + 0)
304f : 18 __ __ CLC
3050 : a5 57 __ LDA T13 + 0 
3052 : 69 07 __ ADC #$07
3054 : 85 51 __ STA T10 + 0 
3056 : a9 00 __ LDA #$00
3058 : a4 4f __ LDY T8 + 0 
305a : 6a __ __ ROR
305b : 85 52 __ STA T10 + 1 
305d : 30 09 __ BMI $3068 ; (prerender.s16 + 0)
.s30:
305f : a5 51 __ LDA T10 + 0 
3061 : c5 4f __ CMP T8 + 0 
3063 : b0 03 __ BCS $3068 ; (prerender.s16 + 0)
3065 : 4c ea 30 JMP $30ea ; (prerender.s17 + 0)
.s16:
3068 : 84 59 __ STY T16 + 0 
306a : a5 4c __ LDA T4 + 1 
306c : 09 08 __ ORA #$08
306e : 85 54 __ STA T11 + 1 
3070 : a5 4a __ LDA T3 + 1 
3072 : 09 08 __ ORA #$08
3074 : 85 56 __ STA T12 + 1 
.l40:
3076 : a6 45 __ LDX T1 + 0 
3078 : a9 01 __ LDA #$01
307a : 85 13 __ STA P6 
307c : bd c5 3e LDA $3ec5,x ; (pipe_tiles[0][0] + 11)
307f : 85 16 __ STA P9 
3081 : 98 __ __ TYA
3082 : 0a __ __ ASL
3083 : aa __ __ TAX
3084 : bd 00 56 LDA $5600,x ; (row_addr[0] + 0)
3087 : 18 __ __ CLC
3088 : 65 4d __ ADC T5 + 0 
308a : 85 4f __ STA T8 + 0 
308c : 85 0f __ STA P2 
308e : bd 01 56 LDA $5601,x ; (row_addr[0] + 1)
3091 : 69 00 __ ADC #$00
3093 : 85 50 __ STA T8 + 1 
3095 : 18 __ __ CLC
3096 : 65 4c __ ADC T4 + 1 
3098 : 85 10 __ STA P3 
309a : 18 __ __ CLC
309b : a5 4a __ LDA T3 + 1 
309d : 65 50 __ ADC T8 + 1 
309f : aa __ __ TAX
30a0 : 18 __ __ CLC
30a1 : a5 0f __ LDA P2 
30a3 : 69 01 __ ADC #$01
30a5 : 85 11 __ STA P4 
30a7 : 90 01 __ BCC $30aa ; (prerender.s42 + 0)
.s41:
30a9 : e8 __ __ INX
.s42:
30aa : 86 12 __ STX P5 
30ac : 20 ba 31 JSR $31ba ; (copy_rows.s4 + 0)
30af : a6 45 __ LDX T1 + 0 
30b1 : a9 01 __ LDA #$01
30b3 : 85 13 __ STA P6 
30b5 : bd d0 3e LDA $3ed0,x ; (cap_attr[0] + 0)
30b8 : 85 16 __ STA P9 
30ba : 18 __ __ CLC
30bb : a5 54 __ LDA T11 + 1 
30bd : 65 50 __ ADC T8 + 1 
30bf : 85 10 __ STA P3 
30c1 : 18 __ __ CLC
30c2 : a5 56 __ LDA T12 + 1 
30c4 : 65 50 __ ADC T8 + 1 
30c6 : aa __ __ TAX
30c7 : a5 4f __ LDA T8 + 0 
30c9 : 85 0f __ STA P2 
30cb : 18 __ __ CLC
30cc : 69 01 __ ADC #$01
30ce : 85 11 __ STA P4 
30d0 : 90 01 __ BCC $30d3 ; (prerender.s44 + 0)
.s43:
30d2 : e8 __ __ INX
.s44:
30d3 : 86 12 __ STX P5 
30d5 : 20 ba 31 JSR $31ba ; (copy_rows.s4 + 0)
30d8 : 18 __ __ CLC
30d9 : a5 59 __ LDA T16 + 0 
30db : 69 08 __ ADC #$08
30dd : 85 59 __ STA T16 + 0 
30df : a8 __ __ TAY
30e0 : 24 52 __ BIT T10 + 1 
30e2 : 30 92 __ BMI $3076 ; (prerender.l40 + 0)
.s29:
30e4 : a5 51 __ LDA T10 + 0 
30e6 : c5 59 __ CMP T16 + 0 
30e8 : b0 8c __ BCS $3076 ; (prerender.l40 + 0)
.s17:
30ea : a5 57 __ LDA T13 + 0 
30ec : 0a __ __ ASL
30ed : aa __ __ TAX
30ee : a5 58 __ LDA T15 + 0 
30f0 : 85 16 __ STA P9 
30f2 : bd 10 56 LDA $5610,x ; (row_addr[0] + 16)
30f5 : 18 __ __ CLC
30f6 : 65 4d __ ADC T5 + 0 
30f8 : 85 0f __ STA P2 
30fa : bd 11 56 LDA $5611,x ; (row_addr[0] + 17)
30fd : 69 00 __ ADC #$00
30ff : aa __ __ TAX
3100 : 18 __ __ CLC
3101 : 65 4c __ ADC T4 + 1 
3103 : 85 10 __ STA P3 
3105 : 8a __ __ TXA
3106 : 18 __ __ CLC
3107 : 65 4a __ ADC T3 + 1 
3109 : aa __ __ TAX
310a : 18 __ __ CLC
310b : a5 0f __ LDA P2 
310d : 69 01 __ ADC #$01
310f : 85 11 __ STA P4 
3111 : 90 01 __ BCC $3114 ; (prerender.s46 + 0)
.s45:
3113 : e8 __ __ INX
.s46:
3114 : 86 12 __ STX P5 
3116 : 38 __ __ SEC
3117 : a9 14 __ LDA #$14
3119 : e5 57 __ SBC T13 + 0 
311b : 38 __ __ SEC
311c : e9 07 __ SBC #$07
311e : 85 13 __ STA P6 
3120 : 20 ba 31 JSR $31ba ; (copy_rows.s4 + 0)
3123 : a5 4d __ LDA T5 + 0 
3125 : c9 1e __ CMP #$1e
3127 : b0 6e __ BCS $3197 ; (prerender.s3 + 0)
.s18:
3129 : a5 4e __ LDA T6 + 0 
312b : c9 1e __ CMP #$1e
312d : 90 68 __ BCC $3197 ; (prerender.s3 + 0)
.s19:
312f : ad eb 3e LDA $3eeb ; (bird_y + 0)
3132 : 85 43 __ STA T0 + 0 
3134 : ad ec 3e LDA $3eec ; (bird_y + 1)
3137 : 4a __ __ LSR
3138 : 66 43 __ ROR T0 + 0 
313a : 4a __ __ LSR
313b : 66 43 __ ROR T0 + 0 
313d : 4a __ __ LSR
313e : 66 43 __ ROR T0 + 0 
3140 : 4a __ __ LSR
3141 : 66 43 __ ROR T0 + 0 
3143 : 4a __ __ LSR
3144 : 66 43 __ ROR T0 + 0 
3146 : 4a __ __ LSR
3147 : 66 43 __ ROR T0 + 0 
3149 : 4a __ __ LSR
314a : a5 43 __ LDA T0 + 0 
314c : 6a __ __ ROR
314d : 85 45 __ STA T1 + 0 
314f : d0 04 __ BNE $3155 ; (prerender.s20 + 0)
.s28:
3151 : a9 00 __ LDA #$00
3153 : f0 03 __ BEQ $3158 ; (prerender.s21 + 0)
.s20:
3155 : 38 __ __ SEC
3156 : e9 01 __ SBC #$01
.s21:
3158 : 85 47 __ STA T2 + 0 
315a : 18 __ __ CLC
315b : a5 45 __ LDA T1 + 0 
315d : 69 03 __ ADC #$03
315f : 85 45 __ STA T1 + 0 
3161 : a9 00 __ LDA #$00
3163 : 6a __ __ ROR
3164 : 85 46 __ STA T1 + 1 
3166 : 30 06 __ BMI $316e ; (prerender.l22 + 0)
.s27:
3168 : a5 45 __ LDA T1 + 0 
316a : c5 47 __ CMP T2 + 0 
316c : 90 29 __ BCC $3197 ; (prerender.s3 + 0)
.l22:
316e : a5 47 __ LDA T2 + 0 
3170 : c9 15 __ CMP #$15
3172 : b0 1b __ BCS $318f ; (prerender.s25 + 0)
.s23:
3174 : c5 57 __ CMP T13 + 0 
3176 : 90 04 __ BCC $317c ; (prerender.s24 + 0)
.s26:
3178 : c5 51 __ CMP T10 + 0 
317a : 90 13 __ BCC $318f ; (prerender.s25 + 0)
.s24:
317c : 0a __ __ ASL
317d : aa __ __ TAX
317e : bd 00 56 LDA $5600,x ; (row_addr[0] + 0)
3181 : 38 __ __ SEC
3182 : e9 e3 __ SBC #$e3
3184 : a8 __ __ TAY
3185 : bd 01 56 LDA $5601,x ; (row_addr[0] + 1)
3188 : e9 ff __ SBC #$ff
318a : aa __ __ TAX
318b : 98 __ __ TYA
318c : 20 8e 32 JSR $328e ; (hidden_stale.s4 + 0)
.s25:
318f : e6 47 __ INC T2 + 0 
3191 : 24 46 __ BIT T1 + 1 
3193 : 30 d9 __ BMI $316e ; (prerender.l22 + 0)
3195 : 10 d1 __ BPL $3168 ; (prerender.s27 + 0)
.s3:
3197 : a2 06 __ LDX #$06
3199 : bd f2 bf LDA $bff2,x ; (prerender@stack + 0)
319c : 95 53 __ STA T11 + 0,x 
319e : ca __ __ DEX
319f : 10 f8 __ BPL $3199 ; (prerender.s3 + 2)
31a1 : 60 __ __ RTS
.s9:
31a2 : a9 00 __ LDA #$00
31a4 : 85 4d __ STA T5 + 0 
31a6 : 38 __ __ SEC
31a7 : e5 47 __ SBC T2 + 0 
31a9 : 85 43 __ STA T0 + 0 
31ab : 49 ff __ EOR #$ff
31ad : 18 __ __ CLC
31ae : 69 0c __ ADC #$0c
31b0 : c9 51 __ CMP #$51
31b2 : b0 03 __ BCS $31b7 ; (prerender.s9 + 21)
31b4 : 4c fc 2f JMP $2ffc ; (prerender.s11 + 0)
31b7 : 4c f7 2f JMP $2ff7 ; (prerender.s10 + 0)
--------------------------------------------------------------------
copy_rows: ; copy_rows(u16,u16,u8,u8,u8,u8)->void
; 375, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
31ba : a5 13 __ LDA P6 ; (rows + 0)
31bc : f0 57 __ BEQ $3215 ; (copy_rows.s3 + 0)
.l29:
31be : a5 14 __ LDA P7 ; (n + 0)
31c0 : d0 54 __ BNE $3216 ; (copy_rows.s5 + 0)
.s25:
31c2 : a5 0f __ LDA P2 ; (dst + 0)
31c4 : a6 10 __ LDX P3 ; (dst + 1)
31c6 : 20 f1 20 JSR $20f1 ; (vdc_mem_addr.s4 + 0)
31c9 : a5 0f __ LDA P2 ; (dst + 0)
31cb : 8d fb 55 STA $55fb ; (copy_dst + 0)
31ce : a5 10 __ LDA P3 ; (dst + 1)
31d0 : 8d fc 55 STA $55fc ; (copy_dst + 1)
31d3 : a9 ff __ LDA #$ff
31d5 : 8d f9 55 STA $55f9 ; (copy_src + 0)
31d8 : 8d fa 55 STA $55fa ; (copy_src + 1)
.s30:
31db : a5 15 __ LDA P8 ; (edge + 0)
31dd : f0 17 __ BEQ $31f6 ; (copy_rows.s23 + 0)
.s20:
31df : a9 1f __ LDA #$1f
31e1 : 8d 00 d6 STA $d600 
.l21:
31e4 : 2c 00 d6 BIT $d600 
31e7 : 10 fb __ BPL $31e4 ; (copy_rows.l21 + 0)
.s22:
31e9 : a5 16 __ LDA P9 ; (tile + 0)
31eb : 8d 01 d6 STA $d601 
31ee : ee fb 55 INC $55fb ; (copy_dst + 0)
31f1 : d0 03 __ BNE $31f6 ; (copy_rows.s23 + 0)
.s26:
31f3 : ee fc 55 INC $55fc ; (copy_dst + 1)
.s23:
31f6 : 18 __ __ CLC
31f7 : a5 11 __ LDA P4 ; (src + 0)
31f9 : 69 50 __ ADC #$50
31fb : 85 11 __ STA P4 ; (src + 0)
31fd : 90 03 __ BCC $3202 ; (copy_rows.s28 + 0)
.s27:
31ff : e6 12 __ INC P5 ; (src + 1)
3201 : 18 __ __ CLC
.s28:
3202 : a5 0f __ LDA P2 ; (dst + 0)
3204 : 69 50 __ ADC #$50
3206 : 85 0f __ STA P2 ; (dst + 0)
3208 : a5 10 __ LDA P3 ; (dst + 1)
320a : 69 00 __ ADC #$00
320c : c6 13 __ DEC P6 ; (rows + 0)
320e : f0 05 __ BEQ $3215 ; (copy_rows.s3 + 0)
.s24:
3210 : 85 10 __ STA P3 ; (dst + 1)
3212 : 4c be 31 JMP $31be ; (copy_rows.l29 + 0)
.s3:
3215 : 60 __ __ RTS
.s5:
3216 : ad fc 55 LDA $55fc ; (copy_dst + 1)
3219 : 45 10 __ EOR P3 ; (dst + 1)
321b : f0 0f __ BEQ $322c ; (copy_rows.s9 + 0)
.s6:
321d : a9 12 __ LDA #$12
321f : 8d 00 d6 STA $d600 
.l7:
3222 : 2c 00 d6 BIT $d600 
3225 : 10 fb __ BPL $3222 ; (copy_rows.l7 + 0)
.s8:
3227 : a5 10 __ LDA P3 ; (dst + 1)
3229 : 8d 01 d6 STA $d601 
.s9:
322c : a9 13 __ LDA #$13
322e : 8d 00 d6 STA $d600 
.l10:
3231 : 2c 00 d6 BIT $d600 
3234 : 10 fb __ BPL $3231 ; (copy_rows.l10 + 0)
.s11:
3236 : a5 0f __ LDA P2 ; (dst + 0)
3238 : 8d 01 d6 STA $d601 
323b : ad fa 55 LDA $55fa ; (copy_src + 1)
323e : 45 12 __ EOR P5 ; (src + 1)
3240 : f0 0f __ BEQ $3251 ; (copy_rows.s15 + 0)
.s12:
3242 : a9 20 __ LDA #$20
3244 : 8d 00 d6 STA $d600 
.l13:
3247 : 2c 00 d6 BIT $d600 
324a : 10 fb __ BPL $3247 ; (copy_rows.l13 + 0)
.s14:
324c : a5 12 __ LDA P5 ; (src + 1)
324e : 8d 01 d6 STA $d601 
.s15:
3251 : a9 21 __ LDA #$21
3253 : 8d 00 d6 STA $d600 
.l16:
3256 : 2c 00 d6 BIT $d600 
3259 : 10 fb __ BPL $3256 ; (copy_rows.l16 + 0)
.s17:
325b : a5 11 __ LDA P4 ; (src + 0)
325d : 8d 01 d6 STA $d601 
3260 : a9 1e __ LDA #$1e
3262 : 8d 00 d6 STA $d600 
.l18:
3265 : 2c 00 d6 BIT $d600 
3268 : 10 fb __ BPL $3265 ; (copy_rows.l18 + 0)
.s19:
326a : a5 14 __ LDA P7 ; (n + 0)
326c : 8d 01 d6 STA $d601 
326f : 18 __ __ CLC
3270 : 65 11 __ ADC P4 ; (src + 0)
3272 : 8d f9 55 STA $55f9 ; (copy_src + 0)
3275 : a5 12 __ LDA P5 ; (src + 1)
3277 : 69 00 __ ADC #$00
3279 : 8d fa 55 STA $55fa ; (copy_src + 1)
327c : 18 __ __ CLC
327d : a5 14 __ LDA P7 ; (n + 0)
327f : 65 0f __ ADC P2 ; (dst + 0)
3281 : 8d fb 55 STA $55fb ; (copy_dst + 0)
3284 : a5 10 __ LDA P3 ; (dst + 1)
3286 : 69 00 __ ADC #$00
3288 : 8d fc 55 STA $55fc ; (copy_dst + 1)
328b : 4c db 31 JMP $31db ; (copy_rows.s30 + 0)
--------------------------------------------------------------------
hidden_stale: ; hidden_stale(u16,u8)->void
; 339, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
328e : 85 1b __ STA ACCU + 0 
3290 : 18 __ __ CLC
3291 : 69 d2 __ ADC #$d2
3293 : 85 43 __ STA T1 + 0 
3295 : 8a __ __ TXA
3296 : 69 65 __ ADC #$65
3298 : 85 44 __ STA T1 + 1 
329a : a0 00 __ LDY #$00
329c : b1 43 __ LDA (T1 + 0),y 
329e : 85 1c __ STA ACCU + 1 
32a0 : 09 0c __ ORA #$0c
32a2 : 91 43 __ STA (T1 + 0),y 
32a4 : a5 1c __ LDA ACCU + 1 
32a6 : d0 2e __ BNE $32d6 ; (hidden_stale.s3 + 0)
.s5:
32a8 : ad df 55 LDA $55df ; (dirty_count + 0)
32ab : 85 43 __ STA T1 + 0 
32ad : 18 __ __ CLC
32ae : 69 01 __ ADC #$01
32b0 : 8d df 55 STA $55df ; (dirty_count + 0)
32b3 : ad e0 55 LDA $55e0 ; (dirty_count + 1)
32b6 : 85 44 __ STA T1 + 1 
32b8 : 69 00 __ ADC #$00
32ba : 8d e0 55 STA $55e0 ; (dirty_count + 1)
32bd : 06 43 __ ASL T1 + 0 
32bf : 26 44 __ ROL T1 + 1 
32c1 : 18 __ __ CLC
32c2 : a9 a2 __ LDA #$a2
32c4 : 65 43 __ ADC T1 + 0 
32c6 : 85 43 __ STA T1 + 0 
32c8 : a9 6d __ LDA #$6d
32ca : 65 44 __ ADC T1 + 1 
32cc : 85 44 __ STA T1 + 1 
32ce : a5 1b __ LDA ACCU + 0 
32d0 : 91 43 __ STA (T1 + 0),y 
32d2 : 8a __ __ TXA
32d3 : c8 __ __ INY
32d4 : 91 43 __ STA (T1 + 0),y 
.s3:
32d6 : 60 __ __ RTS
--------------------------------------------------------------------
keys: ; keys()->u8
; 132, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
32d7 : a9 7f __ LDA #$7f
32d9 : 8d 00 dc STA $dc00 
32dc : ad 01 dc LDA $dc01 
32df : aa __ __ TAX
32e0 : 29 10 __ AND #$10
32e2 : f0 04 __ BEQ $32e8 ; (keys.s11 + 0)
.s12:
32e4 : a0 00 __ LDY #$00
32e6 : f0 02 __ BEQ $32ea ; (keys.s13 + 0)
.s11:
32e8 : a0 01 __ LDY #$01
.s13:
32ea : a9 df __ LDA #$df
32ec : 8d 00 dc STA $dc00 
32ef : 8a __ __ TXA
32f0 : 0a __ __ ASL
32f1 : 30 04 __ BMI $32f7 ; (keys.s5 + 0)
.s10:
32f3 : 98 __ __ TYA
32f4 : 09 10 __ ORA #$10
32f6 : a8 __ __ TAY
.s5:
32f7 : ad 01 dc LDA $dc01 
32fa : 29 02 __ AND #$02
32fc : a2 ff __ LDX #$ff
32fe : 8e 00 dc STX $dc00 
3301 : aa __ __ TAX
3302 : d0 02 __ BNE $3306 ; (keys.s6 + 0)
.s9:
3304 : c8 __ __ INY
3305 : c8 __ __ INY
.s6:
3306 : ad 00 dc LDA $dc00 
3309 : 29 10 __ AND #$10
330b : d0 04 __ BNE $3311 ; (keys.s7 + 0)
.s8:
330d : 98 __ __ TYA
330e : 09 01 __ ORA #$01
3310 : 60 __ __ RTS
.s7:
3311 : 98 __ __ TYA
.s3:
3312 : 60 __ __ RTS
--------------------------------------------------------------------
prepare_frame: ; prepare_frame(u8)->void
; 665, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
3313 : a2 0a __ LDX #$0a
3315 : b5 53 __ LDA T0 + 0,x 
3317 : 9d e2 bf STA $bfe2,x ; (prepare_frame@stack + 0)
331a : ca __ __ DEX
331b : 10 f8 __ BPL $3315 ; (prepare_frame.s1 + 2)
.s4:
331d : ee 47 7d INC $7d47 ; (tempo + 0)
3320 : a9 00 __ LDA #$00
3322 : 8d 48 7d STA $7d48 ; (stepped + 0)
3325 : a9 01 __ LDA #$01
3327 : 8d 46 7d STA $7d46 ; (frame_ticks + 0)
332a : ad 47 7d LDA $7d47 ; (tempo + 0)
332d : c9 05 __ CMP #$05
332f : d0 0c __ BNE $333d ; (prepare_frame.s137 + 0)
.s5:
3331 : a9 00 __ LDA #$00
3333 : 8d 47 7d STA $7d47 ; (tempo + 0)
3336 : a9 02 __ LDA #$02
3338 : 8d 46 7d STA $7d46 ; (frame_ticks + 0)
333b : d0 02 __ BNE $333f ; (prepare_frame.s138 + 0)
.s137:
333d : a9 01 __ LDA #$01
.s138:
333f : 85 5d __ STA T15 + 0 
.l6:
3341 : ee e5 55 INC $55e5 ; (simulation_count + 0)
3344 : d0 03 __ BNE $3349 ; (prepare_frame.s144 + 0)
.s143:
3346 : ee e6 55 INC $55e6 ; (simulation_count + 1)
.s144:
3349 : ad 49 7d LDA $7d49 ; (previous_keys + 0)
334c : 49 ff __ EOR #$ff
334e : 25 18 __ AND P11 ; (held + 0)
3350 : 85 53 __ STA T0 + 0 
3352 : a5 18 __ LDA P11 ; (held + 0)
3354 : 8d 49 7d STA $7d49 ; (previous_keys + 0)
3357 : ad e6 3e LDA $3ee6 ; (state + 0)
335a : c9 02 __ CMP #$02
335c : d0 03 __ BNE $3361 ; (prepare_frame.s13 + 0)
335e : 4c 77 38 JMP $3877 ; (prepare_frame.s7 + 0)
.s13:
3361 : c9 04 __ CMP #$04
3363 : d0 03 __ BNE $3368 ; (prepare_frame.s24 + 0)
3365 : 4c 22 38 JMP $3822 ; (prepare_frame.s14 + 0)
.s24:
3368 : aa __ __ TAX
3369 : d0 33 __ BNE $339e ; (prepare_frame.s25 + 0)
.s135:
336b : ee fd 3c INC $3cfd ; (random_state + 0)
336e : d0 03 __ BNE $3373 ; (prepare_frame.s153 + 0)
.s152:
3370 : ee fe 3c INC $3cfe ; (random_state + 1)
.s153:
3373 : a5 53 __ LDA T0 + 0 
3375 : 29 01 __ AND #$01
3377 : f0 16 __ BEQ $338f ; (prepare_frame.s9 + 0)
.s136:
3379 : 8d e6 3e STA $3ee6 ; (state + 0)
337c : 20 7b 25 JSR $257b ; (field.s4 + 0)
337f : a9 de __ LDA #$de
3381 : 8d e9 3e STA $3ee9 ; (velocity + 0)
3384 : a9 ff __ LDA #$ff
3386 : 8d ea 3e STA $3eea ; (velocity + 1)
3389 : 20 4f 24 JSR $244f ; (bird_draw.s4 + 0)
.s12:
338c : 20 9b 38 JSR $389b ; (sound_flap.s4 + 0)
.s9:
338f : c6 5d __ DEC T15 + 0 
3391 : d0 ae __ BNE $3341 ; (prepare_frame.l6 + 0)
.s3:
3393 : a2 0a __ LDX #$0a
3395 : bd e2 bf LDA $bfe2,x ; (prepare_frame@stack + 0)
3398 : 95 53 __ STA T0 + 0,x 
339a : ca __ __ DEX
339b : 10 f8 __ BPL $3395 ; (prepare_frame.s3 + 2)
339d : 60 __ __ RTS
.s25:
339e : a5 53 __ LDA T0 + 0 
33a0 : 29 02 __ AND #$02
33a2 : f0 03 __ BEQ $33a7 ; (prepare_frame.s29 + 0)
33a4 : 4c 07 38 JMP $3807 ; (prepare_frame.s26 + 0)
.s29:
33a7 : ad e6 3e LDA $3ee6 ; (state + 0)
33aa : c9 03 __ CMP #$03
33ac : f0 e1 __ BEQ $338f ; (prepare_frame.s9 + 0)
.s30:
33ae : 46 53 __ LSR T0 + 0 
33b0 : 90 0d __ BCC $33bf ; (prepare_frame.s32 + 0)
.s31:
33b2 : a9 de __ LDA #$de
33b4 : 8d e9 3e STA $3ee9 ; (velocity + 0)
33b7 : a9 ff __ LDA #$ff
33b9 : 8d ea 3e STA $3eea ; (velocity + 1)
33bc : 20 9b 38 JSR $389b ; (sound_flap.s4 + 0)
.s32:
33bf : ad e9 3e LDA $3ee9 ; (velocity + 0)
33c2 : a8 __ __ TAY
33c3 : 18 __ __ CLC
33c4 : 69 02 __ ADC #$02
33c6 : 8d e9 3e STA $3ee9 ; (velocity + 0)
33c9 : ad ea 3e LDA $3eea ; (velocity + 1)
33cc : aa __ __ TAX
33cd : 69 00 __ ADC #$00
33cf : 8d ea 3e STA $3eea ; (velocity + 1)
33d2 : 8a __ __ TXA
33d3 : 30 10 __ BMI $33e5 ; (prepare_frame.s34 + 0)
.s134:
33d5 : d0 04 __ BNE $33db ; (prepare_frame.s33 + 0)
.s133:
33d7 : c0 2f __ CPY #$2f
33d9 : 90 0a __ BCC $33e5 ; (prepare_frame.s34 + 0)
.s33:
33db : a9 30 __ LDA #$30
33dd : 8d e9 3e STA $3ee9 ; (velocity + 0)
33e0 : a9 00 __ LDA #$00
33e2 : 8d ea 3e STA $3eea ; (velocity + 1)
.s34:
33e5 : ad eb 3e LDA $3eeb ; (bird_y + 0)
33e8 : 18 __ __ CLC
33e9 : 6d e9 3e ADC $3ee9 ; (velocity + 0)
33ec : 8d eb 3e STA $3eeb ; (bird_y + 0)
33ef : ad ec 3e LDA $3eec ; (bird_y + 1)
33f2 : 6d ea 3e ADC $3eea ; (velocity + 1)
33f5 : 8d ec 3e STA $3eec ; (bird_y + 1)
33f8 : 10 10 __ BPL $340a ; (prepare_frame.s129 + 0)
.s35:
33fa : a9 00 __ LDA #$00
33fc : 8d e9 3e STA $3ee9 ; (velocity + 0)
33ff : 8d ea 3e STA $3eea ; (velocity + 1)
3402 : 8d eb 3e STA $3eeb ; (bird_y + 0)
3405 : 8d ec 3e STA $3eec ; (bird_y + 1)
3408 : f0 25 __ BEQ $342f ; (prepare_frame.s36 + 0)
.s129:
340a : a9 09 __ LDA #$09
340c : cd ec 3e CMP $3eec ; (bird_y + 1)
340f : f0 04 __ BEQ $3415 ; (prepare_frame.s131 + 0)
.s132:
3411 : 90 09 __ BCC $341c ; (prepare_frame.s130 + 0)
3413 : b0 1a __ BCS $342f ; (prepare_frame.s36 + 0)
.s131:
3415 : ad eb 3e LDA $3eeb ; (bird_y + 0)
3418 : c9 c1 __ CMP #$c1
341a : 90 13 __ BCC $342f ; (prepare_frame.s36 + 0)
.s130:
341c : a9 c0 __ LDA #$c0
341e : 8d eb 3e STA $3eeb ; (bird_y + 0)
3421 : a9 09 __ LDA #$09
3423 : 8d ec 3e STA $3eec ; (bird_y + 1)
3426 : 20 4f 24 JSR $244f ; (bird_draw.s4 + 0)
3429 : 20 c5 38 JSR $38c5 ; (crash.s4 + 0)
342c : 4c 01 38 JMP $3801 ; (prepare_frame.s18 + 0)
.s36:
342f : ad ee 3e LDA $3eee ; (speed + 0)
3432 : 18 __ __ CLC
3433 : 6d ef 3e ADC $3eef ; (scroll + 0)
3436 : aa __ __ TAX
3437 : 29 07 __ AND #$07
3439 : 8d ef 3e STA $3eef ; (scroll + 0)
343c : 8a __ __ TXA
343d : 4a __ __ LSR
343e : 4a __ __ LSR
343f : 4a __ __ LSR
3440 : 18 __ __ CLC
3441 : 6d ed 3e ADC $3eed ; (phase + 0)
3444 : 85 53 __ STA T0 + 0 
3446 : b0 04 __ BCS $344c ; (prepare_frame.s37 + 0)
.s128:
3448 : c9 04 __ CMP #$04
344a : 90 1e __ BCC $346a ; (prepare_frame.s39 + 0)
.s37:
344c : ad 45 7d LDA $7d45 ; (prerendered + 0)
344f : b0 13 __ BCS $3464 ; (prepare_frame.l161 + 0)
.s38:
3451 : ad 45 7d LDA $7d45 ; (prerendered + 0)
3454 : 85 55 __ STA T1 + 0 
3456 : 85 17 __ STA P10 
3458 : e6 55 __ INC T1 + 0 
345a : a5 55 __ LDA T1 + 0 
345c : 8d 45 7d STA $7d45 ; (prerendered + 0)
345f : 20 7c 2f JSR $2f7c ; (prerender.s1 + 0)
3462 : a5 55 __ LDA T1 + 0 
.l161:
3464 : c9 04 __ CMP #$04
3466 : 90 e9 __ BCC $3451 ; (prepare_frame.s38 + 0)
.s156:
3468 : a5 53 __ LDA T0 + 0 
.s39:
346a : 8d ed 3e STA $3eed ; (phase + 0)
346d : c9 04 __ CMP #$04
346f : 90 6f __ BCC $34e0 ; (prepare_frame.s44 + 0)
.s40:
3471 : e9 04 __ SBC #$04
3473 : 8d ed 3e STA $3eed ; (phase + 0)
3476 : a9 01 __ LDA #$01
3478 : 8d 48 7d STA $7d48 ; (stepped + 0)
347b : a9 00 __ LDA #$00
347d : 8d 45 7d STA $7d45 ; (prerendered + 0)
3480 : 85 5c __ STA T12 + 0 
.l41:
3482 : 0a __ __ ASL
3483 : 0a __ __ ASL
3484 : 85 57 __ STA T2 + 0 
3486 : a8 __ __ TAY
3487 : b9 f0 3e LDA $3ef0,y ; (pipes[0].x + 0)
348a : aa __ __ TAX
348b : 18 __ __ CLC
348c : 69 ff __ ADC #$ff
348e : 99 f0 3e STA $3ef0,y ; (pipes[0].x + 0)
3491 : b9 f1 3e LDA $3ef1,y ; (pipes[0].x + 1)
3494 : 85 54 __ STA T0 + 1 
3496 : 69 ff __ ADC #$ff
3498 : 99 f1 3e STA $3ef1,y ; (pipes[0].x + 1)
349b : a5 54 __ LDA T0 + 1 
349d : 49 80 __ EOR #$80
349f : c9 7f __ CMP #$7f
34a1 : d0 02 __ BNE $34a5 ; (prepare_frame.s127 + 0)
.s126:
34a3 : e0 f9 __ CPX #$f9
.s127:
34a5 : 8a __ __ TXA
34a6 : b0 1b __ BCS $34c3 ; (prepare_frame.s73 + 0)
.s42:
34a8 : 69 73 __ ADC #$73
34aa : 99 f0 3e STA $3ef0,y ; (pipes[0].x + 0)
34ad : a5 54 __ LDA T0 + 1 
34af : 69 00 __ ADC #$00
34b1 : 99 f1 3e STA $3ef1,y ; (pipes[0].x + 1)
34b4 : 20 4e 25 JSR $254e ; (gap_next.s4 + 0)
34b7 : a6 57 __ LDX T2 + 0 
34b9 : 9d f2 3e STA $3ef2,x ; (pipes[0].gap + 0)
34bc : a9 00 __ LDA #$00
34be : 9d f3 3e STA $3ef3,x ; (pipes[0].passed + 0)
34c1 : f0 15 __ BEQ $34d8 ; (prepare_frame.s43 + 0)
.s73:
34c3 : e9 02 __ SBC #$02
34c5 : 85 55 __ STA T1 + 0 
34c7 : a5 54 __ LDA T0 + 1 
34c9 : e9 00 __ SBC #$00
34cb : 10 03 __ BPL $34d0 ; (prepare_frame.s125 + 0)
34cd : 4c 10 36 JMP $3610 ; (prepare_frame.s74 + 0)
.s125:
34d0 : d0 06 __ BNE $34d8 ; (prepare_frame.s43 + 0)
.s124:
34d2 : a5 55 __ LDA T1 + 0 
34d4 : c9 50 __ CMP #$50
34d6 : 90 f5 __ BCC $34cd ; (prepare_frame.s73 + 10)
.s43:
34d8 : e6 5c __ INC T12 + 0 
34da : a5 5c __ LDA T12 + 0 
34dc : c9 04 __ CMP #$04
34de : d0 a2 __ BNE $3482 ; (prepare_frame.l41 + 0)
.s44:
34e0 : a9 00 __ LDA #$00
34e2 : 85 5b __ STA T5 + 0 
.l45:
34e4 : 0a __ __ ASL
34e5 : 0a __ __ ASL
34e6 : 85 57 __ STA T2 + 0 
34e8 : a8 __ __ TAY
34e9 : b9 f0 3e LDA $3ef0,y ; (pipes[0].x + 0)
34ec : 0a __ __ ASL
34ed : 85 53 __ STA T0 + 0 
34ef : b9 f1 3e LDA $3ef1,y ; (pipes[0].x + 1)
34f2 : 2a __ __ ROL
34f3 : 06 53 __ ASL T0 + 0 
34f5 : 2a __ __ ROL
34f6 : 06 53 __ ASL T0 + 0 
34f8 : 2a __ __ ROL
34f9 : aa __ __ TAX
34fa : ad ed 3e LDA $3eed ; (phase + 0)
34fd : 0a __ __ ASL
34fe : 85 55 __ STA T1 + 0 
3500 : a9 00 __ LDA #$00
3502 : 2a __ __ ROL
3503 : 85 56 __ STA T1 + 1 
3505 : 38 __ __ SEC
3506 : a5 53 __ LDA T0 + 0 
3508 : e5 55 __ SBC T1 + 0 
350a : 85 59 __ STA T3 + 0 
350c : 8a __ __ TXA
350d : e5 56 __ SBC T1 + 1 
350f : 85 5a __ STA T3 + 1 
3511 : b9 f3 3e LDA $3ef3,y ; (pipes[0].passed + 0)
3514 : d0 0f __ BNE $3525 ; (prepare_frame.s157 + 0)
.s62:
3516 : a5 5a __ LDA T3 + 1 
3518 : 30 10 __ BMI $352a ; (prepare_frame.s63 + 0)
.s72:
351a : f0 03 __ BEQ $351f ; (prepare_frame.s71 + 0)
351c : 4c 02 36 JMP $3602 ; (prepare_frame.s46 + 0)
.s71:
351f : a5 59 __ LDA T3 + 0 
3521 : c9 b1 __ CMP #$b1
3523 : 90 05 __ BCC $352a ; (prepare_frame.s63 + 0)
.s157:
3525 : a5 5a __ LDA T3 + 1 
3527 : 4c 02 36 JMP $3602 ; (prepare_frame.s46 + 0)
.s63:
352a : a9 01 __ LDA #$01
352c : 99 f3 3e STA $3ef3,y ; (pipes[0].passed + 0)
352f : ac e8 3e LDY $3ee8 ; (score + 1)
3532 : a9 04 __ LDA #$04
3534 : 85 11 __ STA P4 
3536 : 84 13 __ STY P6 
3538 : ae e7 3e LDX $3ee7 ; (score + 0)
353b : 86 12 __ STX P5 
353d : c0 27 __ CPY #$27
353f : d0 02 __ BNE $3543 ; (prepare_frame.s70 + 0)
.s69:
3541 : e0 0f __ CPX #$0f
.s70:
3543 : b0 11 __ BCS $3556 ; (prepare_frame.s65 + 0)
.s64:
3545 : 8a __ __ TXA
3546 : 69 01 __ ADC #$01
3548 : 85 12 __ STA P5 
354a : 8d e7 3e STA $3ee7 ; (score + 0)
354d : aa __ __ TAX
354e : 90 01 __ BCC $3551 ; (prepare_frame.s155 + 0)
.s154:
3550 : c8 __ __ INY
.s155:
3551 : 84 13 __ STY P6 
3553 : 8c e8 3e STY $3ee8 ; (score + 1)
.s65:
3556 : 86 1b __ STX ACCU + 0 
3558 : 84 1c __ STY ACCU + 1 
355a : a9 0a __ LDA #$0a
355c : 20 5a 3c JSR $3c5a ; (divmod + 53)
355f : a5 05 __ LDA WORK + 2 
3561 : d0 0a __ BNE $356d ; (prepare_frame.s68 + 0)
.s66:
3563 : ad ee 3e LDA $3eee ; (speed + 0)
3566 : c9 0c __ CMP #$0c
3568 : b0 03 __ BCS $356d ; (prepare_frame.s68 + 0)
.s67:
356a : ee ee 3e INC $3eee ; (speed + 0)
.s68:
356d : 20 db 25 JSR $25db ; (number.s4 + 0)
3570 : a9 00 __ LDA #$00
3572 : 85 10 __ STA P3 
3574 : 85 11 __ STA P4 
3576 : a9 01 __ LDA #$01
3578 : 85 0d __ STA P0 
357a : a9 33 __ LDA #$33
357c : 85 0e __ STA P1 
357e : a9 43 __ LDA #$43
3580 : 85 0f __ STA P2 
3582 : a9 07 __ LDA #$07
3584 : 85 12 __ STA P5 
3586 : a9 10 __ LDA #$10
3588 : 85 13 __ STA P6 
358a : 20 17 39 JSR $3917 ; (start.s4 + 0)
358d : a9 00 __ LDA #$00
358f : 8d 5f 7d STA $7d5f ; (jump_freq[0] + 2)
3592 : a9 5a __ LDA #$5a
3594 : 8d 60 7d STA $7d60 ; (jump_freq[0] + 3)
3597 : a9 04 __ LDA #$04
3599 : 8d 5b 7d STA $7d5b ; (jump_at[0] + 1)
.s47:
359c : a5 5a __ LDA T3 + 1 
359e : 30 51 __ BMI $35f1 ; (prepare_frame.s51 + 0)
.s59:
35a0 : d0 06 __ BNE $35a8 ; (prepare_frame.s48 + 0)
.s58:
35a2 : a5 59 __ LDA T3 + 0 
35a4 : c9 b1 __ CMP #$b1
35a6 : 90 49 __ BCC $35f1 ; (prepare_frame.s51 + 0)
.s48:
35a8 : a6 57 __ LDX T2 + 0 
35aa : bd f2 3e LDA $3ef2,x ; (pipes[0].gap + 0)
35ad : 4a __ __ LSR
35ae : 85 54 __ STA T0 + 1 
35b0 : a9 00 __ LDA #$00
35b2 : 6a __ __ ROR
35b3 : 85 53 __ STA T0 + 0 
35b5 : ad ec 3e LDA $3eec ; (bird_y + 1)
35b8 : 30 2e __ BMI $35e8 ; (prepare_frame.s49 + 0)
.s57:
35ba : c5 54 __ CMP T0 + 1 
35bc : d0 05 __ BNE $35c3 ; (prepare_frame.s56 + 0)
.s55:
35be : ad eb 3e LDA $3eeb ; (bird_y + 0)
35c1 : c5 53 __ CMP T0 + 0 
.s56:
35c3 : 90 23 __ BCC $35e8 ; (prepare_frame.s49 + 0)
.s50:
35c5 : a5 53 __ LDA T0 + 0 
35c7 : 69 7f __ ADC #$7f
35c9 : aa __ __ TAX
35ca : a5 54 __ LDA T0 + 1 
35cc : 69 03 __ ADC #$03
35ce : a8 __ __ TAY
35cf : ad eb 3e LDA $3eeb ; (bird_y + 0)
35d2 : 18 __ __ CLC
35d3 : 69 c0 __ ADC #$c0
35d5 : 85 55 __ STA T1 + 0 
35d7 : ad ec 3e LDA $3eec ; (bird_y + 1)
35da : 69 00 __ ADC #$00
35dc : 30 13 __ BMI $35f1 ; (prepare_frame.s51 + 0)
.s54:
35de : 85 56 __ STA T1 + 1 
35e0 : c4 56 __ CPY T1 + 1 
35e2 : d0 02 __ BNE $35e6 ; (prepare_frame.s53 + 0)
.s52:
35e4 : e4 55 __ CPX T1 + 0 
.s53:
35e6 : b0 09 __ BCS $35f1 ; (prepare_frame.s51 + 0)
.s49:
35e8 : 20 4f 24 JSR $244f ; (bird_draw.s4 + 0)
35eb : 20 c5 38 JSR $38c5 ; (crash.s4 + 0)
35ee : 4c 8f 33 JMP $338f ; (prepare_frame.s9 + 0)
.s51:
35f1 : e6 5b __ INC T5 + 0 
35f3 : a5 5b __ LDA T5 + 0 
35f5 : c9 04 __ CMP #$04
35f7 : b0 03 __ BCS $35fc ; (prepare_frame.s19 + 0)
35f9 : 4c e4 34 JMP $34e4 ; (prepare_frame.l45 + 0)
.s19:
35fc : 20 4f 24 JSR $244f ; (bird_draw.s4 + 0)
35ff : 4c 8f 33 JMP $338f ; (prepare_frame.s9 + 0)
.s46:
3602 : 49 80 __ EOR #$80
3604 : c9 81 __ CMP #$81
3606 : d0 04 __ BNE $360c ; (prepare_frame.s61 + 0)
.s60:
3608 : a5 59 __ LDA T3 + 0 
360a : c9 18 __ CMP #$18
.s61:
360c : b0 e3 __ BCS $35f1 ; (prepare_frame.s51 + 0)
360e : 90 8c __ BCC $359c ; (prepare_frame.s47 + 0)
.s74:
3610 : b9 f2 3e LDA $3ef2,y ; (pipes[0].gap + 0)
3613 : 85 4f __ STA T13 + 0 
3615 : 8a __ __ TXA
3616 : 18 __ __ CLC
3617 : 69 08 __ ADC #$08
3619 : a8 __ __ TAY
361a : a5 54 __ LDA T0 + 1 
361c : 69 00 __ ADC #$00
361e : 85 58 __ STA T2 + 1 
3620 : a5 55 __ LDA T1 + 0 
3622 : 30 04 __ BMI $3628 ; (prepare_frame.s75 + 0)
.s145:
3624 : c9 23 __ CMP #$23
3626 : b0 0f __ BCS $3637 ; (prepare_frame.s77 + 0)
.s75:
3628 : a5 54 __ LDA T0 + 1 
362a : 30 0b __ BMI $3637 ; (prepare_frame.s77 + 0)
.s123:
362c : d0 04 __ BNE $3632 ; (prepare_frame.s76 + 0)
.s122:
362e : e0 17 __ CPX #$17
3630 : 90 05 __ BCC $3637 ; (prepare_frame.s77 + 0)
.s76:
3632 : a9 01 __ LDA #$01
3634 : 8d de 55 STA $55de ; (bird_stale + 0)
.s77:
3637 : 8a __ __ TXA
3638 : 18 __ __ CLC
3639 : 69 00 __ ADC #$00
363b : 85 59 __ STA T3 + 0 
363d : a9 5e __ LDA #$5e
363f : 65 54 __ ADC T0 + 1 
3641 : 85 5a __ STA T3 + 1 
3643 : 8a __ __ TXA
3644 : 18 __ __ CLC
3645 : 69 30 __ ADC #$30
3647 : 85 53 __ STA T0 + 0 
3649 : a9 56 __ LDA #$56
364b : 65 54 __ ADC T0 + 1 
364d : 85 54 __ STA T0 + 1 
364f : 24 55 __ BIT T1 + 0 
3651 : 30 03 __ BMI $3656 ; (prepare_frame.s120 + 0)
3653 : 4c 5c 37 JMP $375c ; (prepare_frame.s78 + 0)
.s120:
3656 : 38 __ __ SEC
3657 : a9 00 __ LDA #$00
3659 : e5 55 __ SBC T1 + 0 
365b : aa __ __ TAX
365c : bd cc 3c LDA $3ccc,x ; (__shltab1023L + 0)
365f : 85 55 __ STA T1 + 0 
3661 : bd d6 3c LDA $3cd6,x ; (__shltab1023H + 0)
3664 : 29 03 __ AND #$03
3666 : 85 56 __ STA T1 + 1 
3668 : a5 58 __ LDA T2 + 1 
366a : d0 04 __ BNE $3670 ; (prepare_frame.s90 + 0)
.s121:
366c : c0 51 __ CPY #$51
366e : 90 10 __ BCC $3680 ; (prepare_frame.s93 + 0)
.s90:
3670 : 98 __ __ TYA
3671 : 29 0f __ AND #$0f
3673 : f0 0b __ BEQ $3680 ; (prepare_frame.s93 + 0)
.s158:
3675 : aa __ __ TAX
3676 : a5 56 __ LDA T1 + 1 
.l91:
3678 : 4a __ __ LSR
3679 : 66 55 __ ROR T1 + 0 
367b : ca __ __ DEX
367c : d0 fa __ BNE $3678 ; (prepare_frame.l91 + 0)
.s92:
367e : 85 56 __ STA T1 + 1 
.s93:
3680 : 18 __ __ CLC
3681 : a5 4f __ LDA T13 + 0 
3683 : 69 07 __ ADC #$07
3685 : 85 57 __ STA T2 + 0 
3687 : a9 00 __ LDA #$00
3689 : 2a __ __ ROL
368a : 85 58 __ STA T2 + 1 
368c : a5 56 __ LDA T1 + 1 
368e : 29 02 __ AND #$02
3690 : 85 44 __ STA T4 + 1 
3692 : a5 55 __ LDA T1 + 0 
3694 : 29 01 __ AND #$01
3696 : 85 5b __ STA T5 + 0 
3698 : 38 __ __ SEC
3699 : a5 57 __ LDA T2 + 0 
369b : e9 08 __ SBC #$08
369d : 85 45 __ STA T6 + 0 
369f : a5 58 __ LDA T2 + 1 
36a1 : e9 00 __ SBC #$00
36a3 : 85 46 __ STA T6 + 1 
36a5 : a5 55 __ LDA T1 + 0 
36a7 : 29 02 __ AND #$02
36a9 : 85 47 __ STA T7 + 0 
36ab : a5 56 __ LDA T1 + 1 
36ad : 29 01 __ AND #$01
36af : 85 4a __ STA T8 + 1 
36b1 : a5 55 __ LDA T1 + 0 
36b3 : 29 80 __ AND #$80
36b5 : 85 4b __ STA T9 + 0 
36b7 : a5 55 __ LDA T1 + 0 
36b9 : 29 04 __ AND #$04
36bb : 85 55 __ STA T1 + 0 
36bd : a2 00 __ LDX #$00
.l159:
36bf : e4 4f __ CPX T13 + 0 
36c1 : 90 08 __ BCC $36cb ; (prepare_frame.s96 + 0)
.s94:
36c3 : a5 58 __ LDA T2 + 1 
36c5 : d0 3c __ BNE $3703 ; (prepare_frame.s95 + 0)
.s118:
36c7 : e4 57 __ CPX T2 + 0 
36c9 : 90 38 __ BCC $3703 ; (prepare_frame.s95 + 0)
.s96:
36cb : a5 46 __ LDA T6 + 1 
36cd : d0 04 __ BNE $36d3 ; (prepare_frame.s107 + 0)
.s117:
36cf : e4 45 __ CPX T6 + 0 
36d1 : f0 4f __ BEQ $3722 ; (prepare_frame.s97 + 0)
.s107:
36d3 : a5 58 __ LDA T2 + 1 
36d5 : d0 04 __ BNE $36db ; (prepare_frame.s108 + 0)
.s116:
36d7 : e4 57 __ CPX T2 + 0 
36d9 : f0 47 __ BEQ $3722 ; (prepare_frame.s97 + 0)
.s108:
36db : a5 47 __ LDA T7 + 0 
36dd : f0 06 __ BEQ $36e5 ; (prepare_frame.s110 + 0)
.s109:
36df : a9 0a __ LDA #$0a
36e1 : a0 01 __ LDY #$01
36e3 : 91 53 __ STA (T0 + 0),y 
.s110:
36e5 : a5 55 __ LDA T1 + 0 
36e7 : f0 06 __ BEQ $36ef ; (prepare_frame.s112 + 0)
.s111:
36e9 : a9 0b __ LDA #$0b
36eb : a0 02 __ LDY #$02
36ed : 91 53 __ STA (T0 + 0),y 
.s112:
36ef : a5 4b __ LDA T9 + 0 
36f1 : f0 06 __ BEQ $36f9 ; (prepare_frame.s114 + 0)
.s113:
36f3 : a9 0c __ LDA #$0c
36f5 : a0 07 __ LDY #$07
36f7 : 91 53 __ STA (T0 + 0),y 
.s114:
36f9 : a5 4a __ LDA T8 + 1 
36fb : f0 06 __ BEQ $3703 ; (prepare_frame.s95 + 0)
.s115:
36fd : a9 20 __ LDA #$20
36ff : a0 08 __ LDY #$08
.s139:
3701 : 91 53 __ STA (T0 + 0),y 
.s95:
3703 : e8 __ __ INX
3704 : e0 15 __ CPX #$15
3706 : 90 03 __ BCC $370b ; (prepare_frame.s141 + 0)
3708 : 4c d8 34 JMP $34d8 ; (prepare_frame.s43 + 0)
.s141:
370b : a5 59 __ LDA T3 + 0 
370d : 69 50 __ ADC #$50
370f : 85 59 __ STA T3 + 0 
3711 : 90 03 __ BCC $3716 ; (prepare_frame.s147 + 0)
.s146:
3713 : e6 5a __ INC T3 + 1 
3715 : 18 __ __ CLC
.s147:
3716 : a5 53 __ LDA T0 + 0 
3718 : 69 50 __ ADC #$50
371a : 85 53 __ STA T0 + 0 
371c : 90 a1 __ BCC $36bf ; (prepare_frame.l159 + 0)
.s148:
371e : e6 54 __ INC T0 + 1 
3720 : b0 9d __ BCS $36bf ; (prepare_frame.l159 + 0)
.s97:
3722 : a5 5b __ LDA T5 + 0 
3724 : f0 0a __ BEQ $3730 ; (prepare_frame.s99 + 0)
.s98:
3726 : a9 05 __ LDA #$05
3728 : a0 00 __ LDY #$00
372a : 91 59 __ STA (T3 + 0),y 
372c : a9 0d __ LDA #$0d
372e : 91 53 __ STA (T0 + 0),y 
.s99:
3730 : a5 47 __ LDA T7 + 0 
3732 : f0 06 __ BEQ $373a ; (prepare_frame.s101 + 0)
.s100:
3734 : a9 0e __ LDA #$0e
3736 : a0 01 __ LDY #$01
3738 : 91 53 __ STA (T0 + 0),y 
.s101:
373a : a5 55 __ LDA T1 + 0 
373c : f0 06 __ BEQ $3744 ; (prepare_frame.s103 + 0)
.s102:
373e : a9 0f __ LDA #$0f
3740 : a0 02 __ LDY #$02
3742 : 91 53 __ STA (T0 + 0),y 
.s103:
3744 : a5 4a __ LDA T8 + 1 
3746 : f0 06 __ BEQ $374e ; (prepare_frame.s105 + 0)
.s104:
3748 : a9 10 __ LDA #$10
374a : a0 08 __ LDY #$08
374c : 91 53 __ STA (T0 + 0),y 
.s105:
374e : a5 44 __ LDA T4 + 1 
3750 : f0 b1 __ BEQ $3703 ; (prepare_frame.s95 + 0)
.s106:
3752 : a9 04 __ LDA #$04
3754 : a0 09 __ LDY #$09
3756 : 91 59 __ STA (T3 + 0),y 
3758 : a9 20 __ LDA #$20
375a : d0 a5 __ BNE $3701 ; (prepare_frame.s139 + 0)
.s78:
375c : a5 58 __ LDA T2 + 1 
375e : d0 04 __ BNE $3764 ; (prepare_frame.s89 + 0)
.s119:
3760 : c0 51 __ CPY #$51
3762 : 90 0b __ BCC $376f ; (prepare_frame.s79 + 0)
.s89:
3764 : a9 ff __ LDA #$ff
3766 : 85 55 __ STA T1 + 0 
3768 : a9 03 __ LDA #$03
376a : 85 56 __ STA T1 + 1 
376c : 4c 70 36 JMP $3670 ; (prepare_frame.s90 + 0)
.s79:
376f : a5 4f __ LDA T13 + 0 
3771 : 69 07 __ ADC #$07
3773 : 85 55 __ STA T1 + 0 
3775 : a9 00 __ LDA #$00
3777 : 2a __ __ ROL
3778 : 85 56 __ STA T1 + 1 
377a : 38 __ __ SEC
377b : a5 55 __ LDA T1 + 0 
377d : e9 08 __ SBC #$08
377f : 85 57 __ STA T2 + 0 
3781 : a5 56 __ LDA T1 + 1 
3783 : e9 00 __ SBC #$00
3785 : 85 58 __ STA T2 + 1 
3787 : a2 00 __ LDX #$00
.l160:
3789 : e4 4f __ CPX T13 + 0 
378b : 90 08 __ BCC $3795 ; (prepare_frame.s82 + 0)
.s80:
378d : a5 56 __ LDA T1 + 1 
378f : d0 51 __ BNE $37e2 ; (prepare_frame.s81 + 0)
.s88:
3791 : e4 55 __ CPX T1 + 0 
3793 : 90 4d __ BCC $37e2 ; (prepare_frame.s81 + 0)
.s82:
3795 : a5 58 __ LDA T2 + 1 
3797 : d0 04 __ BNE $379d ; (prepare_frame.s84 + 0)
.s87:
3799 : e4 57 __ CPX T2 + 0 
379b : f0 08 __ BEQ $37a5 ; (prepare_frame.s83 + 0)
.s84:
379d : a5 56 __ LDA T1 + 1 
379f : d0 2b __ BNE $37cc ; (prepare_frame.s85 + 0)
.s86:
37a1 : e4 55 __ CPX T1 + 0 
37a3 : d0 27 __ BNE $37cc ; (prepare_frame.s85 + 0)
.s83:
37a5 : a9 05 __ LDA #$05
37a7 : a0 00 __ LDY #$00
37a9 : 91 59 __ STA (T3 + 0),y 
37ab : a9 04 __ LDA #$04
37ad : a0 09 __ LDY #$09
37af : 91 59 __ STA (T3 + 0),y 
37b1 : a9 0d __ LDA #$0d
37b3 : a0 00 __ LDY #$00
37b5 : 91 53 __ STA (T0 + 0),y 
37b7 : a9 0e __ LDA #$0e
37b9 : c8 __ __ INY
37ba : 91 53 __ STA (T0 + 0),y 
37bc : a9 0f __ LDA #$0f
37be : c8 __ __ INY
37bf : 91 53 __ STA (T0 + 0),y 
37c1 : a9 10 __ LDA #$10
37c3 : a0 08 __ LDY #$08
37c5 : 91 53 __ STA (T0 + 0),y 
37c7 : a9 20 __ LDA #$20
37c9 : c8 __ __ INY
37ca : d0 14 __ BNE $37e0 ; (prepare_frame.s140 + 0)
.s85:
37cc : a9 0a __ LDA #$0a
37ce : a0 01 __ LDY #$01
37d0 : 91 53 __ STA (T0 + 0),y 
37d2 : a9 0b __ LDA #$0b
37d4 : c8 __ __ INY
37d5 : 91 53 __ STA (T0 + 0),y 
37d7 : a9 0c __ LDA #$0c
37d9 : a0 07 __ LDY #$07
37db : 91 53 __ STA (T0 + 0),y 
37dd : a9 20 __ LDA #$20
37df : c8 __ __ INY
.s140:
37e0 : 91 53 __ STA (T0 + 0),y 
.s81:
37e2 : e8 __ __ INX
37e3 : e0 15 __ CPX #$15
37e5 : 90 03 __ BCC $37ea ; (prepare_frame.s142 + 0)
37e7 : 4c d8 34 JMP $34d8 ; (prepare_frame.s43 + 0)
.s142:
37ea : a5 59 __ LDA T3 + 0 
37ec : 69 50 __ ADC #$50
37ee : 85 59 __ STA T3 + 0 
37f0 : 90 03 __ BCC $37f5 ; (prepare_frame.s150 + 0)
.s149:
37f2 : e6 5a __ INC T3 + 1 
37f4 : 18 __ __ CLC
.s150:
37f5 : a5 53 __ LDA T0 + 0 
37f7 : 69 50 __ ADC #$50
37f9 : 85 53 __ STA T0 + 0 
37fb : 90 8c __ BCC $3789 ; (prepare_frame.l160 + 0)
.s151:
37fd : e6 54 __ INC T0 + 1 
37ff : b0 88 __ BCS $3789 ; (prepare_frame.l160 + 0)
.s18:
3801 : 20 a8 27 JSR $27a8 ; (game_over.s4 + 0)
3804 : 4c 8f 33 JMP $338f ; (prepare_frame.s9 + 0)
.s26:
3807 : a9 03 __ LDA #$03
3809 : cd e6 3e CMP $3ee6 ; (state + 0)
380c : d0 0b __ BNE $3819 ; (prepare_frame.s28 + 0)
.s27:
380e : a9 01 __ LDA #$01
3810 : 8d e6 3e STA $3ee6 ; (state + 0)
3813 : 20 7b 25 JSR $257b ; (field.s4 + 0)
3816 : 4c fc 35 JMP $35fc ; (prepare_frame.s19 + 0)
.s28:
3819 : 8d e6 3e STA $3ee6 ; (state + 0)
381c : 20 d5 27 JSR $27d5 ; (banner.s4 + 0)
381f : 4c 8f 33 JMP $338f ; (prepare_frame.s9 + 0)
.s14:
3822 : ad e9 3e LDA $3ee9 ; (velocity + 0)
3825 : a8 __ __ TAY
3826 : 69 01 __ ADC #$01
3828 : 8d e9 3e STA $3ee9 ; (velocity + 0)
382b : ad ea 3e LDA $3eea ; (velocity + 1)
382e : aa __ __ TAX
382f : 69 00 __ ADC #$00
3831 : 8d ea 3e STA $3eea ; (velocity + 1)
3834 : 8a __ __ TXA
3835 : 30 10 __ BMI $3847 ; (prepare_frame.s16 + 0)
.s23:
3837 : d0 04 __ BNE $383d ; (prepare_frame.s15 + 0)
.s22:
3839 : c0 2f __ CPY #$2f
383b : 90 0a __ BCC $3847 ; (prepare_frame.s16 + 0)
.s15:
383d : a9 30 __ LDA #$30
383f : 8d e9 3e STA $3ee9 ; (velocity + 0)
3842 : a9 00 __ LDA #$00
3844 : 8d ea 3e STA $3eea ; (velocity + 1)
.s16:
3847 : ad eb 3e LDA $3eeb ; (bird_y + 0)
384a : 18 __ __ CLC
384b : 6d e9 3e ADC $3ee9 ; (velocity + 0)
384e : 8d eb 3e STA $3eeb ; (bird_y + 0)
3851 : ad ec 3e LDA $3eec ; (bird_y + 1)
3854 : 6d ea 3e ADC $3eea ; (velocity + 1)
3857 : 8d ec 3e STA $3eec ; (bird_y + 1)
385a : 49 80 __ EOR #$80
385c : c9 89 __ CMP #$89
385e : d0 05 __ BNE $3865 ; (prepare_frame.s21 + 0)
.s20:
3860 : ad eb 3e LDA $3eeb ; (bird_y + 0)
3863 : c9 c0 __ CMP #$c0
.s21:
3865 : 90 af __ BCC $3816 ; (prepare_frame.s27 + 8)
.s17:
3867 : a9 c0 __ LDA #$c0
3869 : 8d eb 3e STA $3eeb ; (bird_y + 0)
386c : a9 09 __ LDA #$09
386e : 8d ec 3e STA $3eec ; (bird_y + 1)
3871 : 20 4f 24 JSR $244f ; (bird_draw.s4 + 0)
3874 : 4c 01 38 JMP $3801 ; (prepare_frame.s18 + 0)
.s7:
3877 : ad 4a 7d LDA $7d4a ; (death_delay + 0)
387a : f0 06 __ BEQ $3882 ; (prepare_frame.s10 + 0)
.s8:
387c : ce 4a 7d DEC $7d4a ; (death_delay + 0)
387f : 4c 8f 33 JMP $338f ; (prepare_frame.s9 + 0)
.s10:
3882 : a5 53 __ LDA T0 + 0 
3884 : 29 01 __ AND #$01
3886 : f0 f7 __ BEQ $387f ; (prepare_frame.s8 + 3)
.s11:
3888 : 8d e6 3e STA $3ee6 ; (state + 0)
388b : 20 dd 23 JSR $23dd ; (reset_game.s4 + 0)
388e : a9 de __ LDA #$de
3890 : 8d e9 3e STA $3ee9 ; (velocity + 0)
3893 : a9 ff __ LDA #$ff
3895 : 8d ea 3e STA $3eea ; (velocity + 1)
3898 : 4c 8c 33 JMP $338c ; (prepare_frame.s12 + 0)
--------------------------------------------------------------------
sound_flap: ; sound_flap()->void
;  16, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
389b : a9 00 __ LDA #$00
389d : 85 0e __ STA P1 
389f : 85 10 __ STA P3 
38a1 : 8d 04 d4 STA $d404 
38a4 : a9 35 __ LDA #$35
38a6 : 8d 05 d4 STA $d405 
38a9 : a9 02 __ LDA #$02
38ab : 8d 06 d4 STA $d406 
38ae : a9 18 __ LDA #$18
38b0 : 85 0f __ STA P2 
38b2 : a9 06 __ LDA #$06
38b4 : 85 11 __ STA P4 
38b6 : a9 04 __ LDA #$04
38b8 : 85 12 __ STA P5 
--------------------------------------------------------------------
start@proxy: ; start@proxy
38ba : a9 00 __ LDA #$00
38bc : 85 0d __ STA P0 
38be : a9 80 __ LDA #$80
38c0 : 85 13 __ STA P6 
38c2 : 4c 17 39 JMP $3917 ; (start.s4 + 0)
--------------------------------------------------------------------
crash: ; crash()->void
; 526, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
38c5 : a9 04 __ LDA #$04
38c7 : 8d e6 3e STA $3ee6 ; (state + 0)
38ca : a9 00 __ LDA #$00
38cc : 8d 04 d4 STA $d404 
38cf : 8d e9 3e STA $3ee9 ; (velocity + 0)
38d2 : 8d ea 3e STA $3eea ; (velocity + 1)
38d5 : a9 03 __ LDA #$03
38d7 : 8d f8 55 STA $55f8 ; (flash + 0)
38da : a9 08 __ LDA #$08
38dc : 8d 05 d4 STA $d405 
38df : a9 88 __ LDA #$88
38e1 : 8d 06 d4 STA $d406 
38e4 : a9 66 __ LDA #$66
38e6 : 85 0e __ STA P1 
38e8 : a9 0e __ LDA #$0e
38ea : 85 0f __ STA P2 
38ec : a9 cd __ LDA #$cd
38ee : 85 10 __ STA P3 
38f0 : a9 fe __ LDA #$fe
38f2 : 85 11 __ STA P4 
38f4 : a9 05 __ LDA #$05
38f6 : 85 12 __ STA P5 
38f8 : 20 ba 38 JSR $38ba ; (start@proxy + 0)
38fb : a9 02 __ LDA #$02
38fd : 85 0d __ STA P0 
38ff : a9 40 __ LDA #$40
3901 : 85 13 __ STA P6 
3903 : a9 cd __ LDA #$cd
3905 : 85 0e __ STA P1 
3907 : a9 4c __ LDA #$4c
3909 : 85 0f __ STA P2 
390b : a9 66 __ LDA #$66
390d : 85 10 __ STA P3 
390f : a9 fc __ LDA #$fc
3911 : 85 11 __ STA P4 
3913 : a9 1a __ LDA #$1a
3915 : 85 12 __ STA P5 
--------------------------------------------------------------------
start: ; start(u8,u16,i16,u8,u8)->void
;  73, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.c"
.s4:
3917 : a6 0d __ LDX P0 ; (v + 0)
3919 : bc c9 3c LDY $3cc9,x ; (__multab7L + 0)
391c : 84 43 __ STY T4 + 0 
391e : a9 00 __ LDA #$00
3920 : 9d 5a 7d STA $7d5a,x ; (jump_at[0] + 0)
3923 : 99 04 d4 STA $d404,y 
3926 : 8a __ __ TXA
3927 : 0a __ __ ASL
3928 : a8 __ __ TAY
3929 : a5 0e __ LDA P1 ; (f + 0)
392b : 99 4b 7d STA $7d4b,y ; (freq[0] + 0)
392e : a5 0f __ LDA P2 ; (f + 1)
3930 : 99 4c 7d STA $7d4c,y ; (freq[0] + 1)
3933 : a5 10 __ LDA P3 ; (s + 0)
3935 : 99 51 7d STA $7d51,y ; (step[0] + 0)
3938 : a5 11 __ LDA P4 ; (s + 1)
393a : 99 52 7d STA $7d52,y ; (step[0] + 1)
393d : a5 12 __ LDA P5 ; (n + 0)
393f : 9d db 3e STA $3edb,x ; (timer[0] + 0)
3942 : a5 13 __ LDA P6 ; (w + 0)
3944 : 9d 57 7d STA $7d57,x ; (wave[0] + 0)
3947 : 8a __ __ TXA
3948 : 20 55 39 JSR $3955 ; (apply.s4 + 0)
394b : a5 13 __ LDA P6 ; (w + 0)
394d : 09 01 __ ORA #$01
394f : a6 43 __ LDX T4 + 0 
3951 : 9d 04 d4 STA $d404,x 
.s3:
3954 : 60 __ __ RTS
--------------------------------------------------------------------
apply: ; apply(u8)->void
;  65, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.c"
.s4:
3955 : aa __ __ TAX
3956 : 0a __ __ ASL
3957 : bc c9 3c LDY $3cc9,x ; (__multab7L + 0)
395a : aa __ __ TAX
395b : bd 4b 7d LDA $7d4b,x ; (freq[0] + 0)
395e : 99 00 d4 STA $d400,y 
3961 : bd 4c 7d LDA $7d4c,x ; (freq[0] + 1)
3964 : 99 01 d4 STA $d401,y 
.s3:
3967 : 60 __ __ RTS
--------------------------------------------------------------------
sound_tick: ; sound_tick(u8)->void
;  12, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3968 : a5 0e __ LDA P1 ; (ticks + 0)
396a : d0 01 __ BNE $396d ; (sound_tick.l5 + 0)
396c : 60 __ __ RTS
.l5:
396d : a2 00 __ LDX #$00
396f : ad db 3e LDA $3edb ; (timer[0] + 0)
3972 : d0 0d __ BNE $3981 ; (sound_tick.l7 + 0)
.l23:
3974 : e8 __ __ INX
3975 : e0 03 __ CPX #$03
3977 : 90 03 __ BCC $397c ; (sound_tick.s6 + 0)
3979 : 4c 1f 3a JMP $3a1f ; (sound_tick.s14 + 0)
.s6:
397c : bd db 3e LDA $3edb,x ; (timer[0] + 0)
397f : f0 f3 __ BEQ $3974 ; (sound_tick.l23 + 0)
.l7:
3981 : 86 47 __ STX T6 + 0 
3983 : 85 48 __ STA T7 + 0 
3985 : 8a __ __ TXA
3986 : 0a __ __ ASL
3987 : 85 46 __ STA T5 + 0 
3989 : a8 __ __ TAY
398a : b9 52 7d LDA $7d52,y ; (step[0] + 1)
398d : 19 51 7d ORA $7d51,y ; (step[0] + 0)
3990 : f0 55 __ BEQ $39e7 ; (sound_tick.s11 + 0)
.s8:
3992 : b9 52 7d LDA $7d52,y ; (step[0] + 1)
3995 : 29 80 __ AND #$80
3997 : 10 02 __ BPL $399b ; (sound_tick.s8 + 9)
3999 : a9 ff __ LDA #$ff
399b : 85 1d __ STA ACCU + 2 
399d : b9 51 7d LDA $7d51,y ; (step[0] + 0)
39a0 : 18 __ __ CLC
39a1 : 79 4b 7d ADC $7d4b,y ; (freq[0] + 0)
39a4 : 85 43 __ STA T0 + 0 
39a6 : b9 52 7d LDA $7d52,y ; (step[0] + 1)
39a9 : 79 4c 7d ADC $7d4c,y ; (freq[0] + 1)
39ac : 85 44 __ STA T0 + 1 
39ae : a5 1d __ LDA ACCU + 2 
39b0 : 69 00 __ ADC #$00
39b2 : 85 45 __ STA T0 + 2 
39b4 : a5 1d __ LDA ACCU + 2 
39b6 : 69 00 __ ADC #$00
39b8 : 10 15 __ BPL $39cf ; (sound_tick.s17 + 0)
.s9:
39ba : a9 00 __ LDA #$00
.s22:
39bc : 85 44 __ STA T0 + 1 
.s10:
39be : 99 4b 7d STA $7d4b,y ; (freq[0] + 0)
39c1 : a5 44 __ LDA T0 + 1 
39c3 : 99 4c 7d STA $7d4c,y ; (freq[0] + 1)
39c6 : 8a __ __ TXA
39c7 : 20 55 39 JSR $3955 ; (apply.s4 + 0)
39ca : a6 47 __ LDX T6 + 0 
39cc : 4c e7 39 JMP $39e7 ; (sound_tick.s11 + 0)
.s17:
39cf : d0 04 __ BNE $39d5 ; (sound_tick.s25 + 0)
.s18:
39d1 : a5 45 __ LDA T0 + 2 
39d3 : f0 04 __ BEQ $39d9 ; (sound_tick.s19 + 0)
.s25:
39d5 : a9 ff __ LDA #$ff
39d7 : d0 e3 __ BNE $39bc ; (sound_tick.s22 + 0)
.s19:
39d9 : a9 ff __ LDA #$ff
39db : c5 44 __ CMP T0 + 1 
39dd : d0 02 __ BNE $39e1 ; (sound_tick.s21 + 0)
.s20:
39df : c5 43 __ CMP T0 + 0 
.s21:
39e1 : 90 d9 __ BCC $39bc ; (sound_tick.s22 + 0)
.s24:
39e3 : a5 43 __ LDA T0 + 0 
39e5 : b0 d7 __ BCS $39be ; (sound_tick.s10 + 0)
.s11:
39e7 : c6 48 __ DEC T7 + 0 
39e9 : a5 48 __ LDA T7 + 0 
39eb : 9d db 3e STA $3edb,x ; (timer[0] + 0)
39ee : dd 5a 7d CMP $7d5a,x ; (jump_at[0] + 0)
39f1 : d0 19 __ BNE $3a0c ; (sound_tick.s16 + 0)
.s12:
39f3 : bd 5a 7d LDA $7d5a,x ; (jump_at[0] + 0)
39f6 : f0 14 __ BEQ $3a0c ; (sound_tick.s16 + 0)
.s13:
39f8 : a4 46 __ LDY T5 + 0 
39fa : b9 5d 7d LDA $7d5d,y ; (jump_freq[0] + 0)
39fd : 99 4b 7d STA $7d4b,y ; (freq[0] + 0)
3a00 : b9 5e 7d LDA $7d5e,y ; (jump_freq[0] + 1)
3a03 : 99 4c 7d STA $7d4c,y ; (freq[0] + 1)
3a06 : 8a __ __ TXA
3a07 : 20 55 39 JSR $3955 ; (apply.s4 + 0)
3a0a : a6 47 __ LDX T6 + 0 
.s16:
3a0c : a5 48 __ LDA T7 + 0 
3a0e : f0 03 __ BEQ $3a13 ; (sound_tick.s15 + 0)
3a10 : 4c 74 39 JMP $3974 ; (sound_tick.l23 + 0)
.s15:
3a13 : bd 57 7d LDA $7d57,x ; (wave[0] + 0)
3a16 : bc c9 3c LDY $3cc9,x ; (__multab7L + 0)
3a19 : 99 04 d4 STA $d404,y 
3a1c : 4c 74 39 JMP $3974 ; (sound_tick.l23 + 0)
.s14:
3a1f : c6 0e __ DEC P1 ; (ticks + 0)
3a21 : f0 03 __ BEQ $3a26 ; (sound_tick.s3 + 0)
3a23 : 4c 6d 39 JMP $396d ; (sound_tick.l5 + 0)
.s3:
3a26 : 60 __ __ RTS
--------------------------------------------------------------------
stage_frame: ; stage_frame()->void
; 734, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s1:
3a27 : a2 04 __ LDX #$04
3a29 : b5 53 __ LDA T2 + 0,x 
3a2b : 9d f7 bf STA $bff7,x ; (stage_frame@stack + 0)
3a2e : ca __ __ DEX
3a2f : 10 f8 __ BPL $3a29 ; (stage_frame.s1 + 2)
.s4:
3a31 : ad 48 7d LDA $7d48 ; (stepped + 0)
3a34 : 8d ff 55 STA $55ff ; (flip + 0)
3a37 : ae 63 7d LDX $7d63 ; (max_dirty + 0)
3a3a : ad 64 7d LDA $7d64 ; (max_dirty + 1)
3a3d : cd e0 55 CMP $55e0 ; (dirty_count + 1)
3a40 : d0 03 __ BNE $3a45 ; (stage_frame.s37 + 0)
.s36:
3a42 : ec df 55 CPX $55df ; (dirty_count + 0)
.s37:
3a45 : b0 0c __ BCS $3a53 ; (stage_frame.s35 + 0)
.s5:
3a47 : ad df 55 LDA $55df ; (dirty_count + 0)
3a4a : 8d 63 7d STA $7d63 ; (max_dirty + 0)
3a4d : ad e0 55 LDA $55e0 ; (dirty_count + 1)
3a50 : 8d 64 7d STA $7d64 ; (max_dirty + 1)
.s35:
3a53 : ad 48 7d LDA $7d48 ; (stepped + 0)
3a56 : d0 0b __ BNE $3a63 ; (stage_frame.s6 + 0)
.s3:
3a58 : a2 04 __ LDX #$04
3a5a : bd f7 bf LDA $bff7,x ; (stage_frame@stack + 0)
3a5d : 95 53 __ STA T2 + 0,x 
3a5f : ca __ __ DEX
3a60 : 10 f8 __ BPL $3a5a ; (stage_frame.s3 + 2)
3a62 : 60 __ __ RTS
.s6:
3a63 : ad eb 3e LDA $3eeb ; (bird_y + 0)
3a66 : 85 54 __ STA T3 + 0 
3a68 : ad ec 3e LDA $3eec ; (bird_y + 1)
3a6b : 4a __ __ LSR
3a6c : 66 54 __ ROR T3 + 0 
3a6e : 4a __ __ LSR
3a6f : 66 54 __ ROR T3 + 0 
3a71 : 4a __ __ LSR
3a72 : 66 54 __ ROR T3 + 0 
3a74 : 4a __ __ LSR
3a75 : 66 54 __ ROR T3 + 0 
3a77 : 4a __ __ LSR
3a78 : 66 54 __ ROR T3 + 0 
3a7a : 4a __ __ LSR
3a7b : 66 54 __ ROR T3 + 0 
3a7d : 4a __ __ LSR
3a7e : 66 54 __ ROR T3 + 0 
3a80 : a9 00 __ LDA #$00
3a82 : 85 55 __ STA T4 + 0 
.l7:
3a84 : 0a __ __ ASL
3a85 : 0a __ __ ASL
3a86 : a8 __ __ TAY
3a87 : b9 f0 3e LDA $3ef0,y ; (pipes[0].x + 0)
3a8a : 38 __ __ SEC
3a8b : e9 01 __ SBC #$01
3a8d : aa __ __ TAX
3a8e : b9 f1 3e LDA $3ef1,y ; (pipes[0].x + 1)
3a91 : e9 00 __ SBC #$00
3a93 : 30 06 __ BMI $3a9b ; (stage_frame.s21 + 0)
.s34:
3a95 : d0 38 __ BNE $3acf ; (stage_frame.s8 + 0)
.s33:
3a97 : e0 23 __ CPX #$23
3a99 : b0 34 __ BCS $3acf ; (stage_frame.s8 + 0)
.s21:
3a9b : b9 f1 3e LDA $3ef1,y ; (pipes[0].x + 1)
3a9e : 30 2f __ BMI $3acf ; (stage_frame.s8 + 0)
.s32:
3aa0 : d0 07 __ BNE $3aa9 ; (stage_frame.s22 + 0)
.s31:
3aa2 : b9 f0 3e LDA $3ef0,y ; (pipes[0].x + 0)
3aa5 : c9 15 __ CMP #$15
3aa7 : 90 26 __ BCC $3acf ; (stage_frame.s8 + 0)
.s22:
3aa9 : b9 f2 3e LDA $3ef2,y ; (pipes[0].gap + 0)
3aac : 85 56 __ STA T5 + 0 
3aae : a5 54 __ LDA T3 + 0 
3ab0 : 85 57 __ STA T6 + 0 
3ab2 : 4c b9 3a JMP $3ab9 ; (stage_frame.l23 + 0)
.s27:
3ab5 : a5 54 __ LDA T3 + 0 
3ab7 : e6 57 __ INC T6 + 0 
.l23:
3ab9 : 18 __ __ CLC
3aba : 69 03 __ ADC #$03
3abc : 85 43 __ STA T0 + 0 
3abe : a9 00 __ LDA #$00
3ac0 : a6 57 __ LDX T6 + 0 
3ac2 : 86 52 __ STX T1 + 0 
3ac4 : 6a __ __ ROR
3ac5 : 30 04 __ BMI $3acb ; (stage_frame.s38 + 0)
.s30:
3ac7 : e4 43 __ CPX T0 + 0 
3ac9 : b0 04 __ BCS $3acf ; (stage_frame.s8 + 0)
.s38:
3acb : e0 15 __ CPX #$15
3acd : 90 63 __ BCC $3b32 ; (stage_frame.s24 + 0)
.s8:
3acf : e6 55 __ INC T4 + 0 
3ad1 : a5 55 __ LDA T4 + 0 
3ad3 : c9 04 __ CMP #$04
3ad5 : d0 ad __ BNE $3a84 ; (stage_frame.l7 + 0)
.s9:
3ad7 : a9 0c __ LDA #$0c
3ad9 : 85 11 __ STA P4 
3adb : ad 44 7d LDA $7d44 ; (page + 0)
3ade : 85 52 __ STA T1 + 0 
3ae0 : f0 06 __ BEQ $3ae8 ; (stage_frame.s20 + 0)
.s10:
3ae2 : a9 00 __ LDA #$00
3ae4 : 85 0f __ STA P2 
3ae6 : f0 06 __ BEQ $3aee ; (stage_frame.s11 + 0)
.s20:
3ae8 : a9 00 __ LDA #$00
3aea : 85 0f __ STA P2 
3aec : a9 10 __ LDA #$10
.s11:
3aee : 85 10 __ STA P3 
3af0 : 20 65 2d JSR $2d65 ; (write_cells.s4 + 0)
.l12:
3af3 : ad 00 d6 LDA $d600 
3af6 : 29 20 __ AND #$20
3af8 : d0 f9 __ BNE $3af3 ; (stage_frame.l12 + 0)
.s13:
3afa : a9 0c __ LDA #$0c
3afc : 8d 00 d6 STA $d600 
3aff : a5 52 __ LDA T1 + 0 
3b01 : 49 01 __ EOR #$01
3b03 : 8d 44 7d STA $7d44 ; (page + 0)
3b06 : f0 06 __ BEQ $3b0e ; (stage_frame.s15 + 0)
.s14:
3b08 : a9 10 __ LDA #$10
3b0a : a2 01 __ LDX #$01
3b0c : d0 03 __ BNE $3b11 ; (stage_frame.l16 + 0)
.s15:
3b0e : a9 00 __ LDA #$00
3b10 : aa __ __ TAX
.l16:
3b11 : 2c 00 d6 BIT $d600 
3b14 : 10 fb __ BPL $3b11 ; (stage_frame.l16 + 0)
.s17:
3b16 : 8d 01 d6 STA $d601 
3b19 : a9 14 __ LDA #$14
3b1b : 8d 00 d6 STA $d600 
3b1e : 8a __ __ TXA
3b1f : f0 04 __ BEQ $3b25 ; (stage_frame.s40 + 0)
.s41:
3b21 : a9 18 __ LDA #$18
3b23 : d0 02 __ BNE $3b27 ; (stage_frame.l18 + 0)
.s40:
3b25 : a9 08 __ LDA #$08
.l18:
3b27 : 2c 00 d6 BIT $d600 
3b2a : 10 fb __ BPL $3b27 ; (stage_frame.l18 + 0)
.s19:
3b2c : 8d 01 d6 STA $d601 
3b2f : 4c 58 3a JMP $3a58 ; (stage_frame.s3 + 0)
.s24:
3b32 : e4 56 __ CPX T5 + 0 
3b34 : 90 0f __ BCC $3b45 ; (stage_frame.s25 + 0)
.s28:
3b36 : a5 56 __ LDA T5 + 0 
3b38 : 69 06 __ ADC #$06
3b3a : 90 03 __ BCC $3b3f ; (stage_frame.s29 + 0)
3b3c : 4c b5 3a JMP $3ab5 ; (stage_frame.s27 + 0)
.s29:
3b3f : c5 57 __ CMP T6 + 0 
3b41 : 90 02 __ BCC $3b45 ; (stage_frame.s25 + 0)
.s39:
3b43 : d0 f7 __ BNE $3b3c ; (stage_frame.s28 + 6)
.s25:
3b45 : 06 52 __ ASL T1 + 0 
3b47 : a9 1e __ LDA #$1e
3b49 : 85 53 __ STA T2 + 0 
.l26:
3b4b : a6 52 __ LDX T1 + 0 
3b4d : bd 00 56 LDA $5600,x ; (row_addr[0] + 0)
3b50 : 18 __ __ CLC
3b51 : 65 53 __ ADC T2 + 0 
3b53 : a8 __ __ TAY
3b54 : bd 01 56 LDA $5601,x ; (row_addr[0] + 1)
3b57 : 69 00 __ ADC #$00
3b59 : aa __ __ TAX
3b5a : 98 __ __ TYA
3b5b : 20 8e 32 JSR $328e ; (hidden_stale.s4 + 0)
3b5e : e6 53 __ INC T2 + 0 
3b60 : a5 53 __ LDA T2 + 0 
3b62 : c9 23 __ CMP #$23
3b64 : d0 e5 __ BNE $3b4b ; (stage_frame.l26 + 0)
3b66 : 4c b5 3a JMP $3ab5 ; (stage_frame.s27 + 0)
--------------------------------------------------------------------
restore_vdc: ; restore_vdc()->void
; 808, "/Users/lukaszdziwosz/Desktop/Flappy80/src/flappy.c"
.s4:
3b69 : a2 1e __ LDX #$1e
.l5:
3b6b : ca __ __ DEX
3b6c : e0 10 __ CPX #$10
3b6e : f0 fb __ BEQ $3b6b ; (restore_vdc.l5 + 0)
.s6:
3b70 : e0 11 __ CPX #$11
3b72 : f0 f7 __ BEQ $3b6b ; (restore_vdc.l5 + 0)
.s7:
3b74 : 8a __ __ TXA
3b75 : a8 __ __ TAY
3b76 : bd 38 3f LDA $3f38,x ; (saved_regs[0] + 0)
3b79 : 8c 00 d6 STY $d600 
.l8:
3b7c : 2c 00 d6 BIT $d600 
3b7f : 10 fb __ BPL $3b7c ; (restore_vdc.l8 + 0)
.s9:
3b81 : 8d 01 d6 STA $d601 
3b84 : 98 __ __ TYA
3b85 : d0 e4 __ BNE $3b6b ; (restore_vdc.l5 + 0)
.s3:
3b87 : 60 __ __ RTS
--------------------------------------------------------------------
sound_off: ; sound_off()->void
;  13, "/Users/lukaszdziwosz/Desktop/Flappy80/src/sound.h"
.s4:
3b88 : a9 00 __ LDA #$00
3b8a : 8d 04 d4 STA $d404 
3b8d : 8d 0b d4 STA $d40b 
3b90 : 8d 12 d4 STA $d412 
3b93 : 8d 18 d4 STA $d418 
.s3:
3b96 : 60 __ __ RTS
--------------------------------------------------------------------
putch: ; putch(u8)->void
;  89, "/Users/lukaszdziwosz/Desktop/80Terminal/.tools/oscar64/include/conio.h"
.s4:
3b97 : aa __ __ TAX
3b98 : ad ec 3c LDA $3cec ; (giocharmap + 0)
3b9b : f0 2c __ BEQ $3bc9 ; (putch.s7 + 0)
.s5:
3b9d : e0 0a __ CPX #$0a
3b9f : d0 05 __ BNE $3ba6 ; (putch.s8 + 0)
.s6:
3ba1 : a9 0d __ LDA #$0d
.s18:
3ba3 : 4c d2 ff JMP $ffd2 
.s8:
3ba6 : e0 09 __ CPX #$09
3ba8 : f0 29 __ BEQ $3bd3 ; (putch.s9 + 0)
.s11:
3baa : c9 02 __ CMP #$02
3bac : 90 1b __ BCC $3bc9 ; (putch.s7 + 0)
.s12:
3bae : e0 41 __ CPX #$41
3bb0 : 90 17 __ BCC $3bc9 ; (putch.s7 + 0)
.s13:
3bb2 : e0 7b __ CPX #$7b
3bb4 : b0 13 __ BCS $3bc9 ; (putch.s7 + 0)
.s14:
3bb6 : 8a __ __ TXA
3bb7 : e0 61 __ CPX #$61
3bb9 : b0 04 __ BCS $3bbf ; (putch.s15 + 0)
.s17:
3bbb : c9 5b __ CMP #$5b
3bbd : b0 0a __ BCS $3bc9 ; (putch.s7 + 0)
.s15:
3bbf : 49 20 __ EOR #$20
3bc1 : aa __ __ TAX
3bc2 : ad ec 3c LDA $3cec ; (giocharmap + 0)
3bc5 : c9 02 __ CMP #$02
3bc7 : f0 04 __ BEQ $3bcd ; (putch.s16 + 0)
.s7:
3bc9 : 8a __ __ TXA
3bca : 4c a3 3b JMP $3ba3 ; (putch.s18 + 0)
.s16:
3bcd : 8a __ __ TXA
3bce : 29 5f __ AND #$5f
3bd0 : 4c a3 3b JMP $3ba3 ; (putch.s18 + 0)
.s9:
3bd3 : a5 ec __ LDA $ec 
3bd5 : 29 03 __ AND #$03
3bd7 : a8 __ __ TAY
.l10:
3bd8 : a9 20 __ LDA #$20
3bda : 20 d2 ff JSR $ffd2 
3bdd : c8 __ __ INY
3bde : c0 04 __ CPY #$04
3be0 : 90 f6 __ BCC $3bd8 ; (putch.l10 + 0)
.s3:
3be2 : 60 __ __ RTS
--------------------------------------------------------------------
3be3 : __ __ __ BYT 54 48 41 4e 4b 20 59 4f 55 00                   : THANK YOU.
--------------------------------------------------------------------
mul16by8: ; mul16by8
3bed : 4a __ __ LSR
3bee : f0 2e __ BEQ $3c1e ; (mul16by8 + 49)
3bf0 : a2 00 __ LDX #$00
3bf2 : a0 00 __ LDY #$00
3bf4 : 90 13 __ BCC $3c09 ; (mul16by8 + 28)
3bf6 : a4 1b __ LDY ACCU + 0 
3bf8 : a6 1c __ LDX ACCU + 1 
3bfa : b0 0d __ BCS $3c09 ; (mul16by8 + 28)
3bfc : 85 02 __ STA $02 
3bfe : 18 __ __ CLC
3bff : 98 __ __ TYA
3c00 : 65 1b __ ADC ACCU + 0 
3c02 : a8 __ __ TAY
3c03 : 8a __ __ TXA
3c04 : 65 1c __ ADC ACCU + 1 
3c06 : aa __ __ TAX
3c07 : a5 02 __ LDA $02 
3c09 : 06 1b __ ASL ACCU + 0 
3c0b : 26 1c __ ROL ACCU + 1 
3c0d : 4a __ __ LSR
3c0e : 90 f9 __ BCC $3c09 ; (mul16by8 + 28)
3c10 : d0 ea __ BNE $3bfc ; (mul16by8 + 15)
3c12 : 18 __ __ CLC
3c13 : 98 __ __ TYA
3c14 : 65 1b __ ADC ACCU + 0 
3c16 : 85 1b __ STA ACCU + 0 
3c18 : 8a __ __ TXA
3c19 : 65 1c __ ADC ACCU + 1 
3c1b : 85 1c __ STA ACCU + 1 
3c1d : 60 __ __ RTS
3c1e : b0 04 __ BCS $3c24 ; (mul16by8 + 55)
3c20 : 85 1b __ STA ACCU + 0 
3c22 : 85 1c __ STA ACCU + 1 
3c24 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
3c25 : a5 1c __ LDA ACCU + 1 
3c27 : d0 3b __ BNE $3c64 ; (divmod + 63)
3c29 : a5 04 __ LDA WORK + 1 
3c2b : d0 1e __ BNE $3c4b ; (divmod + 38)
3c2d : 85 06 __ STA WORK + 3 
3c2f : a2 04 __ LDX #$04
3c31 : 06 1b __ ASL ACCU + 0 
3c33 : 2a __ __ ROL
3c34 : c5 03 __ CMP WORK + 0 
3c36 : 90 02 __ BCC $3c3a ; (divmod + 21)
3c38 : e5 03 __ SBC WORK + 0 
3c3a : 26 1b __ ROL ACCU + 0 
3c3c : 2a __ __ ROL
3c3d : c5 03 __ CMP WORK + 0 
3c3f : 90 02 __ BCC $3c43 ; (divmod + 30)
3c41 : e5 03 __ SBC WORK + 0 
3c43 : 26 1b __ ROL ACCU + 0 
3c45 : ca __ __ DEX
3c46 : d0 eb __ BNE $3c33 ; (divmod + 14)
3c48 : 85 05 __ STA WORK + 2 
3c4a : 60 __ __ RTS
3c4b : a5 1b __ LDA ACCU + 0 
3c4d : 85 05 __ STA WORK + 2 
3c4f : a5 1c __ LDA ACCU + 1 
3c51 : 85 06 __ STA WORK + 3 
3c53 : a9 00 __ LDA #$00
3c55 : 85 1b __ STA ACCU + 0 
3c57 : 85 1c __ STA ACCU + 1 
3c59 : 60 __ __ RTS
3c5a : 85 03 __ STA WORK + 0 
3c5c : a9 00 __ LDA #$00
3c5e : 85 04 __ STA WORK + 1 
3c60 : a5 1c __ LDA ACCU + 1 
3c62 : f0 c9 __ BEQ $3c2d ; (divmod + 8)
3c64 : a5 04 __ LDA WORK + 1 
3c66 : d0 1f __ BNE $3c87 ; (divmod + 98)
3c68 : a5 03 __ LDA WORK + 0 
3c6a : 30 1b __ BMI $3c87 ; (divmod + 98)
3c6c : a9 00 __ LDA #$00
3c6e : 85 06 __ STA WORK + 3 
3c70 : a2 10 __ LDX #$10
3c72 : 06 1b __ ASL ACCU + 0 
3c74 : 26 1c __ ROL ACCU + 1 
3c76 : 2a __ __ ROL
3c77 : c5 03 __ CMP WORK + 0 
3c79 : 90 02 __ BCC $3c7d ; (divmod + 88)
3c7b : e5 03 __ SBC WORK + 0 
3c7d : 26 1b __ ROL ACCU + 0 
3c7f : 26 1c __ ROL ACCU + 1 
3c81 : ca __ __ DEX
3c82 : d0 f2 __ BNE $3c76 ; (divmod + 81)
3c84 : 85 05 __ STA WORK + 2 
3c86 : 60 __ __ RTS
3c87 : a9 00 __ LDA #$00
3c89 : 85 05 __ STA WORK + 2 
3c8b : 85 06 __ STA WORK + 3 
3c8d : a0 10 __ LDY #$10
3c8f : 18 __ __ CLC
3c90 : 26 1b __ ROL ACCU + 0 
3c92 : 26 1c __ ROL ACCU + 1 
3c94 : 26 05 __ ROL WORK + 2 
3c96 : 26 06 __ ROL WORK + 3 
3c98 : 38 __ __ SEC
3c99 : a5 05 __ LDA WORK + 2 
3c9b : e5 03 __ SBC WORK + 0 
3c9d : aa __ __ TAX
3c9e : a5 06 __ LDA WORK + 3 
3ca0 : e5 04 __ SBC WORK + 1 
3ca2 : 90 04 __ BCC $3ca8 ; (divmod + 131)
3ca4 : 86 05 __ STX WORK + 2 
3ca6 : 85 06 __ STA WORK + 3 
3ca8 : 88 __ __ DEY
3ca9 : d0 e5 __ BNE $3c90 ; (divmod + 107)
3cab : 26 1b __ ROL ACCU + 0 
3cad : 26 1c __ ROL ACCU + 1 
3caf : 60 __ __ RTS
--------------------------------------------------------------------
__multab60L:
3cb0 : __ __ __ BYT 00 3c 78                                        : .<x
--------------------------------------------------------------------
__multab5L:
3cb3 : __ __ __ BYT 00 05 0a 0f 14 19 1e 23 28 2d 32 37             : .......#(-27
--------------------------------------------------------------------
__multab8192L:
3cbf : __ __ __ BYT 00 00 00 00 00                                  : .....
--------------------------------------------------------------------
__multab8192H:
3cc4 : __ __ __ BYT 00 20 40 60 80                                  : . @`.
--------------------------------------------------------------------
__multab7L:
3cc9 : __ __ __ BYT 00 07 0e                                        : ...
--------------------------------------------------------------------
__shltab1023L:
3ccc : __ __ __ BYT ff fe fc f8 f0 e0 c0 80 00 00                   : ..........
--------------------------------------------------------------------
__shltab1023H:
3cd6 : __ __ __ BYT 03 07 0f 1f 3f 7f ff ff ff fe                   : ....?.....
--------------------------------------------------------------------
panel_text@proxy: ; panel_text@proxy
3ce0 : a5 1b __ LDA ACCU + 0 
3ce2 : 85 12 __ STA P5 
3ce4 : a5 1c __ LDA ACCU + 1 
3ce6 : 85 13 __ STA P6 
3ce8 : 4c d3 28 JMP $28d3 ; (panel_text.s4 + 0)
--------------------------------------------------------------------
spentry:
3ceb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
3cec : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
round:
3ced : __ __ __ BYT 0f 3f 7f 7f ff ff ff ff                         : .?......
--------------------------------------------------------------------
stripe:
3cf5 : __ __ __ BYT f0 78 3c 1e 0f 87 c3 e1                         : .x<.....
--------------------------------------------------------------------
random_state:
3cfd : __ __ __ BYT e1 ac                                           : ..
--------------------------------------------------------------------
bird_row:
3cff : __ __ __ BYT ff                                              : .
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
flap:
3dfc : __ __ __ BYT 00 01 02 01                                     : ....
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
shown_row:
3eb4 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
bird_colours:
3eb5 : __ __ __ BYT 0d 0d 0d 0f 09                                  : .....
--------------------------------------------------------------------
pipe_tiles:
3eba : __ __ __ BYT 20 0a 0b 0b 0b 0b 0b 0c 20 20 20 0d 0e 0f 0f 0f :  .......   .....
3eca : __ __ __ BYT 0f 0f 0f 10 20 20                               : ....  
--------------------------------------------------------------------
cap_attr:
3ed0 : __ __ __ BYT 05 05 05 05 05 05 05 05 05 04 04                : ...........
--------------------------------------------------------------------
timer:
3edb : __ __ __ BSS	3
--------------------------------------------------------------------
set_pose:
3ede : __ __ __ BSS	8
--------------------------------------------------------------------
state:
3ee6 : __ __ __ BSS	1
--------------------------------------------------------------------
score:
3ee7 : __ __ __ BSS	2
--------------------------------------------------------------------
velocity:
3ee9 : __ __ __ BSS	2
--------------------------------------------------------------------
bird_y:
3eeb : __ __ __ BSS	2
--------------------------------------------------------------------
phase:
3eed : __ __ __ BSS	1
--------------------------------------------------------------------
speed:
3eee : __ __ __ BSS	1
--------------------------------------------------------------------
scroll:
3eef : __ __ __ BSS	1
--------------------------------------------------------------------
pipes:
3ef0 : __ __ __ BSS	16
--------------------------------------------------------------------
bitshift:
3f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
3f10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f20 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
3f30 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
saved_regs:
3f38 : __ __ __ BSS	37
--------------------------------------------------------------------
saved_font:
3f5d : __ __ __ BSS	3840
--------------------------------------------------------------------
shapes:
4e5d : __ __ __ BSS	1920
--------------------------------------------------------------------
redrawn:
55dd : __ __ __ BSS	1
--------------------------------------------------------------------
bird_stale:
55de : __ __ __ BSS	1
--------------------------------------------------------------------
dirty_count:
55df : __ __ __ BSS	2
--------------------------------------------------------------------
front_count:
55e1 : __ __ __ BSS	2
--------------------------------------------------------------------
best:
55e3 : __ __ __ BSS	2
--------------------------------------------------------------------
simulation_count:
55e5 : __ __ __ BSS	2
--------------------------------------------------------------------
bird_pose:
55e7 : __ __ __ BSS	1
--------------------------------------------------------------------
shown_set:
55e8 : __ __ __ BSS	1
--------------------------------------------------------------------
bird_set:
55e9 : __ __ __ BSS	1
--------------------------------------------------------------------
panel_y:
55ea : __ __ __ BSS	1
--------------------------------------------------------------------
line:
55eb : __ __ __ BSS	11
--------------------------------------------------------------------
show_time:
55f6 : __ __ __ BSS	2
--------------------------------------------------------------------
flash:
55f8 : __ __ __ BSS	1
--------------------------------------------------------------------
copy_src:
55f9 : __ __ __ BSS	2
--------------------------------------------------------------------
copy_dst:
55fb : __ __ __ BSS	2
--------------------------------------------------------------------
blank_overruns:
55fd : __ __ __ BSS	2
--------------------------------------------------------------------
flip:
55ff : __ __ __ BSS	1
--------------------------------------------------------------------
row_addr:
5600 : __ __ __ BSS	50
--------------------------------------------------------------------
screen:
5632 : __ __ __ BSS	2000
--------------------------------------------------------------------
attr:
5e02 : __ __ __ BSS	2000
--------------------------------------------------------------------
marked:
65d2 : __ __ __ BSS	2000
--------------------------------------------------------------------
dirty:
6da2 : __ __ __ BSS	4000
--------------------------------------------------------------------
frame_count:
7d42 : __ __ __ BSS	2
--------------------------------------------------------------------
page:
7d44 : __ __ __ BSS	1
--------------------------------------------------------------------
prerendered:
7d45 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_ticks:
7d46 : __ __ __ BSS	1
--------------------------------------------------------------------
tempo:
7d47 : __ __ __ BSS	1
--------------------------------------------------------------------
stepped:
7d48 : __ __ __ BSS	1
--------------------------------------------------------------------
previous_keys:
7d49 : __ __ __ BSS	1
--------------------------------------------------------------------
death_delay:
7d4a : __ __ __ BSS	1
--------------------------------------------------------------------
freq:
7d4b : __ __ __ BSS	6
--------------------------------------------------------------------
step:
7d51 : __ __ __ BSS	6
--------------------------------------------------------------------
wave:
7d57 : __ __ __ BSS	3
--------------------------------------------------------------------
jump_at:
7d5a : __ __ __ BSS	3
--------------------------------------------------------------------
jump_freq:
7d5d : __ __ __ BSS	6
--------------------------------------------------------------------
max_dirty:
7d63 : __ __ __ BSS	2
