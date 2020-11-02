(define
    (domain hanoi)
    (:requirements :adl)
    (:types krazek palik)
    (:constants x y z - palik)
    (:predicates
        (mniejszy ?x ?y - krazek)
        (na ?x - palik ?y - krazek)
    )
    (:action przesun
        :parameters (?skad ?dokad - palik ?co - krazek)
        :precondition
        (and
            (not (= ?skad ?dokad))
            (na ?skad ?co)
            (not (exists (?x - krazek) (and (mniejszy ?x ?co) (na ?skad ?x))))
            (not (exists (?x - krazek) (and (mniejszy ?x ?co) (na ?dokad ?x))))
        )
        :effect
        (and
            (not (na ?skad ?co))
            (na ?dokad ?co)
        )
    )
)