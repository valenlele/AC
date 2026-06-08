.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
str: .asciiz "Hola"

.code
lwu $s0, CONTROL($s0)
lwu $s1, DATA($s1)

daddi $s2, $0, str
sd $s2, 0($s1)
daddi $s3, $0, 4
sd $s3, 0($s0)
halt