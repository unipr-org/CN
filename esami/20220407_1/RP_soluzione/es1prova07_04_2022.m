clc
clear
close all

n=10;
H = zeros(n);
for i = 1:n
    for j = 1:n
        H(i,j)=(i+j-1)^-1;
    end
end

disp('Matrice H')
disp(H)
disp('Matrice H1 hilb(n)')
H1= hilb(n);
disp(H1)
disp('differenza valori')
err = H - H1;
disp(err)