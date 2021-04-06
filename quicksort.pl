append([], A, A).
append([H|T], A, [H|R]) :-
    append(T, A, R).

partition([H|T],Pivot,[H|LessThan],GreaterThan) :- H=<Pivot,
    partition(T,Pivot,LessThan,GreaterThan).
partition([H|T],Pivot,LessThan,[H|GreaterThan]) :- H > Pivot,
    partition(T,Pivot,LessThan,GreaterThan).
partition([],_,[],[]).

quicksort([],[]).
quicksort([H|T],Out) :- quicksortDiff([H|T],Out-[]).

quicksortDiff([],L-L).
quicksortDiff([H|T],S-E) :- partition(T,H,Left,Right),
    quicksortDiff(Left,S-[H|L]),
    quicksortDiff(Right,L-E).
