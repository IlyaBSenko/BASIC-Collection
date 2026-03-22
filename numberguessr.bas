RANDOMIZE TIMER

DIM rando_num AS INTEGER
DIM user_num AS INTEGER
DIM guess_counter AS INTEGER

rando_num = INT(RND * 100) + 1

PRINT "I AM THINKING OF A NUMBER 1 - 100"

DO
    INPUT "TRY TO GUESS IT", user_num
    guess_counter = guess_counter + 1

    IF user_num < rando_num THEN
        PRINT "TOO LOW"
    ELSEIF user_num > rando_num THEN
        PRINT "TOO HIGH"
    ELSE
        PRINT "CORRECT!"; guess_counter "GUESSES"
    END IF
LOOP

