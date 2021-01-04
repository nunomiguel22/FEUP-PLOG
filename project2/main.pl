:- use_module(library(lists)).
:- use_module(library(clpfd)).

:- include('simple.pl').
:- include('utils.pl').


init :-
    defineUCList(UCList),
    nl, nl, write('SOLVING'), nl, nl,
    solveUCs(UCList),
    write('DONE'), nl, nl.
    

solveUCs([]).
solveUCs([UC-NumberOfClasses|T]) :-
    solveUCs(T),
    solveUC(NumberOfClasses, UC).

defineUCList(List):-
    findall(UC-NumberOfClasses, uc(UC, NumberOfClasses), List).

solveUC(NumberOfClasses, UC) :-
    getStudentNumberFDSet(UC, StudentNumbers),
    defineClassList(NumberOfClasses, List, LabelList),

    %Set class domain to the student numbers
    retrictClasses(LabelList, StudentNumbers),

    %All students must be assigned restriction
    restrictStudents(StudentNumbers, LabelList),
    
    %A student cannot be assigned to a class twice
    all_different_except_0(LabelList),

    %Evaluate solution and calculate heuristic
    evaluation(List, N),

    labeling([minimize(N), time_out(5000, _)], LabelList),
    write('/-------------------UC '), write(UC), write('-------------------/'), nl,
    writeClasses(List, 1), nl, nl.
    

evaluation([], 0).
evaluation([H|T], N):-
    evaluation(T, TempN),

    % 1 - Balance students per class
    countNonZero(H, Count),
    ClassDistribution #= TempN + abs(Count - 2),

    % 2 - Balance odd and even students per class
    countOdd(H, OddCount),
    EvenCount #= Count - OddCount,
    ParityDiff #= abs(OddCount - EvenCount),

    % Final value
    N #= ClassDistribution + ParityDiff.




getStudentNumberFDSet(UC, FDSet) :-
    findall(StudentNumber, student(StudentNumber, UC), CList),
    append(CList, [0], FList),
    list_to_fdset(FList, FDSet).

restrictStudents(StudentNumbers, LabelList) :-
    length(StudentNumbers, NStudents),
    countNonZero(LabelList, Count),
    Count #= NStudents.


retrictClasses([], _).
retrictClasses([H|T], StudentNumbers) :-
    retrictClasses(T, StudentNumbers),
    H in_set StudentNumbers.


defineClassList(0, _, _).
defineClassList(ClassCount, List, LabelList) :-
    ClassCount > 0,
    NClassCount is ClassCount - 1,
    defineClassList(NClassCount, TempList, TempLabelList),
    max_class_size(ClassSize),
    createList(ClassSize, CList),
    append(TempList, [CList], List),
    append(TempLabelList, CList, LabelList).
