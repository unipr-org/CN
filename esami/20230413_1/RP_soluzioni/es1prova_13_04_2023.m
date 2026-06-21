clc
clear

n = 5;
f = @ (n) fibonacci(n);
fprintf('il numero %d della sequenza è:',n)
disp(f(n))

for z=2:100
    if((f(z)/f(z-1)) == ((1+sqrt(5))/2))
        disp('espressione esatta')
        return
    end
end
