; definir 2 variables A y B con valores 4 y 5 respectivamente
; definir la variable C sin un valor
; cargar los valores de A y B en registros, sumar los valores
; utilizar un desplazamiento desde A para cargar B

.data
A: .word 4
B: .word 5
C: .word 0

.code
  ld r1, A(r0)
  daddi r2, r0, 8
  ld r3, A(r2)

  dadd r4, r1, r3

  daddi r2, r0, 16
  sd r4, A(r2)

  halt