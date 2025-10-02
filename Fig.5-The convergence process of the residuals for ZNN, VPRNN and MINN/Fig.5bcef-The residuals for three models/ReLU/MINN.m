function MINN

global  ZJX  ZJXX  eMINN
ZJX=3*ones(4,1);  
ZJXX=3; 
tspan=0:0.01:4; 
%If gamma is 1, then the end-time is 10s for creating figures
%If gamma is 10,then the end-time is 1s  for creating figures
%If gamma is 100,then the end-time is 0.1s for creating figures
options=odeset( 'MaxStep',0.01,'RelTol',1e-1,'AbsTol',1e-3*ones(7,1)); 
gamma=2;

    y0=[zeros(1);zeros(4,1)]; 
    %x0=3*(2*rand(2,1)-ones(2,1));
    x0=[2.6; 2.6];
  init=[x0;y0];
    [t,x]=ode45(@MINN_con_righthandside, tspan, init, options, gamma);
         total=length(t);
     for i=1:total
         error(i)=norm(eMINN{i},2);
     end

    plot(t,error,'m-','linewidth',3,'color','#f0988c');
    xlabel('t(s)');
    hold on;
