function ZNNLinearStyle


error=zeros(1,501);

gamma=5;
x0=[6 6 6 6];
tspan=[0:0.01:5]; 
options=odeset('Mass',@MatrixM,'MStateDep','none');

[t,x]=ode45(@ZNNRightHandSide,tspan,x0,options,gamma);
Xstar=10*[sin(t) cos(t) -cos(t) sin(t)]'; 
err2=x'-Xstar; total=length(t);
for i=1:total
    nerr1(i)=norm(err2(:,i)); 
end

plot(t,nerr1,'--','linewidth',3,'color','#96CCCB');hold on



% figure(1);
% subplot(2,2,1);text(2.5,25,'x11','fontsize',10);text(4,-35,'t1','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
% subplot(2,2,3);text(2.5,25,'x21','fontsize',10);text(4,-35,'t2','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
% subplot(2,2,2);text(2.5,25,'x12','fontsize',10);text(4,-35,'t3','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on
% subplot(2,2,4);text(2.5,25,'x22','fontsize',10);text(4,-35,'t4','fontsize',10);xlim([0,5]);ylim([-50,50]);hold on

% figure(2);
% text(4,5,'t5','fontsize',10);hold on
% text(1,50,'x()','fontsize',10);hold on
% axes('Position',[0.4,0.4,0.2,0.2]);
% for i=1:10
% plot(t,error(i,1:501),'b','linewidth',1.5);xlim([1.35,1.5]);ylim([0,0.1]);hold on
% end

%annotation('arrow',[0.5 0.35],[0.35 0.14],'LineStyle','-','color',[1 0 0],'HeadStyle','plain');

