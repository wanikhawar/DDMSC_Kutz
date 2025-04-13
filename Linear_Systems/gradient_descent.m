%% Gradient Descent
clc;
clear;
close all;

A = [4 3 -1
    -2 -4 5
    1 2 6];

b = [6
    -1
    9];

max_iter = 1000;    % maximum number of iterations
tol = 1e-5;         % tolerance

x = zeros(size(b)); % initialize solution vector

%%
for i = 1:max_iter
    r = A*x - b;                    % residual
    if norm(r) < tol
        break
    end
    nabla_f = A' * r;               % gradient
    alpha = (r' * r)/(r'*(A*A')*r); % learning rate
    x = x - alpha * nabla_f;
end

%%
if i < max_iter
    fprintf("Solution converged after %d iterations.\n", i)
else
    fprintf("Solution failed to converge in the maximum number of iterations.\n")
end
disp("solution vector x: ")
disp(x)