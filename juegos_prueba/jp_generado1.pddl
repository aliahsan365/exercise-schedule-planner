(define (problem problema1)
(:domain planificador_ejercicios)
(:objects
ejercicio1 - ejercicio
ejercicio2 - ejercicio
ejercicio3 - ejercicio
ejercicio4 - ejercicio
ejercicio5 - ejercicio
ejercicio6 - ejercicio
ejercicio7 - ejercicio
ejercicio8 - ejercicio
ejercicio9 - ejercicio
dia1 - dia
dia2 - dia
dia3 - dia
dia4 - dia
dia5 - dia
dia6 - dia
dia7 - dia
dia8 - dia
dia9 - dia
dia10 - dia
dia11 - dia
dia12 - dia
dia13 - dia
dia14 - dia
dia15 - dia
nivel0 - nivel
nivel1 - nivel
nivel2 - nivel
nivel3 - nivel
nivel4 - nivel
nivel5 - nivel
nivel6 - nivel
nivel7 - nivel
nivel8 - nivel
nivel9 - nivel
nivel10 - nivel
cont0 - contador
cont1 - contador
cont2 - contador
cont3 - contador
cont4 - contador
cont5 - contador
cont6 - contador
)

(:init
(estamos_dia dia1)
(contador_max cont6)
(contador_siguiente cont0 cont1)
(contador_siguiente cont1 cont2)
(contador_siguiente cont2 cont3)
(contador_siguiente cont3 cont4)
(contador_siguiente cont4 cont5)
(contador_siguiente cont5 cont6)
(contador_dia dia1 cont0)
(contador_dia dia2 cont0)
(contador_dia dia3 cont0)
(contador_dia dia4 cont0)
(contador_dia dia5 cont0)
(contador_dia dia6 cont0)
(contador_dia dia7 cont0)
(contador_dia dia8 cont0)
(contador_dia dia9 cont0)
(contador_dia dia10 cont0)
(contador_dia dia11 cont0)
(contador_dia dia12 cont0)
(contador_dia dia13 cont0)
(contador_dia dia14 cont0)
(contador_dia dia15 cont0)
(dia_siguiente dia1 dia2)
(dia_siguiente dia2 dia3)
(dia_siguiente dia3 dia4)
(dia_siguiente dia4 dia5)
(dia_siguiente dia5 dia6)
(dia_siguiente dia6 dia7)
(dia_siguiente dia7 dia8)
(dia_siguiente dia8 dia9)
(dia_siguiente dia9 dia10)
(dia_siguiente dia10 dia11)
(dia_siguiente dia11 dia12)
(dia_siguiente dia12 dia13)
(dia_siguiente dia13 dia14)
(dia_siguiente dia14 dia15)
(nivel_siguiente nivel0 nivel1)
(nivel_siguiente nivel1 nivel2)
(nivel_siguiente nivel2 nivel3)
(nivel_siguiente nivel3 nivel4)
(nivel_siguiente nivel4 nivel5)
(nivel_siguiente nivel5 nivel6)
(nivel_siguiente nivel6 nivel7)
(nivel_siguiente nivel7 nivel8)
(nivel_siguiente nivel8 nivel9)
(nivel_siguiente nivel9 nivel10)
(ejercicio_nivel ejercicio1 nivel0)
(ejercicio_nivel ejercicio2 nivel1)
(ejercicio_nivel ejercicio3 nivel0)
(ejercicio_nivel ejercicio4 nivel1)
(ejercicio_nivel ejercicio5 nivel0)
(ejercicio_nivel ejercicio6 nivel0)
(ejercicio_nivel ejercicio7 nivel2)
(ejercicio_nivel ejercicio8 nivel0)
(ejercicio_nivel ejercicio9 nivel1)
(ejercicio_precedible ejercicio2)
(ejercicio_precursor ejercicio2 ejercicio5)
(ejercicio_precedible ejercicio7)
(ejercicio_precursor ejercicio7 ejercicio4)
(ejercicio_precedible ejercicio4)
(ejercicio_precursor ejercicio4 ejercicio1)
(ejercicio_precedible ejercicio8)
(ejercicio_precursor ejercicio8 ejercicio6)
(ejercicio_precedible ejercicio1)
(ejercicio_precursor ejercicio1 ejercicio5)
(ejercicio_precedible ejercicio5)
(ejercicio_precursor ejercicio5 ejercicio2)
(ejercicio_precedible ejercicio8)
(ejercicio_precursor ejercicio8 ejercicio5)
(ejercicio_precedible ejercicio4)
(ejercicio_precursor ejercicio4 ejercicio6)
)

(:goal
(ejercicio_nivel ejercicio4 nivel10)
)
)

