function y=MINN_con_righthandside(t,x,gamma)
global  ZJX ZJXX eMINN 
qq1=x(1);
qq2=x(2);
lambda=x(3);
mu=x(4:7);

if qq1>ZJXX
    q1=ZJXX;
elseif qq1<-ZJXX
    q1=-ZJXX;
else
    q1=qq1;
end

if qq2>ZJXX
    q2=ZJXX;
elseif qq2<-ZJXX
    q2=-ZJXX;
else
    q2=qq2;  
end
q=[q1;q2];
qq=[q1;q2;x(3);x(4:7)];

A=[cos(t)+4  sin(t)
       sin(t) cos(t)+4];
C=[cos(2*t)  sin(2*t)];

P=[1 0
   0 1
   -1 0
   0 -1];

Psi=[-sin(t) cos(t) -2*sin(2*t) 0 0 0 0
   cos(t) -sin(t) 2*cos(2*t) 0 0 0 0
   -2*sin(2*t) 2*cos(2*t) 0 0 0 0 0
   0 0 0 0 0 0 0
   0 0 0 0 0 0 0
   0 0 0 0 0 0 0
   0 0 0 0 0 0 0]; 

Upsilon=[-2*sin(2*t)
   cos(t)
   -6*cos(6*t)
   0
   0
   0
   0];

Xi=[cos(t)+4  sin(t) cos(2*t) 1 0 -1 0
    sin(t) cos(t)+4 sin(2*t) 0 1 0 -1
   cos(2*t)  sin(2*t) 0 0 0 0 0
   -1 0 0 1 0 0 0
   0 -1 0 0 1 0 0
   1 0 0 0 0 1 0
   0 1 0 0 0 0 1]; 


phi=ZJX-P*q;
psi=sqrt(phi.*phi+mu.*mu+10^(-7));
Phi=[cos(2*t)
   sin(t)
    -sin(6*t)
    ZJX-psi];

M=phi./psi;
M1=diag(M);
M2=diag(mu./psi);

Theta=[A,C',P';
    C,zeros(1,5);
    M1*P-P,zeros(4,1),eye(4)-M2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aaa=[-2.2 0.5 0.2 0.2 0.3 0.4 0.1;
     0.5 -3.1 0.4 0.8 0.2 0.1 0.3;
     0.2 0.4 -4.5 0.6 0.4 0.5 0.2;
     0.2 0.8 0.6 -3.4 0.2 0.3 0.4;
     0.3 0.2 0.4 0.2 -4.2 0.5 0.7; 
     0.4 0.1 0.5 0.3 0.5 -5.6 0.8;
     0.1 0.3 0.2 0.4 0.7 0.8 -4.2]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=Theta^-1*(-(Psi+errormatrixD(t))*qq-gamma*exp(t)*(Xi*qq+Phi)-Upsilon+errorvectorm(t)+aaa*AFSwish(Xi*qq+Phi));

% t
err=Xi*qq+Phi;
tt=floor(100*t+1);
eMINN {tt}=[err(1);err(2)];
 