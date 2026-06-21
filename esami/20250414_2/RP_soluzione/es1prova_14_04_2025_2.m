clc
clear
close all

g = @(x) x.^5 - x + 3;

a = -2;
b = 0;

alpha = fzero(g,[a b]);

q = (b-a)/(g(b)-g(a));

x0 = -1;

tol = 1e-10;

x(1) = x0;

% inizializzo per entrare nel ciclo
x(2) = x(1) - g(x(1))*q;

k = 2;

while abs(x(k) - x(k-1)) > tol

    x(k+1) = x(k) - g(x(k))*q;

    k = k + 1;

end


err = abs(x-alpha);

figure
semilogy(0:length(err)-1,err,'o-','LineWidth',2)
grid on

xlabel('Iterazioni')
ylabel('Errore')
title('Errore rispetto alla radice esatta')

fprintf('Radice Matlab = %.15f\n',alpha)
fprintf('Radice metodo = %.15f\n',x(end))
fprintf('Iterazioni    = %d\n',length(x)-1)