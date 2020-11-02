(define
    (domain merry)
    (:requirements :adl)
    (:types kulka klocek pokoj kolor pole)
    ;(:constants x y z - palik)
    (:predicates
        (poziomo ?x ?y - pokoj ?z - kolor)
        (pionowo ?x ?y - pokoj ?z - kolor)
        (w ?x - pokoj ?y - kulka ?z - kolor)
        (wbk ?x - pokoj ?y - kulka)
        (ma ?x - kolor ?y - kulka)
        (czlowiek ?x - pokoj)
        (na ?x - pole ?y - klocek)
        (sasiad ?x ?y - pole)
    )
    (:action wez
        :parameters (?kolor - kolor ?kulka - kulka ?skad - pokoj)
        :precondition
        (and
            (w ?skad ?kulka ?kolor)
            (czlowiek ?skad)
            (wbk ?skad ?kulka)
        )
        :effect
        (and
            (ma ?kolor ?kulka)
            (not(w ?skad ?kulka ?kolor))
            (not(wbk ?skad ?kulka))
        )
    )
    (:action idz
        :parameters (?dokad ?skad - pokoj ?kolor - kolor ?kulka - kulka)
        :precondition
        (or
            (and
                (not(= ?dokad ?skad))
                (czlowiek ?skad)
                (poziomo ?skad ?dokad ?kolor)
                (ma ?kolor ?kulka)
                (not (exists (?x - kulka) (wbk ?skad ?x)))
            )
            (and
                (not(= ?dokad ?skad))
                (czlowiek ?skad)
                (pionowo ?skad ?dokad ?kolor)
                (ma ?kolor ?kulka)
                (not (exists (?x - kulka) (wbk ?skad ?x)))
            )
        )    
        :effect
        (and
            (not(czlowiek ?skad))
            (czlowiek ?dokad)
            (not(ma ?kolor ?kulka))
        )
    )
    (:action przesun
        :parameters (?co - klocek ?skad ?dokad - pole)
        :precondition
        (and
            (czlowiek a)
            (na ?skad ?co)
            (not(exists(?x - klocek)(na ?dokad ?x)))
            (sasiad ?skad ?dokad)
        )
        :effect
        (and
            (not(na ?skad ?co))
            (na ?dokad ?co)
        )
    )
)