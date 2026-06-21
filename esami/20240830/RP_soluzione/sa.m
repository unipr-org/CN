function [X] = sa(A)
%sostituzione in avanti
n = size(A,1);
X = zeros(n);

for col = 1:n
    b = zeros(n, 1);
    b(col) = 1;          % col-esima colonna dell'identità
    
    x = zeros(n, 1);
    for i = 1:n
        somma = 0;
        for j = 1:i-1
            somma = somma + A(i,j) * x(j);
        end
        x(i) = (b(i) - somma) /A(i,i);
    end
    
    X(:, col) = x;
end