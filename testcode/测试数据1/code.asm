 addi $s7, $s7, 1
 sw   $zero, 0x7f00($zero)
 lui  $t0, 0x114
 ori  $t0, $t0, 0x5140
 ori  $t1, $zero, 0x133
 sw   $zero, 0x7f00($zero)
 ori  $at, $zero, 0x401
 mtc0 $at, $t4
 ori  $at, $zero, 1
 sw   $at, 0x7f00($zero)
 ori  $at, $zero, 2
 sw   $at, 0x7f04($zero)
 ori  $at, $zero, 9
 sw   $at, 0x7f00($zero)
 sw   $t0, ($zero)
 lw   $t3, ($zero)
 beq  $t3, $t3, 0x3040
 lui  $s0, 3
 lui  $t0, 0x114
 ori  $t0, $t0, 0x5140
 ori  $t1, $zero, 0x133
 sw   $zero, 0x7f00($zero)
 ori  $at, $zero, 0x401
 mtc0 $at, $t4
 ori  $at, $zero, 1
 sw   $at, 0x7f00($zero)
 ori  $at, $zero, 1
 sw   $at, 0x7f04($zero)
 ori  $at, $zero, 9
 sw   $at, 0x7f00($zero)
 nop  
 sw   $t0, ($zero)
 lw   $t3, ($zero)
 beq  $t3, $t3, 0x3098
 lui  $s0, 0x114
 ori  $s0, $s0, 0x5140
 lui  $s1, 0x114
 ori  $s1, $s1, 0x5140
 lui  $s2, 0x114
 ori  $s2, $s2, 0x5140
 ori  $s6, $s7, 0
 sw   $zero, 0x7f00($zero)
 ori  $at, $zero, 0x401
 mtc0 $at, $t4
 ori  $at, $zero, 1
 sw   $at, 0x7f00($zero)
 ori  $at, $zero, 3
 sw   $at, 0x7f04($zero)
 ori  $at, $zero, 9
 sw   $at, 0x7f00($zero)
 mfc0 $at, $t4
 mtc0 $at, $t4 
 #b    0x30e4 
 mfc0 $at, $t4
 lui  $s0, 0x114
 ori  $s0, $s0, 0x5140
 lui  $s1, 0x114
 ori  $s1, $s1, 0x5140
 lui  $s2, 0x114
 ori  $s2, $s2, 0x5140
 ori  $s6, $s7, 0
 sw   $zero, 0x7f00($zero)
 ori  $at, $zero, 0x401
 mtc0 $at, $t4
 ori  $at, $zero, 1
 sw   $at, 0x7f00($zero)
 ori  $at, $zero, 4
 sw   $at, 0x7f04($zero)
 ori  $at, $zero, 9
 sw   $at, 0x7f00($zero)
 addi $t4, $s7, 1
 mfc0 $at, $t4
 mtc0 $at, $t4
 beq  $t4, $s7, 0x3118
 mfc0 $at, $t4
 nop  
 nop  
 nop  
 ori  $s0, $s0, 0x5140
 lui  $s1, 0x114
 sw   $zero, 0x7f00($zero)
 ori  $at, $zero, 0x401
 mtc0 $at, $t4
 ori  $at, $zero, 1
 sw   $at, 0x7f00($zero)
 ori  $at, $zero, 3
 sw   $at, 0x7f04($zero)
 ori  $at, $zero, 9
 sw   $at, 0x7f00($zero)
 lui  $t0, 0x7fff
 ori  $t0, $t0, 0xffff
 ori  $at, $zero, 1
 add  $t0, $t0, $at
 #beqz $t0, 0x3174
 slt  $t0, $zero, $t0
 nop  
 ori  $at, $zero, 0x777
