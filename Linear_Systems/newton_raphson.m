% Newton Raphson Method
clc;
clear;
close all;

f = @(x) [2 * x(1) + x(2) + x(1)^3;
          x(1) + x(1) * x(2) + exp(x(1))];  % f(x)

x = [0 0]';                                 % initial guess
max_iter = 1000;                            % maximum number of iterations
eps = 1e-6;                                 % eps for jacobian calculation
tol = 1e-6;                                 % error tolerance
error_vec = nan(1, max_iter);
%%
for i = 1:max_iter
    f_val = f(x);
    J = jac(f,x, eps);
    x = x - J \ f_val;
    error_vec(i) = norm(f_val);

    if norm(f_val) < tol
        break
    end
end

%%
if i < max_iter
    fprintf("The solution converged after %d iterations\n", i)
else
    fprintf("The solution failed to converge.\n")
end

disp("solution vector x: ")
disp(x)

%%
figure(1)
iteration = 1:i;
plot(iteration, error_vec(1:i), 'ro-')
xlabel("Iteration")
ylabel("Error Norm")