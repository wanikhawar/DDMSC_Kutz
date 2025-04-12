clc
clear
close all


%% Gauss Elimination

A = [1 2 5
    3 1 5
    5 6 9];

b = [13
    14
    29];

C = [A b];

m = size(A,1);

%% forward elimination

for i = 1:m
    C(i,:) = C(i,:)./C(i,i);
    for j = i+1:m
        C(j,:) = C(j,:) - C(j,i).*C(i,:);
    end
end

%% back substitution

x = zeros(size(b));

for i = m:-1:1
    x(i) = C(i,m+1) - C(i,i+1:m) * x(i+1:m);
end

%%
disp("solution vector x: ")
disp(x)


