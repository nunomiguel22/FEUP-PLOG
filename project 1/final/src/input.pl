main_menu_get_option :-
    write('select menu option: '),
    read(Input),
    menu_input(Input).

read_row(Row) :-
    write('Row    '),
    read(InputRow),
    (char_index(InputRow, R) ->
        Row = R;
        write('Invalid row input(InputRow)\n'),
        read_row(Row)
    ).

read_column(Column) :-
    write('Column '),
    read(Input),
    (between(Input, 1, 10) ->
    Column is Input - 1;
    (write('Invalid column input\n'),
    read_column(Column))).
