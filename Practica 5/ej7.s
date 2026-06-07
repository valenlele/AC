; Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de 
; una tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
; La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

.data
M:     .word 5
tabla: .word 12, 3, 45, 15, 7, 2
dimf:  .word 6
cant:  .word 0

.code
ld $a0, M(r0)
daddi $a1, $0, tabla
ld $a2, dimf($0)
daddi $v0, $0, 0
jal mayoresM
sd $v0, cant($0)
halt

mayoresM: ld $t0, 0($a1)
slt $t1, $a0, $t0

dadd $v0, $v0, $t1 ; si no es mayor, $t1 = 0. de lo contrario, $t1 = 1. sumamos el res directamente a $v0

daddi $a2, $a2, -1
daddi $a1, $a1, 8
bnez $a2, mayoresM
jr $ra
