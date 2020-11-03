(define
    (domain zaliczenie)
    (:requirements :adl)
    (:types pole worek beczka)
    (:predicates
        (poziomo?x ?y - pole)
        (pionowo?x ?y - pole)
        (gorbag ?x - pole)
        (pozycja ?x - worek ?y - pole)
        (pozycja_beczka ?x - beczka ?y - pole)
    )
    (:action idz
        :parameters (?skad ?dokad - pole)
        :precondition
        (or
            (and
                (not(= ?dokad ?skad))
                (gorbag ?skad)
                (poziomo ?skad ?dokad)
            )
            (and
                (not(= ?dokad ?skad))
                (gorbag ?skad)
                (pionowo ?skad ?dokad)
            )
        )    
        :effect
        (and
            (not(gorbag ?skad))
            (gorbag ?dokad)
        )
    )
    (:action ciagnij
        :parameters (?co - worek ?skad ?dokad - pole)
        :precondition
        (or
            (and
                (gorbag ?skad)
                (pozycja ?co ?skad)
                (poziomo ?skad ?dokad)
                (not(= ?dokad ?skad))
                (not(exists (?x - worek)(pozycja ?x ?dokad)))
                (not(exists (?y - beczka)(pozycja_beczka ?y ?dokad)))
            )
            (and
                (gorbag ?skad)
                (pozycja ?co ?skad)
                (pionowo ?skad ?dokad)
                (not(= ?dokad ?skad))
                (not(exists (?x - worek)(pozycja ?x ?dokad)))
                (not(exists (?y - beczka)(pozycja_beczka ?y ?dokad)))
            )
        )
        :effect
        (and
            (not(pozycja ?co ?skad))
            (pozycja ?co ?dokad)
            (not(gorbag ?skad))
            (gorbag ?dokad)
        )
    )
    (:action tocz
        :parameters (?co - beczka ?skad ?dokad - pole)
        :precondition
        (or
            (and
                (gorbag ?skad)
                (pozycja_beczka ?co ?skad)
                (poziomo ?skad ?dokad)
                (not(= ?dokad ?skad))
                (not(exists (?x - worek)(pozycja ?x ?dokad)))
                (not(exists (?y - beczka)(pozycja_beczka ?y ?dokad)))
            )
            (and
                (gorbag ?skad)
                (pozycja_beczka ?co ?skad)
                (pionowo ?skad ?dokad)
                (not(= ?dokad ?skad))
                (not(exists (?x - worek)(pozycja ?x ?dokad)))
                (not(exists (?y - beczka)(pozycja_beczka ?y ?dokad)))
            )
        )
        :effect
        (and
            (not(pozycja_beczka ?co ?skad))
            (pozycja_beczka ?co ?dokad)
            (not(gorbag ?skad))
            (gorbag ?dokad)
        )
    )
)