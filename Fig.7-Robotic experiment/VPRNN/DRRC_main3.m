clear;
format long;

global alpha_i a_i d_i D sa ca s2a c2a pen_long q10 q20 q30 m n T aa;
load DRRC_SYSdata;
load SDNN_3robot_data;

Time=0;                             %Time清零
t_last=0;
t_time=0;

q_Time=zeros(m,1);

[Ppx,Ppy,Ppz]=DRRC_position1(pen_long,q10);          %计算雅可比矩阵
ix10=Ppx(7);iy10=Ppy(7);iz10=Ppz(7);
p1=[ix10;iy10;iz10];

% [Ppx,Ppy,Ppz]=DRRC_position2(pen_long,q20);          %计算雅可比矩阵
% ix20=Ppx(7);iy20=Ppy(7);iz20=Ppz(7);
% p2=[ix20;iy20;iz20];
% 
% [Ppx,Ppy,Ppz]=DRRC_position3(pen_long,q30);          %计算雅可比矩阵
% ix30=Ppx(7);iy30=Ppy(7);iz30=Ppz(7);
% p3=[ix30;iy30;iz30];




for jj=1:length(t)
    q1jj=qAll(jj,1:n)';%simulated end effector position
    [Ppx,Ppy,Ppz]=DRRC_position1(pen_long,q1jj);
    j10px(jj,1)=Ppx(1);
    j11px(jj,1)=Ppx(2);
    j12px(jj,1)=Ppx(3);
    j13px(jj,1)=Ppx(4);
    j14px(jj,1)=Ppx(5);
    j15px(jj,1)=Ppx(6);
    posx1(jj,1)=Ppx(7);%joint6
    j10py(jj,1)=Ppy(1);
    j11py(jj,1)=Ppy(2);
    j12py(jj,1)=Ppy(3);
    j13py(jj,1)=Ppy(4);
    j14py(jj,1)=Ppy(5);
    j15py(jj,1)=Ppy(6);
    posy1(jj,1)=Ppy(7);%joint6
    j10pz(jj,1)=Ppz(1);
    j11pz(jj,1)=Ppz(2);
    j12pz(jj,1)=Ppz(3);
    j13pz(jj,1)=Ppz(4);
    j14pz(jj,1)=Ppz(5);
    j15pz(jj,1)=Ppz(6);
    posz1(jj,1)=Ppz(7);%joint6
    %-------------------------------------------------
  
    
    
    dq1jj=dqAll(jj,1:n)';%simulated end effector velocity
    [J1,DJ1]=DRRC_jdj1(pen_long,q1jj,dq1jj);
    dpos1=J1*dq1jj;
    dposx1(jj,1)=dpos1(1);
    dposy1(jj,1)=dpos1(2);
    dposz1(jj,1)=dpos1(3);
    
  
    
        %%%参考轨迹
        
% t_time=t(jj)-Time*T;                    %每个周期内的相对于周期起点的运行时间，对该变量初始化计算出处于本周期中的哪一个时刻
% if t_time>T;
%    q_Time(jj,1)=1;
%    Time=Time+1;
%    t_time=t_time-T;
% end
%    
% %%%画圆 
% phi_sin=2*pi*sin(0.5*pi*(t(jj)-(1*T))/T);
% phi=phi_sin*sin(0.5*pi*(t(jj)-(1*T))/T);
% phiDot=phi_sin*pi*cos(0.5*pi*(t(jj)-(1*T))/T)/T;
% % aa=0.2;
% rz(jj)=aa*cos(phi)+iz10-aa;
% ry(jj)=aa*sin(phi)+iy10;
% rx(jj)=ix10;
% drz(jj)=-aa*sin(phi)*phiDot;
% dry(jj)=aa*cos(phi)*phiDot;
% drx(jj)=0;
% ddrz(jj)=-(aa*pi*pi/T)*(cos(phi)*phiDot*sin(pi*(t(jj)-(1*T))/T)+sin(phi)*pi*cos(pi*(t(jj)-(1*T))/T)/T);
% ddry(jj)=-(aa*pi*pi/T)*(sin(phi)*phiDot*sin(pi*(t(jj)-(1*T))/T)-cos(phi)*pi*cos(pi*(t(jj)-(1*T))/T)/T); 
% ddrx(jj)=0;
t_time=t(jj)-Time*T;                    %每个周期内的相对于周期起点的运行时间，对该变量初始化计算出处于本周期中的哪一个时刻
if t_time>T;
   q_Time(jj,1)=1;
   Time=Time+1;
   t_time=t_time-T;
end
   
phi_sin=2*pi*sin(0.5*pi*t_time/T);
phi=phi_sin*sin(0.5*pi*t_time/T);
phiDot=phi_sin*pi*cos(0.5*pi*t_time/T)/T;
phiDotDot=pi^3*cos(pi*t_time/T)/T^2;
num=4;   
rx(jj)=0+ix10;      %实际的海星形状极坐标
ry(jj)=aa*(sin(phi)-sin(num*phi)/num)+iy10;
rz(jj)=aa*(cos(phi)+cos(num*phi)/num-1-1/num)+iz10;
drx(jj)=0;
dry(jj)=aa*((2*pi^2*cos((pi*t_time)/(2*T))*sin((pi*t_time)/(2*T))*cos(2*pi*sin((pi*t_time)/(2*T))^2))/T - (2*pi^2*cos(2*pi*num*sin((pi*t_time)/(2*T))^2)*cos((pi*t_time)/(2*T))*sin((pi*t_time)/(2*T)))/T);
drz(jj)=-aa*((2*pi^2*cos((pi*t_time)/(2*T))*sin((pi*t_time)/(2*T))*sin(2*pi*sin((pi*t_time)/(2*T))^2))/T + (2*pi^2*cos((pi*t_time)/(2*T))*sin(2*pi*num*sin((pi*t_time)/(2*T))^2)*sin((pi*t_time)/(2*T)))/T);


Q1(jj,:)=qAll(jj,1:n);


dQ1(jj,:)=dqAll(jj,1:n);


    
    t(jj);
    
end
% --跟踪Errors-
erposx=rx'-posx1;
erposy=ry'-posy1;
erposz=rz'-posz1;

erdposx=drx'-dposx1;
erdposy=dry'-dposy1;
erdposz=drz'-dposz1;




% save DRRC_SRDdata1 t qAll dqAll ddqAll uAll posx posy posz dposx dposy dposz ddposx ddposy ddposz;
save DRRC_SRDdata2 erposx erposy erposz erdposx erdposy erdposz ;
% rx ry rz
save DRRC_SRDdata3 t posx1 posy1 posz1  ...
j10px j11px j12px j13px j14px j15px j10py j11py j12py j13py j14py j15py j10pz j11pz j12pz j13pz j14pz j15pz ...






