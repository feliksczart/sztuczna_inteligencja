(define (problem zaliczeniep)
    (:domain zaliczenie)
    (:objects A B C D E F G H I J - pole 
              w1 w2 w3 - worek
              becz - beczka
    )
    (:init
        (poziomo A B)
        (poziomo B D)
        (poziomo D F)
        (poziomo F H)
        (poziomo H J)
        (poziomo G I)
        (poziomo B A)
        (poziomo D B)
        (poziomo F D)
        (poziomo H F)
        (poziomo J H)
        (poziomo I G)

        (pionowo C D)
        (pionowo D E)
        (pionowo D C)
        (pionowo E D)
        (pionowo G H)
        (pionowo H G)
        (pionowo I J)
        (pionowo J I)

        (pozycja w1 G)
        (pozycja w2 H)
        (pozycja w3 J)
        (pozycja_beczka becz I)

        (gorbag A)
    )
    (:goal
        (and
            (pozycja_beczka becz A)
        )
    )
)

;Interpretacja pól:
;     C   G I
; A B D F H J
;     E