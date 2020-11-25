cls :- write('\33\[2J').   

replace_list_element([_H|T], 0, Value, [Value|T]).
replace_list_element([H|T], Index, Value, [H|NewT]) :-
        Index > 0,
        IndexN is Index - 1,
        replace_list_element(T, IndexN, Value, NewT).


replace_matrix_element([H|T], 0, Column,Value, [NewH|T]) :-
    replace_list_element(H, Column, Value, NewH).

replace_matrix_element([H|T], Row, Column, Value, [H|NewT]) :-
        Row > 0,
        RowN is Row - 1,
        replace_matrix_element(T, RowN, Column, Value, NewT).


get_list_element([H|_T], 0, Value) :-
        Value = H.
get_list_element([_H|T], Index, Value) :-
    Index > 0,
    IndexN is Index - 1,
    get_list_element(T, IndexN, Value).

get_matrix_element([H|_T], 0, Column, Value) :-
        get_list_element(H, Column, Value).

get_matrix_element([_H|T], Row, Column, Value) :-
        Row > 0,
        RowN is Row - 1,
        get_matrix_element(T, RowN, Column, Value).

char_index('A',0).
char_index('B',1).
char_index('C',2).
char_index('D',3).
char_index('E',4).
char_index('F',5).
char_index('G',6).
char_index('H',7).
char_index('I',8).
char_index('J',9).
