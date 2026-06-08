.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
texto: .asciiz "....."

.text
lwu $s0, DATA(r0)    ; $s0 = dirección de DATA
lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL

daddi $s2, $0, 9     ; codigo de CONTROL para leer un car
daddi $s4, $0, 0     ; desplazamiento
daddi $s5, $0, 5     ; long string

loop: sd $s2, 0($s1) ; leer un caracter
lbu $s3, 0($s0)      ; traerlo de DATA a un regisro
sb $s3, texto($s4)   ; guardarlo en memoria
daddi $s5, $s5, -1
daddi $s4, $s4, 1
bnez $s5, loop

daddi $t0, $0, texto ; $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0)       ; DATA recibe el puntero al comienzo del mensaje

daddi $t0, $0, 6     ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
sd $t0, 0($s1)       ; CONTROL recibe 6 y limpia la pantalla

daddi $t0, $0, 4     ; $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1)       ; CONTROL recibe 4 y produce la salida del mensaje
halt