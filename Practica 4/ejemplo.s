.data
A: .word 1
B: .word 2
RESUL: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
dadd r3, r1, r2
sd r3, RESUL(r0)

halt