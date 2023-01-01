 .ktext 0x4180
  main_handler:
  mfc0 $26,$13
  mfc0 $27,$14
  ori $27,$0,0x007c
  and $26,$27,$26
  beq $0,$26,interrupt
  nop
  mfc0 $26,$14
  add $26,$26,4
  mtc0 $26,$14
  beq $0,$0,return
  nop
  
  interrupt:
  ori $27,$0,0x2137
  sw $27,0x7f20($0)
  beq $0,$0,return
  nop

  return:
  eret