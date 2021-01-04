:- use_module(library(clpfd)).

clear :- write('\33\[2J').   

countNonZero([], 0).
countNonZero([H|T], Count) :-
    countNonZero(T, TempCount),
    Count #= TempCount + (H #> 0).

countOdd([], 0).
countOdd([H|T], Count) :-
    countOdd(T, TempCount),
    Count #= TempCount + (H mod 2).


createList(0, _):-!.
createList(N, List):-
    N1 is N - 1,
    createList(N1, TempList),
    append(TempList,[_], List). 

writeClasses([], _).
writeClasses([H|T], N):-
    N1 is N + 1,
    write('Class :'), write(N), nl,
    write(H), nl, writeClasses(T, N1).

