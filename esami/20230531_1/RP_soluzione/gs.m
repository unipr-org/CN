function [r, xk1, it] = gs(A, b, x0, max_it, tol)
% METODO DI GAUSS-SEIDEL
% Risoluzione di sistemi lineari Ax = b

xk = x0;
    it = 0;

    D = diag(diag(A));
    E = tril(A, -1);
    F = triu(A, 1);
    B = -inv(D+E)*F;
    q = inv(D+E)*b;
    r = max(abs(eig(B)));
    xk1 = B*xk+q;
    it = it + 1;

    while norm(xk1 - xk) > tol && it <= max_it
        xk = xk1;
        xk1 = B*xk+q;
        it = it + 1;
    end