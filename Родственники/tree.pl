isMale(X):-
	father(_,X).
isFemale(julia).
isFemale(olya).
isFemale(X):-
	mother(_,X).
isMaleAndFemale(X,Y):-
	isFemale(X),
	isMale(Y).
isMaleAndFemale(X,Y):-
	isFemale(Y),
	isMale(X).

parent(X,Y):-
	father(X,Y).
parent(X,Y):-
	mother(X,Y).

pred(X,Y):-
	parent(X,Y),
	X\=Y.
pred(X,Y):-
	parent(X,Z),
	pred(Z,Y),
	X\=Y.

bc(X,Y):-
	parent(X,A),
	parent(Y,A),
	parent(X,B),
	parent(Y,B),
	A\=B,
	X\=Y. 

/*add(E,[],[E]).
add(E,[H|T],[H|T1]):-
	add(E,T,T1).

relationWay(X,Y,L1,L2):-
	parent(X,Y),
	%add(Mom,L1,L2). 
	M=[mama],
	append(L1,M,L2).

relationWay(X,Y,L1,L2):-
	pred(X,Y),
	M=[mama],
	append(L1,M,L2),
	parent(X,A),
	relationWay(A,Y,L2,L3).
*/

relWay(X,Y):-
	pred(X,Y),
	father(X,Y),
	write(father).
relWay(X,Y):-
	pred(X,Y),
	mother(X,Y),
	write(mother).
relWay(X,Y):-
	pred(X,Y),
	parent(X,A),
	relWay(X,A),
	relWay(A,Y).
	
