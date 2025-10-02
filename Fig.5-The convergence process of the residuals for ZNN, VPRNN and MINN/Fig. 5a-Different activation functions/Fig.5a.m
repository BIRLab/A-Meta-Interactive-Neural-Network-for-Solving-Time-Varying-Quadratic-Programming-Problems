% Activation functions
close all
clear 
clc
x = linspace(-1, 1, 1000);


linear = x;

% % Power
power = x.^3;

% Swish
swish = x ./ (1 + exp(-x));

% ReLU
relu = max(0, x);


figure;
plot(x, linear, 'b:', 'DisplayName', 'Linear','LineWidth',3,'color','#CF3D3E');
hold on;
plot(x, power, 'g--', 'DisplayName', 'Power','LineWidth',3,'color','#F46F43');
plot(x, swish, 'r:', 'DisplayName', 'Swish','LineWidth',3,'color','#80A6E2');
plot(x, relu, 'm', 'DisplayName', 'ReLU','LineWidth',3,'color','#403990');
hold off;


title('Activation Functions');
grid on;
legend;
 set(gca,'FontName','Times New Roman','FontSize',10,'LineWidth',1.5);