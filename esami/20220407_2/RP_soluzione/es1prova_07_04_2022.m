clc
clear
close all

n = 10;
x = 1:n^2;
A = zeros(n);
z = 1;
for i = 1:n
    for j = 1:n
      A(i,j) = x(z);
      z = z+1;
    end
end
disp(A)