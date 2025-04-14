% Parabolic fit
clc;
clear;
close all;

x = 0:0.025:1;        
y = log(1+x);           % real data

sum_x4 = sum(x.^4);
sum_x3 = sum(x.^3);
sum_x2 = sum(x.^2);
sum_x = sum(x);
n = length(x);
sum_x2y = sum(x.^2 .* y);
sum_xy  = sum(x.*y);
sum_y = sum(y);

P = [sum_x4 sum_x3 sum_x2;
    sum_x3 sum_x2 sum_x;
    sum_x2 sum_x n];          

r = [sum_x2y;
    sum_xy;
    sum_y];             

q = P \ r;          % vector of coefficients

a = q(1);
b = q(2);
c = q(3);

y_fit = a*x.^2 + b*x+c;    % fit data

figure(1)
plot(x,y,'bo-','linewidth',2)
hold on
plot(x,y_fit, 'r^-','linewidth',2)
hold off
xlabel("x")
ylabel("y")
legend("Actual data", "Parabolic fit")
