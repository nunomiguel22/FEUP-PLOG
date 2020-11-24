:- use_module(library(system)).
:- consult('menus.pl').
:- consult('display.pl').
:- consult('logic.pl').
:- consult('utils.pl').

squ :-
    main_menu.
