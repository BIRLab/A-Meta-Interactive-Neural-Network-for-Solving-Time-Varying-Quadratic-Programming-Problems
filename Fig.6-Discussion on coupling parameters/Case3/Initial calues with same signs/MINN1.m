function MINN1

global  ZJX  ZJXX  eMINN1 
ZJX=4*ones(4,1);  
ZJXX=4; 
tspan=0:0.01:4; 

options=odeset( 'MaxStep',0.01,'RelTol',1e-1,'AbsTol',1e-3*ones(7,1)); 
gamma=0;

    y0=[zeros(1);zeros(4,1)]; 
    %x0=3*(2*rand(2,1)-ones(2,1));
    x0=[2.6; 2.6];
  init=[x0;y0];
    [t,x]=ode45(@MINN_net1, tspan, init, options, gamma);
         total=length(t);
     for i=1:total
         error(i)=norm(eMINN1{i},2);
     end

    figure(1)
    plot(t,error,'m:','linewidth',2.5,'color','#403990');
    xlabel('t(s)');
    hold on;
    
   
