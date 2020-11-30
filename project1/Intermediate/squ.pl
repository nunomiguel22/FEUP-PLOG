
/*pieces symbols*/
symbol(empty,S):-S='.'.
symbol(black,S):-S='b'.
symbol(red,S):-S='r'.
symbol(blackP,S):-S='B'.
symbol(redP,S):-S='R'.

/* Letters for table rows*/
letter(1, L) :- L='A'.
letter(2, L) :- L='B'.
letter(3, L) :- L='C'.
letter(4, L) :- L='D'.
letter(5, L) :- L='E'.
letter(6, L) :- L='F'.
letter(7, L) :- L='G'.
letter(8, L) :- L='H'.
letter(9, L) :- L='I'.
letter(10, L) :- L='J'.

/* Initial empty board */
initial([
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
    [empty,empty,empty,empty,empty,empty,empty,empty,empty,empty]
    ]).

/* Board for demonstration */
midBoard([
    [empty,red,black,empty,empty,empty,empty,empty,red,black],
    [black,empty,black,red,empty,empty,empty,black,empty,empty],
    [empty,black,empty,empty,empty,empty,empty,red,empty,empty],
    [empty,redP,empty,empty,empty,redP,red,empty,empty,red],
    [empty,empty,red,empty,empty,empty,empty,black,empty,empty],
    [empty,empty,empty,empty,red,empty,empty,empty,empty,empty],
    [empty,empty,blackP,black,empty,blackP,empty,red,black,empty],
    [empty,redP,empty,empty,empty,redP,empty,empty,empty,red],
    [red,black,empty,empty,empty,empty,red,black,empty,empty],
    [empty,empty,blackP,empty,empty,blackP,empty,black,red,empty]
    ]).

/* Board for demonstration */
finalBoard([
    [redP,red,black,empty,empty,empty,empty,empty,redP,black],
    [blackP,empty,black,red,empty,empty,blackP,black,empty,empty],
    [red,black,black,black,empty,empty,red,red,empty,empty],
    [empty,red,empty,empty,empty,red,red,empty,empty,red],
    [empty,empty,red,black,empty,empty,empty,black,empty,empty],
    [empty,empty,empty,empty,red,empty,empty,empty,empty,empty],
    [empty,empty,black,black,empty,black,empty,red,black,empty],
    [blackP,red,empty,empty,empty,red,blackP,empty,black,red],
    [redP,black,empty,black,empty,empty,red,black,redP,empty],
    [red,empty,black,empty,empty,black,empty,black,red,red]
    ]).

/* Starts a game in the initial state */
play:-
    initial(Board),
    display_game(Board, 'red').

/* Displays the current game state */
display_game(Board, Player):-
nl,
write(Player),
write(' is playing'),
nl,
print_board(Board).


/* Example of a board mid game */
display_midBoard(Player):-
    midBoard(Board),
    display_game(Board, Player).

/* Example of a board with game over */
display_finalBoard(Player):-
    finalBoard(Board),
    display_game(Board, Player).

/* Prints a game board */
print_board(X):-
nl,
write('   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10|'), nl,
write('---|---|---|---|---|---|---|---|---|---|---|'), nl,
printMatrix(X, 1).


printMatrix([Head|Tail], N) :-
    letter(N, L),
    write(' '),
    write(L),
    N1 is N + 1,
    write(' | '),
    printLine(Head),
    write('\n---|---|---|---|---|---|---|---|---|---|---|\n'),
    printMatrix(Tail, N1).

printLine([]).

printLine([Head|Tail]):-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).


