clc
clear
%es 2 punto 1 :  norma ∞ di un vettore di 100 numeri casuali 
x = rand(100,1);

max_val = 0;
for i = 1:100
    if abs(x(i)) > max_val
        max_val = abs(x(i));
    end
end

norm_inf = max_val;

disp('la norma a infinito è: ')
disp(norm_inf);

%es 2 punto 2: la norma 2 di un vettore di 100 numeri casuali 
somma = 0;
for i = 1:100
    somma = somma + x(i)^2;
end

norm_2 = sqrt(somma);

disp('la norma 2 è: ')
disp(norm_2);

%es 2 punto 3 condizionamento in norma ∞ di una matrice 10X10 di numeri casuali 
A = rand(10);

% norma infinito
normA = 0;
for i = 1:10
    somma = sum(abs(A(i,:)));
    if somma > normA
        normA = somma;
    end
end

Ainv = inv(A);

normAinv = 0;
for i = 1:10
    somma = sum(abs(Ainv(i,:)));
    if somma > normAinv
        normAinv = somma;
    end
end

condA = normA * normAinv;
disp('il condizionamento a norma infinito è: ');
disp(condA);