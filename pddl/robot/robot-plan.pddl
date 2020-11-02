(define (problem robotp)
    (:domain robot)
    (:objects a b c d e f g - pokoj
              ch - chwytak
              p - rzecz
              s - rzecz
    )
    (:init
        (robot a)
        (wolny ch)
        (w e p)
        (w g s)
        (lezy p)
        (lezy s)

        (poziomo a b)
        (poziomo b a)
        (poziomo b c)
        (poziomo c b)
        (poziomo c d)
        (poziomo d c)

        (pionowo b e)
        (pionowo e b)
        (pionowo d f)
        (pionowo f d)
        (pionowo f g)
        (pionowo g f)
    )
    (:goal
        (and
            (w c p)
            (lezy p)
            (w b s)
            (lezy s)
        )
    )

)