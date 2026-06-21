clc
clear

f = @(x) 1+(exp(-x.^2)/2);
a = -1;
b = 1;
I_quad = quad(f,a,b);
for m = 1:100
    H = (b-a)/m;
    som = 0;
    x = linspace(a,b,m+1);
    for i = 1:m
        som = som + f(x(i));
    end
    I = (H/2)*(f(x(1))+2*som+f(x(m+1)));
    err = abs(I-I_quad);
    fprintf('per m = %d l errore è di: %d \n',m,err)
end
