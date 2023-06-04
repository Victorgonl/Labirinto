% 2. Regras %

% 2.1. Way %
way(X, Y, N) :-
    pway(X, Y, N); pway(Y, X, N).

% 2.2. Solve %
/* solve(X, Y, P, N) :-
    dfs(X, Y, [X], P, 0, N); write("no"). */
solve(X, Y, P, N) :-
    findall([M, Q], dfs(X, Y, [X], Q, 0, M), A),
    sort(A, B),
    member([N, P], B); write("no").

% 2.3. Depth-First Search %
dfs(X, X, P, P, N, N).
dfs(X, Y, V, P, M, N) :-
    way(X, Z, A),
    \+ member(Z, V),
    append(V, [Z], W),
    B is M + A,
    dfs(Z, Y, W, P, B, N).