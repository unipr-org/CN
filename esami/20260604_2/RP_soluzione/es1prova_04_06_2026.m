clc
clear

f = @(x) exp(-x.^2);
H = 0.1;
for B = 1:20
    a = -B;
    b = B;
    m = (b-a)/H;
    %I1 = integral(f,a,b)
    I = pmc(f,a,b,m);
    err = abs(I-sqrt(pi));
    fprintf('Errore con B = %d: %f \n',B,err)
end