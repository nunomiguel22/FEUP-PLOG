animal('Tweety', passaro).
animal('Goldie', peixe).
animal('Molie', minhoca).
animal('Eu', pessoa).
animal('Silvester', gato).

likes(passaro, minhoca).
likes(gato, passaro).

amigo(X, Y):- likes(X, Y), likes(Y, X).
likes('Eu', 'Silvester').
likes('Silvester', 'Eu').

animallikes(X, Y):- animal(X, Z), likes(Z,Y);likes(X, Y).

animaleats(X, Y):- animal(X, Z), likes(Z,Y);likes(X, Y), amigo(X, Y) == false.
