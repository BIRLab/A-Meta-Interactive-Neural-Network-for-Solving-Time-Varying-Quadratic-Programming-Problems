function MINN

global  ZJX  ZJXX  eMINN
ZJX=4*ones(4,1);  
ZJXX=4; 
tspan=0:0.01:5; 
%If gamma is 1, then the end-time is 10s for creating figures
%If gamma is 10,then the end-time is 1s  for creating figures
%If gamma is 100,then the end-time is 0.1s for creating figures
options=odeset( 'MaxStep',0.01,'RelTol',1e-1,'AbsTol',1e-3*ones(7,1)); 
gamma=0;

    y0=[zeros(1);zeros(4,1)]; 
    %x0=3*(2*rand(2,1)-ones(2,1));
    x0=[2.6; 2.6];
  init=[x0;y0];
    [t,x]=ode45(@MINN_con_righthandside, tspan, init, options, gamma);
         total=length(t);
     for i=1:total
         error(i)=norm(eMINN{i},2);
     end

    figure(3)

    plot(t,error,'m-','linewidth',3,'color','#f0988c');
    xlabel('t(s)');
    hold on;
    legend('MINN');
    
    
%     figure(3)
%     subplot(2,1,1);
%     plot(t,x(:,1),'r','linewidth',1.5);  
%     %xlabel('t(s)');
%     yline(ZJXX,'--b','linewidth',1.5);
%     hold on 
%     yline(-ZJXX,'--b','linewidth',1.5);
%    % legend('x_1(t)');
%    set(gca,'FontName','Times New Roman','FontSize',16,'LineWidth',1.5);
%    % subplot(2,1,2);plot(t,x2,'b-.','linewidth',1.5);hold on
%      subplot(2,1,2);plot(t,x(:,2),'r','linewidth',1.5); 
%     yline(ZJXX,'--b','linewidth',1.5);
%     hold on 
%     yline(-ZJXX,'--b','linewidth',1.5);
%     % legend('x_2(t)');xlabel('t(s)');
%     hold on
%    set(gca,'FontName','Times New Roman','FontSize',16,'LineWidth',1.5);
