%% Gauss Siedel iteration method
clc;
clear;
close all;

A = [4 3 -1
    -2 -4 5
    1 2 6];

b = [6
    -1
    9];

max_iter = 100;

D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

x = zeros(size(b));

%%
for i = 1:max_iter
    x = (D+L) \ (b - U*x);
end

%%
disp("solution vector x: ")
disp(x)