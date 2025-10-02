function doty=DRRC_net(t,y)

global  alpha_i a_i d_i D sa ca s2a c2a pen_long q10  T m gamma n p ZJX FJX ZVJX FVJX gamma1 L Time aa I1 E Gama M K mode;

persistent ix10 iy10 iz10 iax iay iaz ibx iby ibz;

q1=y(1:n);


dq1=y(n+1:2*n);


mu=y(2*n+1:2*n+m);
lambda=y(2*n+m+1:2*n+m+p);
q=q1;
dq=dq1;


t_time=t-Time*T;                 
if t_time>T
   Time=Time+1;
   t_time=t_time-T;
end

 [x1,y1,z1]=DRRC_position1(pen_long,q10);  %计算初始位置
   
if isempty(ix10)
    ix10=x1(7);
end

if isempty(iy10)
    iy10=y1(7);
end

if isempty(iz10)
    iz10=z1(7);
end

if isempty(iax)
    iax=0;
end

if isempty(iay)
    iay=0;
end

if isempty(iaz)
    iaz=0;
end

if isempty(ibx)
    ibx=0;
end

if isempty(iby)
    iby=0;
end

if isempty(ibz)
    ibz=0;
end

iy=iy10;
ix=ix10;
iz=iz10;
len=0.05;
% aa=len*2*pi/T/T/sqrt(2);

%%%XY平面画圆 
% phi_sin=2*pi*sin(0.5*pi*(t-(1*T))/T);
% phi=phi_sin*sin(0.5*pi*(t-(1*T))/T);
% phiDot=phi_sin*pi*cos(0.5*pi*(t-(1*T))/T)/T;
% aa=0.2;
% rx=aa*cos(phi)+ix-aa;
% ry=aa*sin(phi)+iy;
% rz=iz;
% drx=-aa*sin(phi)*phiDot;
% dry=aa*cos(phi)*phiDot;
% drz=0;
% ddrx=-(aa*pi*pi/T)*(cos(phi)*phiDot*sin(pi*(t-(1*T))/T)+sin(phi)*pi*cos(pi*(t-(1*T))/T)/T);
% ddry=-(aa*pi*pi/T)*(sin(phi)*phiDot*sin(pi*(t-(1*T))/T)-cos(phi)*pi*cos(pi*(t-(1*T))/T)/T); 
% ddrz=0;
%%%ZY平面画圆
% phi_sin=2*pi*sin(0.5*pi*(t-(1*T))/T);
% phi=phi_sin*sin(0.5*pi*(t-(1*T))/T);
% phiDot=phi_sin*pi*cos(0.5*pi*(t-(1*T))/T)/T;
% aa=0.15;
% rz=aa*cos(phi)+iz-aa;
% ry=aa*sin(phi)+iy;
% rx=ix;
% drz=-aa*sin(phi)*phiDot;
% dry=aa*cos(phi)*phiDot;
% drx=0;
% ddrz=-(aa*pi*pi/T)*(cos(phi)*phiDot*sin(pi*(t-(1*T))/T)+sin(phi)*pi*cos(pi*(t-(1*T))/T)/T);
% ddry=-(aa*pi*pi/T)*(sin(phi)*phiDot*sin(pi*(t-(1*T))/T)-cos(phi)*pi*cos(pi*(t-(1*T))/T)/T); 
% ddrx=0;
% 
% r=[rx;ry;rz];
% dr=[drx;dry;drz];           %对应的是文章中的r_dot
% ddr=[ddrx;ddry;ddrz];
aa=0.1;
num=4;                                  %4代表有4+1=5个角
phi_sin=2*pi*sin(0.5*pi*t_time/T);
phi=phi_sin*sin(0.5*pi*t_time/T);
phiDot=phi_sin*pi*cos(0.5*pi*t_time/T)/T;

%对应文章公式（1）位置层r
rx=0+ix;      %实际的海星形状极坐标
ry=aa*(sin(phi)-sin(num*phi)/num)+iy;
rz=aa*(cos(phi)+cos(num*phi)/num-1-1/num)+iz;
%对应文章公式（2）速度层r_dot
drx=0;
dry=aa*((2*pi^2*cos((pi*t_time)/(2*T))*sin((pi*t_time)/(2*T))*cos(2*pi*sin((pi*t_time)/(2*T))^2))/T - (2*pi^2*cos(2*pi*num*sin((pi*t_time)/(2*T))^2)*cos((pi*t_time)/(2*T))*sin((pi*t_time)/(2*T)))/T);
drz=-aa*((2*pi^2*cos((pi*t_time)/(2*T))*sin((pi*t_time)/(2*T))*sin(2*pi*sin((pi*t_time)/(2*T))^2))/T + (2*pi^2*cos((pi*t_time)/(2*T))*sin(2*pi*num*sin((pi*t_time)/(2*T))^2)*sin((pi*t_time)/(2*T)))/T);
%进一步对应加速度层r_dotdot
ddrx=0;
ddry=aa*((pi^3*cos((pi*t_time)/(2*T))^2*cos(2*pi*sin((pi*t_time)/(2*T))^2))/T^2 - (pi^3*sin((pi*t_time)/(2*T))^2*cos(2*pi*sin((pi*t_time)/(2*T))^2))/T^2 - (pi^3*cos(2*pi*num*sin((pi*t_time)/(2*T))^2)*cos((pi*t_time)/(2*T))^2)/T^2 + (pi^3*cos(2*pi*num*sin((pi*t_time)/(2*T))^2)*sin((pi*t_time)/(2*T))^2)/T^2 - (4*pi^4*cos((pi*t_time)/(2*T))^2*sin((pi*t_time)/(2*T))^2*sin(2*pi*sin((pi*t_time)/(2*T))^2))/T^2 + (4*pi^4*num*cos((pi*t_time)/(2*T))^2*sin(2*pi*num*sin((pi*t_time)/(2*T))^2)*sin((pi*t_time)/(2*T))^2)/T^2);
ddrz=-aa*((pi^3*cos((pi*t_time)/(2*T))^2*sin(2*pi*sin((pi*t_time)/(2*T))^2))/T^2 - (pi^3*sin((pi*t_time)/(2*T))^2*sin(2*pi*sin((pi*t_time)/(2*T))^2))/T^2 + (pi^3*cos((pi*t_time)/(2*T))^2*sin(2*pi*num*sin((pi*t_time)/(2*T))^2))/T^2 - (pi^3*sin(2*pi*num*sin((pi*t_time)/(2*T))^2)*sin((pi*t_time)/(2*T))^2)/T^2 + (4*pi^4*cos((pi*t_time)/(2*T))^2*sin((pi*t_time)/(2*T))^2*cos(2*pi*sin((pi*t_time)/(2*T))^2))/T^2 + (4*pi^4*num*cos(2*pi*num*sin((pi*t_time)/(2*T))^2)*cos((pi*t_time)/(2*T))^2*sin((pi*t_time)/(2*T))^2)/T^2);

r=[rx;ry;rz];
dr=[drx;dry;drz];           %对应的是文章中的r_dot
ddr=[ddrx;ddry;ddrz];
% r=kron([1;0],r);
% dr=kron([1;0],dr);
% ddr=kron([1;0],ddr);


% r=kron([1;0;0],r);
% dr=kron([1;0;0],dr);
% ddr=kron([1;0;0],ddr);

I1=1;


L=1;

Im=eye(3);
itt=floor(100*t+1);


A=kron(I1,Im);
B=kron(L,Im);

C=[eye(n);-eye(n)];%论文中Q

eta1=zeros(n,1);
eta2=zeros(n,1);
for i=1:1:n
    [x1,x2]=g1(q(i),FJX(i),ZJX(i),FVJX(i),ZVJX(i));
    eta1(i)=x1;
    eta2(i)=x2;
end

g=[eta2;-eta1];

doteta1=zeros(n,1);
doteta2=zeros(n,1);

for i=1:1:n
[x3,x4]=dotg(q(i),dq(i),FJX(i),ZJX(i),FVJX(i),ZVJX(i));
doteta1(i)=x3;
doteta2(i)=x4;
end

dg=[doteta2;-doteta1];


 [J1,DJ1]=DRRC_jdj1(pen_long,q1,dq1); 

 
 %%%%J1维度为3*6
J=J1;
DJ=DJ1;

s1=g-C*dq;
s=sqrt(lambda.*lambda+s1.*s1+10^(-5));

D1=diag(s1./s);

M12=-DJ'*(A)';
M21=-(A)*DJ-gamma*(A)*J;
V3=D1*dg-dg;

% M=[-gamma*eye(12),M12,zeros(2*n,2*p);
%    M21,zeros(2*m,2*m),zeros(2*m,2*p);
%    zeros(2*p,2*n),zeros(2*p,2*m),zeros(2*p,2*p)];
% M=[zeros(2*n,2*n),M12,zeros(2*n,2*p);
%    M21,zeros(2*m,2*m),zeros(2*m,2*p);
%    zeros(2*p,2*n),zeros(2*p,2*m),zeros(2*p,2*p)];
M=[zeros(n,n),M12,zeros(n,p);
   M21,zeros(m,m),zeros(m,p);
   zeros(p,n),zeros(p,m),zeros(p,p)];

v=[zeros(n,1);A*ddr+gamma*A*dr;V3];

%%%%%%%%%%%%%%%%%%%%%%%%%
J1=DRRC_J1(pen_long,q1);  



[x1,y1,z1,~]=DRRC_position1(pen_long,q1);
position1=[x1(7);y1(7);z1(7)];


F=position1;

J=J1;




% [x01,y01,z01,~]=DRRC_position1(pen_long,q10);
% position01=[x01(7);y01(7);z01(7)];






e1=dq+((A)*J)'*mu+C'*lambda;
e2=(A)*J*dq+gamma*(A)*F-gamma*A*r-A*dr;
e3=lambda+g-C*dq-s;

E=[e1;
   e2;
   e3];

%%%%%%%%%%%%%%%%%%%%%%%%%
% E_thta=kron(L,eye(6))*dq;

% I_21=eye(21);

%ner=norm(E,2);
%%%%%%%%%%
D2=diag(lambda./s);

W11=eye(6);
W12=J'*(A)';
W13=C';
W21=(A)*J;
W31=-C+D1*C;
W33=eye(p)-D2;

W=[W11,W12,W13;W21,zeros(m,m),zeros(m,p);W31,zeros(p,m),W33];
Wpinv=W^-1;
%%%%%%%%%%
aaa=[-10.0 0.9 0.3 0.8 0.2 0.8 0.8 0.9 0.8 0.2 0.1 0.3 0.3 0.2 0.3 0.7 0.8 0.6 0.1 0.4 0.2; 
0.9 -9.9 0.1 0.9 0.4 0.4 0.3 0.6 0.6 0.0 0.1 0.3 0.4 0.6 0.0 0.8 0.9 0.8 0.8 0.5 0.2; 
0.3 0.1 -10.4 1.0 0.7 0.2 0.5 1.0 0.9 0.6 0.2 0.3 0.5 0.3 0.5 0.3 0.7 0.4 0.3 0.6 0.3; 
0.8 0.9 1.0 -10.5 0.4 0.8 0.1 0.5 0.6 0.3 0.6 0.5 0.8 0.1 0.8 0.7 0.1 0.2 0.6 0.1 0.3;
0.2 0.4 0.7 0.4 -10.6 0.9 0.1 0.5 0.0 0.5 0.6 0.6 0.8 0.2 0.6 0.6 0.7 0.1 1.0 0.3 0.2; 
0.8 0.4 0.2 0.8 0.9 -9.1 0.1 0.8 0.1 0.7 0.1 0.0 0.1 0.9 0.1 0.4 0.1 0.8 0.4 0.8 0.3; 
0.8 0.3 0.5 0.1 0.1 0.1 -9.0 0.2 0.9 0.5 0.9 0.8 0.2 0.1 0.1 0.1 0.1 0.2 0.7 0.7 0.9; 
0.9 0.6 1.0 0.5 0.5 0.8 0.2 -11.7 0.5 0.5 0.7 0.6 0.4 0.2 0.8 0.8 0.6 0.4 0.8 0.1 0.7; 
0.8 0.6 0.9 0.6 0.0 0.1 0.9 0.5 -10.1 0.4 0.7 0.9 0.1 0.1 0.9 0.3 0.3 0.6 0.4 0.1 0.6; 
0.2 0.0 0.6 0.3 0.5 0.7 0.5 0.5 0.4 -8.4 0.1 0.3 0.5 0.4 0.5 0.6 0.7 0.2 0.7 0.1 0.2; 
0.1 0.1 0.2 0.6 0.6 0.1 0.9 0.7 0.7 0.1 -8.2 0.4 0.3 0.0 0.1 0.7 0.7 0.6 0.1 0.0 0.2; 
0.3 0.3 0.3 0.5 0.6 0.0 0.8 0.6 0.9 0.3 0.4 -10.5 0.2 0.9 0.8 0.1 0.6 0.5 0.9 0.4 0.1; 
0.3 0.4 0.5 0.8 0.8 0.1 0.2 0.4 0.1 0.5 0.3 0.2 -8.1 0.2 0.3 0.1 0.7 0.2 0.2 0.7 0.9; 
0.2 0.6 0.3 0.1 0.2 0.9 0.1 0.2 0.1 0.4 0.0 0.9 0.2 -8.5 0.3 0.5 0.2 0.8 0.3 0.7 0.7; 
0.3 0.0 0.5 0.8 0.6 0.1 0.1 0.8 0.9 0.5 0.1 0.8 0.3 0.3 -9.7 0.5 0.7 0.1 0.8 0.5 0.6; 
0.7 0.8 0.3 0.7 0.6 0.4 0.1 0.8 0.3 0.6 0.7 0.1 0.1 0.5 0.5 -9.9 1.0 0.3 0.5 0.1 0.3; 
0.8 0.9 0.7 0.1 0.7 0.1 0.1 0.6 0.3 0.7 0.7 0.6 0.7 0.2 0.7 1.0 -11.8 0.2 0.8 0.6 0.2; 
0.6 0.8 0.4 0.2 0.1 0.8 0.2 0.4 0.6 0.2 0.6 0.5 0.2 0.8 0.1 0.3 0.2 -8.6 0.4 0.1 0.6; 
0.1 0.8 0.3 0.6 1.0 0.4 0.7 0.8 0.4 0.7 0.1 0.9 0.2 0.3 0.8 0.5 0.8 0.4 -11.1 0.1 1.0; 
0.4 0.5 0.6 0.1 0.3 0.8 0.7 0.1 0.1 0.1 0.0 0.4 0.7 0.7 0.5 0.1 0.6 0.1 0.1 -7.5 0.2; 
0.2 0.2 0.3 0.3 0.2 0.3 0.9 0.7 0.6 0.2 0.2 0.1 0.9 0.7 0.6 0.3 0.2 0.6 1.0 0.2 -9.0 ]; 
%%%%%%MINN
dotyy=Wpinv*(-gamma1*exp(t)*E+M*y(n+1:2*n+m+p)+v+aaa*AFMlinear(E));
%%%%%%VPRNN
%dotyy=Wpinv*(-gamma1*exp(t)*AFMlinear(E)+M*y(n+1:2*n+m+p)+v);
t
doty=[dq;dotyy];

