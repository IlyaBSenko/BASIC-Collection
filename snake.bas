RANDOMIZE TIMER

SCREEN 0
_TITLE "Snake"

CONST W = 80
CONST H = 25
CONST MAXLEN = 200

DIM sx(1 TO MAXLEN) AS INTEGER
DIM sy(1 TO MAXLEN) AS INTEGER
DIM length AS INTEGER

DIM fx AS INTEGER
DIM fy AS INTEGER

DIM dx AS INTEGER
DIM dy AS INTEGER
DIM k AS STRING
DIM i AS INTEGER

length = 1

sx(1) = W \ 2
sy(1) = H \ 2

fx = INT(RND * W) + 1 REM Initial food positions
fy = INT(RND * H) + 1

dx = 0 REM Starting movement
dy = 0

DO
    k = INKEY$

    IF LCASE$(k) = "w" AND dy <> 1 THEN
        dx = 0
        dy = -1
    ELSEIF LCASE$(k) = "s" AND dy <> -1 THEN
        dx = 0
        dy = 1
    ELSEIF LCASE$(k) = "a" AND dx <> 1 THEN
        dx = -1
        dy = 0
    ELSEIF LCASE$(k) = "d" AND dx <> -1 THEN
        dx = 1
        dy = 0
    END IF

    FOR i = length TO 2 STEP -1 REM shift the body
        sx(i) = sx(i - 1)
        sy(i) = sy(i - 1)
    NEXT i

    sx(1) = sx(1) + dx REM Move the head
    sy(1) = sy(1) + dy

    IF sx(1) < 1 OR sx(1) > W OR sy(1) < 1 OR sy(1) > H THEN
        CLS
        LOCATE 12, 36
        PRINT "GAME OVER"
        SLEEP
        END
    END IF

    IF sx(1) = fx AND sy(1) = fy THEN
        IF length < MAXLEN THEN
            sx(length + 1) = sx(length)
            sy(length + 1) = sy(length)
            length = length + 1
        END IF
        fx = INT(RND * W) + 1 REM replace food
        fy = INT(RND * H) + 1
    END IF

    CLS

    LOCATE fy, fx
    PRINT "*";

    FOR i = 1 TO length
        LOCATE sy(i), sx(i)
        IF i = 1 THEN
            PRINT "O";
        ELSE
            PRINT "o";
        END IF
    NEXT i


    _LIMIT 10
LOOP
