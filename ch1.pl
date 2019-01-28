% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here


/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
*/


% binary facts
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).


% unary facts
male(tom).
male(bob).
male(jim).
female(liz).
female(pat).
female(ann).
female(pam).

% clauses
offspring(Y, X) :- parent(X, Y).

% X is mother of Y IF X is parent of Y and X is a male
mother(X, Y) :- parent(X, Y), female(X).

% X is grandparent of Z IF X is parent of Y and Y is parent of Z
grandparent(X, Z) :- 
    parent(X, Y), 
    parent(Y, Z).

% X is sister of Y IF Z is parent of both and X is a female
sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X).

predecessor(X, Z) :-
    parent(X, Z).

predecessor(X, Z) :-
    parent(X, Y),
    predecessor(Y, Z).

