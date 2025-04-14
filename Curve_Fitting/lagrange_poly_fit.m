clc
clear 
close all

x = [1 2 3];
y = [3 7 9];

p = @(xq) y(1)*((xq-x(2)) * (xq-x(3))) / ((x(1)-x(2)) * (x(1) - x(3))) + ...
    y(2)*((xq-x(1)) * (xq-x(3))) / ((x(2)-x(1)) * (x(2) - x(3))) + ...
    y(3)*((xq-x(1)) * (xq-x(2))) / ((x(3)-x(1)) * (x(3) - x(2)));

xq = 1:0.1:3;
yq = arrayfun(p, xq);               

plot(x, y, 'bo', 'LineWidth', 2)
hold on
plot(xq, yq, 'r-', 'LineWidth', 2)
hold off

xlabel('x')
ylabel('y')
legend('Data Points', 'Lagrange Interpolation')
title('Lagrange Interpolation of 3 Points')
grid on