.data
CONTROL: .word32 0x10000
DATA:    .word32 0x10008

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

daddi $s2, $0, 8 ; codigo CONTROL de leer

sd $s2, 0($s0)   ; manda senal de leer a CONTROL. leo. guarda lo leido en DATA
ld $s3, 0($s1)   ; busco en DATA el numero leido y lo guardo
sd $s2, 0($s0)
ld $s4, 0($s1)

dadd $s5, $s3, $s4

sd $s5, 0($s1)
daddi $s2, $0, 1
sd $s2, 0($s0)

halt