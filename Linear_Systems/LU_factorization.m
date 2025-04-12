% LU method

clc
clear
close all

A = [4 3 -1
    -2 -4 5
    1 2 6];

b = [6
    -1
    9];

[m,n] = size(A);

%% LU factorization
L = eye(m);
U = A;

for i = 1:m-1
    for j = i+1:m
        L(j,i) = U(j,i)/U(i,i);
        U(j, i:end) = U(j,i:end) - L(j,i).*U(i,i:end);
    end
end

%% Ly=b
y = zeros(size(b));

for i = 1:m
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end

%% Ux=y
x = zeros(size(b));

for i = m:-1:1
    x(i) = (y(i) - U(i,i+1:m)*x(i+1:m))/U(i,i);
end

%%
disp("solution vector x: ")
disp(x)

