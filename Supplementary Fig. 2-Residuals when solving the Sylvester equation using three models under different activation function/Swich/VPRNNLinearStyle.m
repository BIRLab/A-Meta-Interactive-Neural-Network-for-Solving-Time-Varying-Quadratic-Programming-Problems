function VPRNNLinearStyle()


error=zeros(1,501);

gamma=5;
x0=[6 6 6 6];
tspan=[0:0.01:5]; 
options=odeset('Mass',@MatrixM,'MStateDep','none');

[t,x]=ode45(@VPRNNRightHandSide,tspan,x0,options,gamma);
Xstar=10*[sin(t) cos(t) -cos(t) sin(t)]'; 
err2=x'-Xstar; total=length(t);
for i=1:total
    nerr1(i)=norm(err2(:,i)); 
end

plot(t,nerr1,'-.','linewidth',3,'color','#c4a5de');hold on



% figure(2);
% text(4,5,'t5','fontsize',10);hold on
% text(1,50,'x()','fontsize',10);hold on
% axes('Position',[0.4,0.4,0.2,0.2]);
% for i=1:1
% plot(t,error(i,1:501),'b','linewidth',1.5);xlim([1.35,1.5]);ylim([0,0.1]);hold on
% end