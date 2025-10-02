%������е�ۣ����㷨�ĳ�ASTVNN
clc;
clear;
format long;

global alpha r q10 q20 T alpha_i a_i d_i D sa ca s2a c2a pen_long ZJX FJX ZVJX FVJX jo djo gamma1 q30 mode E Gama M K;

%circle data
% T=4;             %ͼ����ʾʱ��
T=5; 
r=0.45;
alpha=pi/6;


pen_long=0;                                 %�ʳ�

%selection of an initial state q0
offset=79.34995/(180/pi);%��ѧģ�ͺ�ʵ��֮���ƫ��
% q1jj=[-pi/2;0;-pi/2;pi/2;-pi/2;0];
% q1jj=[0;0-offset;-150/(180/pi)+offset;0;-29.4/(180/pi);0];%��̬����
% q1jj=[0;0-offset;-82.6/(180/pi)+offset;0;83.5/(180/pi);0];%��̬����
q1jj=[0;-52.7/(180/pi)-offset;-33.5/(180/pi)+offset;0;-19.9/(180/pi);0];%��̬��ǰ
qa=q1jj;
qb=q1jj;
qc=q1jj;

q10=qa;
q20=qb;
q30=qc;

global n m p gamma Time;
n=6;                                    %�ؽ���Ŀ��Ҳ��6���ɶ�
m=3;                                    %ĩ��ִ�����ѿ����ռ�ά�ȣ�Ҳ��3��λ������
p=12;

% zjx=[360*pi/180;120*pi/180-offset;11*pi/180+offset;360*pi/180;180*pi/180;360*pi/180]; %ʵ�ʻ�е�۹ؽ�������
% fjx=-[360*pi/180;118*pi/180-offset;225*pi/180+offset;360*pi/180;97*pi/180;360*pi/180];
% ZJX=[zjx;zjx;zjx];
% FJX=[fjx;fjx;fjx];
jo=2.5;
djo=1.2;
ZJX=jo*ones(n,1);       %�ؽ�������
FJX=-jo*ones(n,1);       %�ؽ�������

% ZVJX=pi*ones(3*n,1);  %ʵ�ʻ�е�۵Ĺؽ��ٶȼ���
% FVJX=-pi*ones(3*n,1);

ZVJX=djo*ones(n,1);                 %�ؽ��ٶȼ���
FVJX=-djo*ones(n,1); 
 

Time=0;                                 %��ʼ���ظ��˶�����

gamma=10;                              %��Ӧ�����е�DNNϵ��alpha
% gamma1=0.05;
gamma1=3;
dq0=zeros(n,1);                             %��Ҫ�������ݣ���Ӧ�����е� Theta dot

y0=[dq0;zeros(m,1);zeros(p,1)];                        %��Ӧ��������Ҫ����y

init=[q10;y0];%acutally, abitrary initial y0
% options=odeset('Mass', @DRRC_matrixALL);          %����ODE����ز����������������������;�������
%����
%options=odeset( 'MaxStep',0.05,'RelTol',1e-3,'AbsTol',1e-4*ones(2*n+m+p,1)); 
%����
options=odeset( 'MaxStep',0.05,'RelTol',1e-4,'AbsTol',1e-8*ones(2*n+m+p,1)); 

tic;   %������ʱ

[t,y]=ode15s(@DRRC_net,[0:0.01:T],init,options);%ode15s much better than ode45            %ODE���
cpu_time=toc;                                                        %��ȡ��ʱ
size(t)
size(y)
%save cpu_time to "txt" file
fid=fopen('mvn_cost_time.txt','a');                                 %���ļ���¼ʱ��
fprintf(fid,'Computing cost time: %g\n',cpu_time);
fclose(fid);                                                        %�ر��ļ�

%����Ϊ�����ļ�
save DRRC_SYSdata y0 r alpha alpha_i a_i d_i D sa ca s2a c2a pen_long  T gamma n m p Time;
save DRRC_INITdata t y;
