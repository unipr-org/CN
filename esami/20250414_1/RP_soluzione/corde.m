function [root,x] = corde(g,a,b,x0,max,toll)
%metodo delle corde
q = b-a/(g(b)-g(a));

x_old = x0;
x = linspace(0,0,max);
for k = 1:max
    % controllo di arresto (residuo)
    if abs((x_old)) < toll
        root = x_old;
        return;
    end

    x_new = x_old-g(x_old)./q
    x_old = x_new;

    root = x_old;
    x(k) = root;
end
disp('iterazioni massime raggiunte')
end