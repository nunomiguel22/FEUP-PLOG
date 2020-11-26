:- use_module(library(system)).
:- consult('menus.pl').
:- consult('display.pl').
:- consult('logic.pl').
:- consult('utils.pl').
:- consult('input.pl').

squ :-
    main_menu.
