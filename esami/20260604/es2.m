clc
clear
close all

a = -1;
b = 1;
f = @(x) 1 + exp(-x.^2);

for m = 1:10
    H = (b-a)/m;
    x = linspace(a,b,m+1);
    y = f(x);
    I_trapz = trapz(x, y); %valore "esatto" utilizzando comando trapz
    sommatoria = 0;
    for i = 2:m+1
        sommatoria = sommatoria + f((x(i)+x(i-1))/2);
    end
    I_pm = H*sommatoria;
    fprintf('Intervalli: %d | Valore(trapz): %f | Valore(pm)%e\n ', m , I_trapz, I_pm);
end