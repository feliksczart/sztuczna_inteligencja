(define
    (domain blocks)
    (:requirements :adl)
    (:predicates
        (wolny ?x)
        (na ?x ?y)
        (na_ziemi ?x)
        (trzymany ?x)
    )
    (:action podnies-z-podlogi
        :parameters (?co)
        :precondition
        (and
            (wolny ?co)
            (na_ziemi ?co)
            (not (exists (?y) (trzymany ?y)))
        )
        :effect
        (and
            (not (wolny ?co))
            (not (na_ziemi ?co))
            (trzymany ?co)
        )
    )
    (:action podnies-z-paczki
        :parameters (?co ?skad)
        :precondition
        (and
            (wolny ?co)
            (na ?co ?skad)
            (not (exists (?y) (trzymany ?y)))
        )
        :effect
        (and
            (not (wolny ?co))
            (not (na ?co ?skad))
            (trzymany ?co)
            (wolny ?skad)
        )
    )
    (:action opusc-na-paczke
        :parameters (?dokad ?co)
        :precondition
        (and
            (wolny ?dokad)
            (trzymany ?co)
        )
        :effect
        (and
            (not (wolny ?dokad))
            (na ?co ?dokad)
            (not (trzymany ?co))
            (wolny ?co)
        )
    )
    (:action opusc-na-podloge
        :parameters (?co)
        :precondition
        (and
            (trzymany ?co)
        )
        :effect
        (and
            (not (trzymany ?co))
            (wolny ?co)
            (na_ziemi ?co)
        )
    )
)