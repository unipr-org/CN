clc
clear
close all

M = [4 0 0; 2 5 0; 0.5 0 3]
X = sa(M);
disp('=== Inversa con sostituzione in avanti ===')
disp(X)

%% Confronto con built-in
M_inv = inv(M);
disp('=== Inversa con inv() built-in ===')
disp(M_inv)
