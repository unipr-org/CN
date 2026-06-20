function [x] = jac(A,b,max,toll,x0)
%metodo di jacobi
D = diag(diag(A));
C = A - D;
B = inv(-D)*C;
Q = inv(D)*b; 
xk = x0;

for k= 0:max
    
    xk1 = B*xk+Q;

    if (norm(xk1-xk,inf)<toll)
        fprintf('tolleranza raggiunta');
        return;
    end
        
    xk = xk1;
    x = xk(:,1);
end
