(define (problem na-ziemie)
    (:domain blocks)
    (:objects a b c d e)
    (:init
    ;(na a b) oznacza ze a jest na b
            (na_ziemi a)
            (na_ziemi d)

            (wolny c)
            (wolny e)

            (na c b)
            (na b a)
            (na e d)
    )
    (:goal
        (and
            (na_ziemi c)
            (wolny c)
            (na_ziemi b)
            (wolny b)
            (na_ziemi a)
            (wolny a)
            (na_ziemi e)
            (wolny e)
            (na_ziemi d)
            (wolny d)
        )
    )
)