function [xk] = newton(x0, fprimo,f,toll,max)
%metodo di newton con criterio incremento
xk = x0;

for k = 0:max
    xk1 = xk - f(xk)/fprimo(xk);

    if abs(xk1-xk) < toll
        xk = xk1;
        return;
    end

    xk = xk1;
end
disp('iterazioni max raggiunte')