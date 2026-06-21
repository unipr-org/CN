clc
clear

n = 5;
f = @ (n) fibonacci(n);

if((f(n-1)*f(n+1))-f(n)^2 == (-1)^(n+1))
    disp('espressione esatta')
end

