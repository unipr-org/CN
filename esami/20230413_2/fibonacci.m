function [elemento] = fibonacci(n)
%dato n restituisce n-esimo elemento della succ di Fibonacci
seq = [0 1 1];

for i = 4:n
    seq(i) = seq(i-1) + seq(i-2); 
end

disp('il numero n della sequenza è:')
disp(seq(n))
elemento = seq(n);