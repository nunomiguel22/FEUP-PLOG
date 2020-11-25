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

/* Displays the current game state */
display_game(Board, Player):-
    cls,
    nl,
    write(Player),
    write(' is playing'),
    nl,
    print_board(Board).

/* Prints a game board */
print_board(X):-
    nl,
    write('   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10|'), nl,
    write('---|---|---|---|---|---|---|---|---|---|---|'), nl,
    printMatrix(X, 1).

printMatrix([], 11).

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


