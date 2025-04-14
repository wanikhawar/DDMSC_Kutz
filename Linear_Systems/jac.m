function J = jac(f, x, eps)
% JAC Computes the numerical Jacobian matrix of a vector-valued function
% J = jac(f, x, eps) returns the Jacobian of f evaluated at x using central
% difference with step size eps. f is a function handle returning a column 
% vector.

    if nargin < 3
        eps = 1e-6;
    end

    n = length(x);
    m = length(f(x));
    J = zeros(m, n);

    for i = 1:n
        dx = zeros(n, 1);
        dx(i) = eps;
        J(:, i) = (f(x + dx) - f(x - dx)) / (2 * eps);
    end
end