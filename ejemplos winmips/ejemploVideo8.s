; definir un vector de 5 numeros V
; calcular el maximo valor del vector y guardarlo en una variable C

.data
  V: .word 4, -10, 512, 8, 16
  C: .word 0

.code
  ;r1 = valor act del vector
  ;r2 = maximo
  ;r3 = desplazamiento
  ;r4 = contador decreciente
  ;r5 = res slt

  daddi r2, r0, 0
  daddi r3, r0, 0
  daddi r4, r0, 5

  loop: ld r1, V(r3)
   	slt r5, r2, r1 ; r5 = 1 si el maximo es menor que el valor actual
        beqz r5, seguir 

	dadd r2, r0, r1

        seguir: daddi r3, r3, 8
		daddi r4, r4, -1
        	bnez r4, loop
  
  sd r2, C(r0)

  halt