clc
clear
close all

f = @(x) sqrt(1-x.^2)
a = 0;
b = 1;

for m=1:15
    H = (b-a)/m;
    x = linspace(a,b,m+1);
   
    Itrap = trapz(x,f(x))
    err_trap(m) = abs(Itrap - pi/4)
end

leib=0;
for n=1:15
    leib=leib+((-1)^n-1)/(2*n-1)
    err_leib(n) = abs(leib - pi/4 )
end

figure;
subplot(2,1,1)
semilogy(1:15, err_trap, 'b-o', 'LineWidth', 1.5)
xlabel('n (sottointervalli)'); 
ylabel('Errore');
title('Errore metodo Trapezi'); 
grid on

subplot(2,1,2)
semilogy(1:15, err_leib, 'r-o', 'LineWidth', 1.5)
xlabel('n (addendi)'); 
ylabel('Errore')
title('Errore formula di Leibniz'); 
grid on