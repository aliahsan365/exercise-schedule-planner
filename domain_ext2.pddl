(define (domain planificador_ejercicios)

  (:requirements
    :strips
    :equality
    :typing
    :adl
  )

  (:types
    ejercicio dia nivel - object
  )

  (:predicates
    (estamos_dia ?dia - dia)
    (dia_siguiente ?dia1 ?dia2 - dia)
    (hecho_ejercicio ?ej - ejercicio ?dia - dia)
    (ejercicio_nivel ?ej - ejercicio ?nivel - nivel)
    (ejercicio_preparable ?ej - ejercicio)
    ;el ejercicio preparador de ?ej es ?preparador
    (ejercicio_preparador ?ej ?preparador - ejercicio)
    (ejercicio_preparado ?ej - ejercicio ?dia - dia)
    (ejercicio_precedible ?ej - ejercicio)
    ;el ejercicio precursor de ?ej es ?precursor
    (ejercicio_precursor ?ej ?precursor - ejercicio)
    (ejercicio_precedido ?ej - ejercicio)
    (nivel_siguiente ?nivel - nivel ?nivel_siguiente - nivel)
    (ejercicio_anterior ?ej - ejercicio)
  )

  (:action cambiar_Dia
    :parameters (?x ?y - dia ?ej_ant - ejercicio)
    :precondition (and
      (estamos_dia ?x)
      (ejercicio_anterior ?ej_ant)
      (dia_siguiente ?x ?y)
    )
    :effect (and
      (not (estamos_dia ?x))
      (estamos_dia ?y)
      (not (ejercicio_anterior ?ej_ant))
    )
  )

  (:action hacer_Ejercicio
    :parameters (?ej - ejercicio ?hoy - dia ?nivel_anterior ?nivel - nivel)
    :precondition (and
      (estamos_dia ?hoy)
      (not (hecho_ejercicio ?ej ?hoy))
      (ejercicio_nivel ?ej ?nivel_anterior)
      (or (not (ejercicio_preparable ?ej)) (ejercicio_preparado ?ej ?hoy))
      (or (not (ejercicio_precedible ?ej)) (ejercicio_precedido ?ej))
      (nivel_siguiente ?nivel_anterior ?nivel)
    )
    :effect (and
      (hecho_ejercicio ?ej ?hoy)
      (ejercicio_nivel ?ej ?nivel)
      (forall (?ej_ant - ejercicio) (and (not (ejercicio_precedido ?ej_ant)) (not (ejercicio_anterior ?ej_ant))))
      (ejercicio_anterior ?ej)
    )
  )

    (:action preceder_Ejercicio
      :parameters (?ej ?precursor - ejercicio ?hoy - dia)
      :precondition (and
        (estamos_dia ?hoy)
        (ejercicio_precedible ?ej)
        (ejercicio_precursor ?ej ?precursor)
        (ejercicio_anterior ?precursor)
        (not (ejercicio_precedido ?ej))
      )
      :effect (ejercicio_precedido ?ej)
    )

  (:action preparar_Ejercicio
    :parameters (?ej - ejercicio ?hoy - dia)
    :precondition (and
      (estamos_dia ?hoy)
      (ejercicio_preparable ?ej)
      (not (ejercicio_preparado ?ej ?hoy))
      (forall (?preparador - ejercicio) (or
          (not (ejercicio_preparador ?ej ?preparador))
          (hecho_ejercicio ?preparador ?hoy)
        )
      )
    )
    :effect (ejercicio_preparado ?ej ?hoy)
  )
)
