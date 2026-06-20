clc
clear
close all

f = @(x) sin(x);
a = -pi/2;
b = pi/2;
Its1 = (f(b)+f(a))*((b-a)/2);
err1 = abs(Its1-0);

a1 = pi/2;
b1 = (5*pi)/2;
Its2 = (f(b1)+f(a1))*((b1-a1)/2)
err2 = abs(Its2-2)

a2 = 0;
b2 = pi;
m = 10
H = (b2-a2)/m
x = linspace(a2,b2,m+1)
sommatoria = 0;
for i=2:m
    sommatoria = sommatoria + f(x(i));
end
Int = (H/2)*(f(x(1))+2*sommatoria + f(x(m+1)))

I_exact = 2;


fprintf(' m        errore\n');
fprintf('---------------------\n');

for mv=1:40
    s = 0;
    x1 = linspace(a2,b2,mv+1);

    for i=2:mv
        s = s + f(x1(i));
    end

    I = (H/2)*(f(x1(1))+2*s + f(x1(mv)));

    err = abs(I-I_exact);

    fprintf('%d    %e\n',mv,err);

end