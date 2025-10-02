%三个机械臂，将算法改成ASTVNN
clc;
clear;
format long;

global alpha r q10 q20 T alpha_i a_i d_i D sa ca s2a c2a pen_long ZJX FJX ZVJX FVJX jo djo gamma1 q30 mode E Gama M K;

%circle data
% T=4;             %图像显示时间
T=5; 
r=0.45;
alpha=pi/6;


pen_long=0;                                 %笔长

%selection of an initial state q0
offset=79.34995/(180/pi);%数学模型和实际之间的偏差
% q1jj=[-pi/2;0;-pi/2;pi/2;-pi/2;0];
% q1jj=[0;0-offset;-150/(180/pi)+offset;0;-29.4/(180/pi);0];%姿态向上
% q1jj=[0;0-offset;-82.6/(180/pi)+offset;0;83.5/(180/pi);0];%姿态向下
q1jj=[0;-52.7/(180/pi)-offset;-33.5/(180/pi)+offset;0;-19.9/(180/pi);0];%姿态向前
qa=q1jj;
qb=q1jj;
qc=q1jj;

q10=qa;
q20=qb;
q30=qc;

global n m p gamma Time;
n=6;                                    %关节数目，也即6自由度
m=3;                                    %末端执行器笛卡尔空间维度，也即3个位置坐标
p=12;

% zjx=[360*pi/180;120*pi/180-offset;11*pi/180+offset;360*pi/180;180*pi/180;360*pi/180]; %实际机械臂关节物理极限
% fjx=-[360*pi/180;118*pi/180-offset;225*pi/180+offset;360*pi/180;97*pi/180;360*pi/180];
% ZJX=[zjx;zjx;zjx];
% FJX=[fjx;fjx;fjx];
jo=2.5;
djo=1.2;
ZJX=jo*ones(n,1);       %关节物理极限
FJX=-jo*ones(n,1);       %关节物理极限

% ZVJX=pi*ones(3*n,1);  %实际机械臂的关节速度极限
% FVJX=-pi*ones(3*n,1);

ZVJX=djo*ones(n,1);                 %关节速度极限
FVJX=-djo*ones(n,1); 
 

Time=0;                                 %初始化重复运动次数

gamma=10;                              %对应文章中的DNN系数alpha
% gamma1=0.05;
gamma1=3;
dq0=zeros(n,1);                             %需要求解的内容，对应文章中的 Theta dot

y0=[dq0;zeros(m,1);zeros(p,1)];                        %对应文章中需要求解的y

init=[q10;y0];%acutally, abitrary initial y0
% options=odeset('Mass', @DRRC_matrixALL);          %设置ODE的相关参数，这里设置了相对误差公差和绝对误差公差
%不用
%options=odeset( 'MaxStep',0.05,'RelTol',1e-3,'AbsTol',1e-4*ones(2*n+m+p,1)); 
%用了
options=odeset( 'MaxStep',0.05,'RelTol',1e-4,'AbsTol',1e-8*ones(2*n+m+p,1)); 

tic;   %开启计时

[t,y]=ode15s(@DRRC_net,[0:0.01:T],init,options);%ode15s much better than ode45            %ODE求解
cpu_time=toc;                                                        %读取计时
size(t)
size(y)
%save cpu_time to "txt" file
fid=fopen('mvn_cost_time.txt','a');                                 %打开文件记录时间
fprintf(fid,'Computing cost time: %g\n',cpu_time);
fclose(fid);                                                        %关闭文件

%保存为数据文件
save DRRC_SYSdata y0 r alpha alpha_i a_i d_i D sa ca s2a c2a pen_long  T gamma n m p Time;
save DRRC_INITdata t y;
