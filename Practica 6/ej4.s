.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
ingresarCaracter: .asciiz "Ingrese una clave\n"
claveIngresada: .asciiz "...."
clave: .asciiz "hola"
bienvenido: .asciiz "Bienvenido"
error: .asciiz "ERROR\n"

.code
lwu $a0, CONTROL($0)
lwu $a1, DATA($0)
daddi $a2, $0, claveIngresada
daddi $a3, $0, clave
loop3: jal char
jal respuesta
bnez $v0, loop3
halt

char: daddi $t0, $0, ingresarCaracter
sd $t0, 0($a1)
daddi $t1, $0, 4
sd $t1, 0($a0)

daddi $t1, $0, 9
daddi $t3, $0, 0
daddi $t4, $0, 4

loop: sd $t1, 0($a0)
lbu $t2, 0($a1)
sb $t2, claveIngresada($t3)
daddi $t3, $t3, 1
daddi $t4, $t4, -1
bnez $t4, loop

jr $ra

respuesta: lbu $t3, 0($a2)
lbu $t4, 0($a3)

bne $t3, $t4, noIguales ; si no son iguales termino. ya tengo la posición donde no lo son en $v0
beqz $t3, identicas     ; si estoy aca es porque son iguales. si uno es 0, ambos son 0, entonces termine las cadenas y son identicas

daddi $a2, $a2, 1
daddi $a3, $a3, 1
j respuesta

identicas: daddi $t5, $0, bienvenido
sd $t5, 0($a1)
daddi $t6, $0, 4
sd $t6, 0($a0)
daddi $v0, $0, 0
j fin

noIguales: daddi $t5, $0, error
sd $t5, 0($a1)
daddi $t6, $0, 4
sd $t6, 0($a0)
daddi $v0, $0, -1

fin: jr $ra