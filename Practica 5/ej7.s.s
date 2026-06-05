; Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una
; tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
; La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

.data
M:     .word 5
tabla: .word 12, 3, 45, 15, 7, 2
dimf:  .word 6
cant:  .word 0

.code
ld $a0, M(r0)


halt
