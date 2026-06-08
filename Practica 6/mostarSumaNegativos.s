.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

daddi $s2, $0, -2
daddi $s3, $0, -8
daddi $s4, $0, 0

dadd $s4, $s2, $s3

sd $s4, 0($s1)
daddi $s5, $0, 2
sd $s5, 0($s0) 
halt