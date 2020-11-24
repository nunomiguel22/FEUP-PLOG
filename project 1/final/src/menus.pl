
main_menu :-
    print_main_menu,
    main_menu_get_option.

menu_input(1) :-
    start_game('P', 'P').

menu_input(2) :-
    write('option 2\n').

menu_input(3) :-
    write('option 3\n').

menu_input(0) :-
    write('done\n').

menu_input(other) :-
    write('\n error: Invalid option \n'),
    main_menu_get_option.

main_menu_get_option :-
    write('select menu option: '),
    read(Input),
    menu_input(Input).


print_main_menu :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                                 SQU                                   |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                           Nuno Miguel Marques                         |'),nl,
    write('|                             Margarida cosme                           |'),nl,
    write('|                                                                       |'),nl,
    write('|                               Main Menu                               |'),nl,
    write('|                                                                       |'),nl,
    write('|                          1 - Player vs Player                         |'),nl,
    write('|                                                                       |'),nl,
    write('|                          2 - Player vs Computer                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                          3 - Computer vs Computer                     |'),nl,
    write('|                                                                       |'),nl,
    write('|                          0 - Exit                                     |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write(' _______________________________________________________________________ '),nl,
    nl,nl.


