
start_game('P', 'P') :-
    initial(Board),
    display_game(Board, 'red'), nl,
    turn(Board, P1, Newboard),
    display_game(Newboard, 'red'), nl,
    playing(Newboard, 'red', 'black').
    

playing(Board, P1, P2) :-
    %Each player places two discs per turn
    
    turn(Board, P2, Newboard).
   /*  turn(Newboard, P2, Board),
    display_game(Board, P2), nl.
    update_game_state(Board, P1, Newboard),
    turn(Newboard, P1, Board),
    turn(Board, P1, Newboard),
    update_game_state(Newboard, P1, Board),
    playing(Board, P1, P2). */

turn(Board, Player, NewBoard) :-
    write('Choose cell\n'),
    read_row(Row),
    read_column(Col),
    move(Board, Player, Row, Col, NewBoard).

move(Board, 'red', Row, Column, NewBoard) :-
    replace_matrix_element(Board, Row, Column, 'red', NewBoard).

move(Board, 'black', Row, Column, NewBoard) :-
    replace_matrix_element(Board, Row, Column, 'black', NewBoard).

read_row(Row) :-
    write('Row    '),
    read(InputRow),
    char_index(InputRow, Row).

read_column(Column) :-
    write('Column '),
    read(Col),
    Column is Col - 1. 
