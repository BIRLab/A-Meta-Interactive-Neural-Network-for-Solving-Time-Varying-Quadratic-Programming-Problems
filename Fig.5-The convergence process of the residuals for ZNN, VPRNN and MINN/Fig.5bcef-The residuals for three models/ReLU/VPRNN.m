function VPRNN

global  ZJX  ZJXX  eVPRNN 
ZJX=3*ones(4,1);  
ZJXX=3; 
tspan=0:0.01:4; 
%If gamma is 1, then the end-time is 10s for creating figures
%If gamma is 10,then the end-time is 1s  for creating figures
%If gamma is 100,then the end-time is 0.1s for creating figures
options=odeset( 'MaxStep',0.01,'RelTol',1e-4,'AbsTol',1e-8*ones(7,1)); 
gamma=2;

    y0=[zeros(1);zeros(4,1)]; 
    %x0=3*(2*rand(2,1)-ones(2,1));
    x0=[2.6;2.6];
  init=[x0;y0];
    [t,x]=ode15s(@VPRNN_con_righthandside, tspan, init, options, gamma);
         total=length(t);
     for i=1:total
         error(i)=norm(eVPRNN{i},2);
     end



    plot(t,error,'c--','linewidth',3,'color','#c4a5de');
    xlabel('t(s)');
    hold on;
    
 
% plot(t,epos3(:,1),'m--',t,epos3(:,2),'b-',t,epos3(:,3),'k-.','linewidth',2.5);hold on;
% xlabel('Time (Second)');
% x=[1.73 6.74 6.74 1.73];
% y=[-0.5 -0.5 0.5 0.5];
% fill(x,y,'r');
% alpha(0.1)
% title('Cooperative position error3');
% legend('ex','ey','ez');
