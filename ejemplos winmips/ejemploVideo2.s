; definir dos variables, A y B, con valores de 4 y 5 respectivamente
; definir una variable C, sin un valor
; cargar los valores de A y B en registros, sumar los valores y guardar los resultados en C

.data
A: .word 4
B: .word 5
C: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
dadd r3, r1, r2
sd r3, C(r0)

halt