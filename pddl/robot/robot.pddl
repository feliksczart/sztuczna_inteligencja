(define
    (domain robot)
    (:requirements :adl)
    (:types pokoj chwytak rzecz)
    (:predicates
        (wolny ?x - chwytak)
        (zajety ?x - chwytak)
        (poziomo ?x ?y - pokoj)
        (pionowo ?x ?y - pokoj)
        (robot ?x - pokoj)
        (w ?x - pokoj ?y - rzecz)
        (trzymany ?x - rzecz)
        (lezy ?x - rzecz)
    )
    (:action pojedz
        :parameters (?skad - pokoj ?dokad - pokoj)
        :precondition
        (or
            (and
                (robot ?skad)
                (poziomo ?skad ?dokad)
                (not(= ?skad ?dokad))
            )
            (and
                (robot ?skad)
                (pionowo ?skad ?dokad)
                (not(= ?skad ?dokad))
            )
        )
        :effect
        (and
            (robot ?dokad)
            (not(robot ?skad))
        )
    )
    (:action chwyc
        :parameters (?czym - chwytak ?co - rzecz ?skad - pokoj)
        :precondition
            (and
                (w ?skad ?co)
                (robot ?skad)
                (wolny ?czym)
                (lezy ?co)
            )
        :effect 
            (and
                (zajety ?czym)
                (not(wolny ?czym))
                (robot ?skad)
                (trzymany ?co)
                (w ?skad ?co)
                (not(lezy ?co))
            )
    )
    (:action przenies
        :parameters (?co - rzecz ?skad ?dokad - pokoj)
        :precondition 
            (or
                (and 
                    (trzymany ?co)
                    (robot ?skad)
                    (w ?skad ?co)
                    (poziomo ?skad ?dokad)
                    (not(= ?skad ?dokad))
                    (not(lezy ?co))
                )
                (and 
                    (trzymany ?co)
                    (robot ?skad)
                    (w ?skad ?co)
                    (pionowo ?skad ?dokad)
                    (not(= ?skad ?dokad))
                    (not(lezy ?co))
                )
            )
        :effect 
            (and
                (trzymany ?co)
                (robot ?dokad)
                (not(robot ?skad))
                (w ?dokad ?co)
                (not(w ?skad ?co))
                (not(lezy ?co))
            )
    )
    (:action pusc
        :parameters (?czym - chwytak ?co - rzecz ?gdzie - pokoj)
        :precondition
            (and
                (w ?gdzie ?co)
                (robot ?gdzie)
                (trzymany ?co)
                (zajety ?czym)
                (not(lezy ?co))
            )
        :effect 
            (and
                (not(zajety ?czym))
                (wolny ?czym)
                (robot ?gdzie)
                (not(trzymany ?co))
                (w ?gdzie ?co)
                (lezy ?co)
            )
    )
)