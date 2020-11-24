
start_game(P1, P2) :-
    initial(Board),
    playing(Board, P1, P2).

playing(Board, P1, P2) :-
    write(P1),
    write(P2),
    display_game(Board, 'red').

