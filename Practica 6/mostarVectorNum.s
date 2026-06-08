.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
vector: .word 45, -3, 12, 52, -25

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

daddi $s5, $0, 5
daddi $s3, $0, 0 ; desplazamiento
daddi $s4, $0, 2 ; codigo de CONTROL

loop: ld $s2, vector($s3)
sd $s2, 0($s1)
sd $s4, 0($s0)

daddi $s3, $s3, 8
daddi $s5, $s5, -1
bnez $s5, loop

halt