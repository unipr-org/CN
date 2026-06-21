clc
clear
close all

f = @(x) sin(x);
a = -pi/2;
b = pi/2;
Ipm1 = (b-a)*f((a+b)/2);
err1 = abs(Ipm1-0);

a = 0;
b = pi;
Ipm2 = (b-a)*f((a+b)/2);
err2 = abs(Ipm2-2);

a = 0;
b = pi;
m = 10
H = (b-a)/m
x = linspace(a,b,m+1)
sommatoria = 0;
for i=2:m
    sommatoria = sommatoria + f((x(i)+x(i-1))/2);
end
Int = H*sommatoria

I_exact = 2;

mv = [1 2 4 8 16 32 64 128];

fprintf(' m        errore\n');
fprintf('---------------------\n');

for m = mv

    h = pi/m;
    x = linspace(0,pi,m+1);

    s = 0;

    for i=2:length(x)
        s = s + f((x(i)+x(i-1))/2);
    end

    I = h*s;

    err = abs(I-I_exact);

    fprintf('%d    %e\n',m,err);

end