.data
valor: .word 5
result: .word 0

.text
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial
sd $v0, result($0)
halt

factorial: slti $t0, $a0, 2 ; $t0 = 1 si $a0 es menor a 2
bnez $t0, fin

daddi $sp, $sp, -16
sd $ra, 0($sp)
sd $a0, 8($sp)

daddi $a0, $a0, -1

jal factorial

ld $a0, 8($sp)
ld $ra, 0($sp)
daddi $sp, $sp, 16
dmul $v0, $v0, $a0
jr $ra

fin: daddi $v0, $0, 1
jr $ra
