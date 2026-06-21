function [sol] = sost_avanti_pm(A,b)
%Risolve Ax = b con sostituzione in avanti
%   per una matrice bidiagonale inferiore di ordine n:
%   diagonale principale = 1, subdiagonale = alpha.
n = size(A,1);
x = zeros(n,1);
x(1) = b(1);
for i = 2:n
    sommatoria = 0;
    for j=1:i-1
        sommatoria = sommatoria + A(i,j).*x(j);
    end
    x(i) = (b(i) - sommatoria)./(A(i,i));
end
sol = x;