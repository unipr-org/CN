function [elemento] = fibonacci(n)
%dato n restituisce n-esimo elemento della succ di Fibonacci
seq = [0 1];

for i = 3:n
    seq(i) = seq(i-1) + seq(i-2); 
end


elemento = seq(n);