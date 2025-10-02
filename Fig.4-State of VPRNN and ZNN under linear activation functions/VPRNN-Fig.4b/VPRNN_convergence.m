close all
clc 
clear all
global  ZJX FJX ZJXX  ttt mode errr
gamma=3;
tspan=0:0.01:4; 
%options=odeset('Mass', @LIVEmatrixW, 'MStateDep', 'none');
options=odeset( 'MaxStep',0.01,'RelTol',1e-2,'AbsTol',1e-3*ones(7,1)); 
ZJX=1.1*ones(4,1);  
ZJXX=1.1; 
%FJX=-5*ones(4,1); 

y0=[zeros(1);zeros(4,1)];  

for iter=1:3
  x0=1.1*(2*rand(2,1)-ones(2,1));
  init=[x0;y0];
    [t,x]=ode15s(@VPRNN_con_righthandside, tspan, init, options, gamma);
    subplot(2,1,1);
    plot(t,x(:,1),'r','linewidth',1.5);  
    xlabel('t(s)');
    yline(ZJXX,'--b','linewidth',1.5);
    hold on 
    yline(-ZJXX,'--b','linewidth',1.5);
    legend('h_1(t)');
   set(gca,'FontName','Times New Roman','FontSize',18,'LineWidth',1.5);
   % subplot(2,1,2);plot(t,x2,'b-.','linewidth',1.5);hold on
     subplot(2,1,2);plot(t,x(:,2),'r','linewidth',1.5); 
    yline(ZJXX,'--b','linewidth',1.5);
    hold on 
    yline(-ZJXX,'--b','linewidth',1.5);
     legend('h_2(t)');xlabel('t(s)');hold on
   set(gca,'FontName','Times New Roman','FontSize',18,'LineWidth',1.5);
 end