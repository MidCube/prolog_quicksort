append([], A, A).
append([H|T], A, [H|R]) :-
    append(T, A, R).

partition([H|T],Pivot,[H|LessThan],EqualTo,GreaterThan) :- H<Pivot,
    partition(T,Pivot,LessThan,EqualTo,GreaterThan).
partition([H|T],Pivot,LessThan,EqualTo,[H|GreaterThan]) :- H > Pivot,
    partition(T,Pivot,LessThan,EqualTo,GreaterThan).
partition([H|T],Pivot,LessThan,[H|EqualTo],GreaterThan) :- H==Pivot,
    partition(T,Pivot,LessThan,EqualTo,GreaterThan).

partition([],_,[],[],[]).

quicksort([H|T],Out) :- quicksortDiff([H|T],Out-[]).
quicksort([],[]).

quicksortDiff([],L-L).
quicksortDiff([H|T],S-E) :- partition(T,H,Left,Middle,Right),
    quicksortDiff(Left,S-[Middle|[H|L]]),
    quicksortDiff(Right,L-E).
