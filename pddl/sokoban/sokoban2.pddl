(define 
    (domain sokoban2)
    (:requirements :adl)
    (:predicates
        (paczka ?x)
        (cel ?x)
        (robot ?x)
        (poziomo ?x ?y)
        (pionowo ?x ?y)
    )
    ;przesun robota
    (:action idz
        :parameters (?x ?y)
        :precondition 
        (or
            (and
                (robot ?x)
                (pionowo ?x ?y)
                (not(= ?x ?y))
                (not(paczka ?y))
            )
            (and
                (robot ?x)
                (poziomo ?x ?y)
                (not(= ?x ?y))
                (not(paczka ?y))
            )
        )
        :effect 
        (and
            (robot ?y)
            (not(robot ?x))
        )
    )
    (:action pchaj
        :parameters(?x ?y ?z)
        :precondition 
        (or 
            (and
                (pionowo ?x ?y)
                (pionowo ?y ?z)
                (robot ?x)
                (paczka ?y)
                (not(= ?x ?y))
                (not(= ?y ?z))
                (not(= ?x ?z))
            )
            (and
                (poziomo ?x ?y)
                (poziomo ?y ?z)
                (robot ?x)
                (paczka ?y)
                (not(= ?x ?y))
                (not(= ?y ?z))
                (not(= ?x ?z))
            )
        )
        :effect 
        (and
            (robot ?y)
            (paczka ?z)
            (not(robot ?x))
            (not(paczka ?y))
        )
    )
)
