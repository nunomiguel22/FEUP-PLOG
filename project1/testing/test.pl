:- use_module(library(lists)).

test :-
    L = [[1,5,7,2,1],
    [1,2,3,2,1]],
    nth0(0, L, NewL),
    write(NewL).


