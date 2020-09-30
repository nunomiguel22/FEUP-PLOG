pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

team('Lamb', 'Breitling').
team('Besenyei', 'Red Bull').
team('Chambliss', 'Red Bull').
team('MacLean', 'Mediterranean Racing Team').
team('Mangold', 'Cobra').
team('Jones', 'Matador').
team('Bonhomme', 'Matador').

plane('Lamb', 'MX2').
plane('Besenyei', 'Edge540').
plane('Chambliss', 'Edge540').
plane('MacLean', 'Edge540').
plane('Mangold', 'Edge540').
plane('Jones', 'Edge540').
plane('Bonhomme', 'Edge540').

circuit('Porto').
circuit('Instanbul').
circuit('Budapest').

won('Porto', 'Jones').
won('Instanbul', 'Mangold').
won('Budapest', 'Mangold').

gates('Porto', 5).
gates('Instanbul', 9).
gates('Budapest', 6).

teamwon(X, Y):- won(X, Z), team(Z, Y).
