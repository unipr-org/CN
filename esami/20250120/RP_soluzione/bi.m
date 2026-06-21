function [c] = bi(f,a,b,toll,max)
%metodo di bisezione
for k=1:max
    c=(a+b)/2;

    if (b-a)>toll
        error('tolleranza raggiunta')
        return;
    end

    if f(a)*f(c)<0
        b = c;
    else
        a = c;
    end
end
disp('iterazioni massime raggiunte')