(define (problem paczek5)
    (:domain blocks)
    (:objects a b c d e)
    (:init
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
            (na_ziemi a)

            (wolny e)
            (wolny d)

            (na e c)
            (na d b)
            (na b a)
        )
    )
)