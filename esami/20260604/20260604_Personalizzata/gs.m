function [x] = gs(A,b,max,toll,x0)
%metodo di gs
E = tril(A,-1);
F = triu(A,1);
D = diag(diag(A));
B = inv(-(E+D))*F;
Q = inv(E+D)*b;
xk = x0;
for k = 0:max
    xk1 = B*xk+Q;

    if(norm(xk1-xk,inf)<toll)
        fprintf('tolleranza raggiunta');
        return;
    end

    xk = xk1;
    x = xk(:,1);
end

end