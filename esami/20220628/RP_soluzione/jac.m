function [x] = jac(A,b,toll,max,x0)
%metodo jacobi
D = diag(diag(A));
C = A - D;
Bj = -inv(D)*C;
qj = inv(D)*b;
xk = x0;
for k=1:max
    
    xk1=Bj*(xk)+qj;

    if norm(xk1-xk,inf)<toll
        fprintf('tolleranza raggiunta')
        return;
    end
    
    xk = xk1;
    x = xk(:,1);
end
disp('iterazioni massime raggiunte')