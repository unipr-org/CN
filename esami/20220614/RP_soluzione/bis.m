function [x,i] = bis(f,a,b,toll,max)
%metodo bisezione
for i=1:max
    c = (a+b)/2;
    
    if abs(b-a)<toll
        fprintf('tolleranza raggiunta\n')
        return;
    end
    

    if (f(a)*f(c)<0)
        b = c;
    else
        a = c;
    end
x = c;
end
fprintf('iterazioni max raggiunte');
end