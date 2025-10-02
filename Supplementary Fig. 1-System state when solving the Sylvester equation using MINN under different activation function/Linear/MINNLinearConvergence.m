%function ZNNLinearConvergence()
close all
clc
clear all

gamma=5;

tspan=[0:0.01:5]; [m,n]=size(MatrixC(0));
options=odeset('Mass',@MatrixM,'MStateDep','none');

for iter=1:3
x0=80*(rand(4,1)-0.5*ones(4,1));

[t,x1]=ode45(@MINNRightHandSide,tspan,x0,options,gamma);

subplot(2,2,1);plot(t,x1(:,1),'b',t,10*sin(t),'r--','linewidth',1.5);text(2.5,15,'x11','fontsize',10);text(4,-35,'t1','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
subplot(2,2,3);plot(t,x1(:,2),'b',t,10*cos(t),'r--','linewidth',1.5);text(2.5,15,'x21','fontsize',10);text(4,-35,'t2','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
subplot(2,2,2);plot(t,x1(:,3),'b',t,-10*cos(t),'r--','linewidth',1.5);text(2.5,15,'x12','fontsize',10);text(4,-35,'t3','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
subplot(2,2,4);plot(t,x1(:,4),'b',t,10*sin(t),'r--','linewidth',1.5);text(2.5,15,'x22','fontsize',10);text(4,-35,'t4','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
end