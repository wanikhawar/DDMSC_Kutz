clc;
clear;
close all;

x = 0:0.025:0.1;        
y = log(1+x);           % real data

sum_x2 = sum(x.^2);
sum_x = sum(x);
n = length(x);
sum_xy = sum(x.*y);
sum_y = sum(y);

P = [sum_x2 sum_x;
    sum_x n];          

r = [sum_xy;
    sum_y];             

q = P \ r;          % vector of coefficients

a = q(1);
b = q(2);

y_fit = a*x + b;    % fit data

figure(1)
plot(x,y,'bo-','linewidth',2)
hold on
plot(x,y_fit, 'r^-','linewidth',2)
hold off
xlabel("x")
ylabel("y")
legend("Actual data", "Linear fit")
