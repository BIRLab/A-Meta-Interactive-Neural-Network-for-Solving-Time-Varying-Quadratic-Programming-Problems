close all
clc
clear all
for iter=1:1
MINNLinearStyle;
VPRNNLinearStyle;
ZNNLinearStyle
legend('MINN','VPRNN','ZNN');
set(gca,'FontName','Times New Roman','FontSize',16,'LineWidth',1.5);
end
