
start_game('P', 'P') :-
    initial(Board),
    display_game(Board, 'red'), nl,
    turn(Board, 'red', NewBoard),
    display_game(NewBoard, 'black'), nl,
    playingPVP(NewBoard, 'red', 'black', 0, 0).
    

playingPVP(Board, P1, P2, P1Dist, P2Dist) :-
    %Each player places two discs per turn
    turn(Board, P2, NewBoard),
    check_board_squ(NewBoard, P2, 0, P2Dist, NewDist, NewBoard2),
    display_game(NewBoard2, P2), nl,

    turn(NewBoard2, P2, NewBoard3),
    check_board_squ(NewBoard3, P2, 0, NewDist, NewDist2, NewBoard4),
    display_game(NewBoard4, P1), nl, 

    turn(NewBoard4, P1, NewBoard5),
    check_board_squ(NewBoard5, P1, 0, P1Dist, NewDist3, NewBoard6),
    display_game(NewBoard6, P1), nl,


    turn(NewBoard6, P1, NewBoard7),
    check_board_squ(NewBoard7, P1, 0, NewDist3, NewDist4, NewBoard8),
    display_game(NewBoard8, P2), nl,

    playingPVP(NewBoard8, P1, P2, NewDist4, NewDist2).

turn(Board, Player, NewBoard) :-
    write('Choose cell\n'),
    read_row(Row),
    read_column(Col),
    move(Board, Player, Row, Col, NewBoard).

move(Board, Player, Row, Column, NewBoard) :-
    replace_matrix_element(Board, Row, Column, Player, NewBoard).


check_board_squ(Board, _, Dist, 9, NewDist, NewBoard) :-
    NewDist = Dist,
    NewBoard = Board.

check_board_squ(Board, Player, Dist, Index, NewDist, NewBoard):-
    Index < 9,
    IndexN is Index + 1, 
    check_row(Board, Player, 0, 1, Index, Dist, NDist, NBoard),
    check_board_squ(NBoard, Player, NDist, IndexN, NewDist, NewBoard).

    

check_row(Board, Player, P1x, P2x, Y, Dist, NewDist, NewBoard) :-
    %write('P1x = '), write(P1x), nl,
    %write('P2x = '), write(P2x), nl,
    %write('Dist = '), write(Dist), nl, nl,
    (P1x < 9 ->
        (P2x == 9 ->
            P1xN is P1x + 1,
            P2xN is P1xN + 1;
            P1xN is P1x,
            P2xN is P2x + 1
        ),
        (check_squ(Board, Player, P1x, P2x, Y, Dist, NDist, NBoard) ->
            check_row(NBoard, Player, P1xN, P2xN, Y, NDist, NewDist, NewBoard);
            check_row(Board, Player, P1xN, P2xN, Y, Dist, NewDist, NewBoard)
        );
        NewDist = Dist,
        NewBoard = Board
    ).
    

check_squ(Board, Player, P1x, P2x, Y, Dist, NewDist, NewBoard) :-
    NewDist is P2x - P1x,
    NewDist > Dist,
    generate_square_points(P1x, P2x, Y, NewDist, P1, P2, P3, P4),
    is_piece_type(Board, Player, P1),
    is_piece_type(Board, Player, P2),
    is_piece_type(Board, Player, P3),
    is_piece_type(Board, Player, P4),
    remove_pyramids(Board, Player, NBoard),
    set_pyramids(NBoard, Player, P1, P2, P3, P4, NewBoard).


remove_pyramids(Board, Player, NewBoard) :-
    remove_pyramids(Board, Player, 0, 0, NewBoard).

remove_pyramids(Board, _, 9, 9, NewBoard) :-
    NewBoard = Board.

remove_pyramids(Board, Player, 9, Y, NewBoard) :-
    Yn is Y + 1,
    remove_pyramids(Board, Player, 0, Yn, NewBoard).

remove_pyramids(Board, Player, X, Y, NewBoard) :-
    X < 9,
    Xn is X + 1,
    get_matrix_element(Board, X, Y, Value),
    (is_pyramid(Player, Value) ->
        replace_matrix_element(Board, X, Y, Player, NBoard),
        remove_pyramids(NBoard, Player, Xn, Y, NewBoard);
        remove_pyramids(Board, Player, Xn, Y, NewBoard)
    ).
    
set_pyramids(Board, Player, P1, P2, P3, P4, NewBoard) :-
    set_pyramid(Board, Player, P1, NBoard),
    set_pyramid(NBoard, Player, P2, NBoard2),
    set_pyramid(NBoard2, Player, P3, NBoard3),
    set_pyramid(NBoard3, Player, P4, NewBoard).

set_pyramid(Board, Player, [P1x, P1y], NewBoard) :-
    atom_concat(Player, 'P', PlayerP),
    replace_matrix_element(Board, P1y, P1x, PlayerP, NewBoard).

generate_square_points(P1x, P2x, Y, Dist, P1, P2, P3, P4) :-
    P1 = [P1x, Y],
    P2 = [P2x, Y],
    P3y is  Y + Dist,
    P3 = [P2x, P3y],
    P4 = [P1x, P3y].

is_piece_type(Board, Player, [X, Y]) :-
    get_matrix_element(Board, Y, X, Value),
    (Value == Player;
    is_pyramid(Player, Value)).

is_pyramid(Player, Value) :-
    atom_concat(Player, 'P', PlayerP),
    Value == PlayerP.
