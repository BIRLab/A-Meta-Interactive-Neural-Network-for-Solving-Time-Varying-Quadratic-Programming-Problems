function E=DRRC_Ematrix(y,r,dr)

global n m alpha_i a_i d_i D sa ca s2a c2a pen_long p gamma q10 q20 q30 q40 q50 ZJX FJX ZVJX FVJX L I1;

q1=y(1:n);
q2=y(n+1:2*n);
q3=y(2*n+1:3*n);
dq1=y(3*n+1:4*n);
dq2=y(4*n+1:5*n);
dq3=y(5*n+1:6*n);
mu=y(6*n+1:6*n+3*m);
lambda=y(6*n+3*m+1:6*n+3*m+3*p);
q=[q1;q2;q3];
dq=[dq1;dq2;dq3];

J1=DRRC_J1(pen_long,q1);  
J2=DRRC_J2(pen_long,q2);  
J3=DRRC_J3(pen_long,q3);  

[x1,y1,z1,~]=DRRC_position1(pen_long,q1);
position1=[x1(7);y1(7);z1(7)];
[x2,y2,z2,~]=DRRC_position2(pen_long,q2);
position2=[x2(7);y2(7);z2(7)];
[x3,y3,z3,~]=DRRC_position3(pen_long,q3);
position3=[x3(7);y3(7);z3(7)];


F=[position1;position2;position3];

J=[J1,zeros(3,6),zeros(3,6);
  zeros(3,6),J2,zeros(3,6);
  zeros(3,6),zeros(3,6),J3];


Im=eye(3);

A=kron(I1,Im);
B=kron(L,Im);

C=[eye(3*n);-eye(3*n)];

eta1=zeros(3*n,1);
eta2=zeros(3*n,1);
for i=1:1:3*n
    [x1,x2]=g1(q(i),FJX(i),ZJX(i),FVJX(i),ZVJX(i));
    eta1(i)=x1;
    eta2(i)=x2;
end

g=[eta2;-eta1];

s1=g-C*dq;
s=sqrt(lambda.*lambda+s1.*s1+10^(-5));
%%%%%%%%%%%%%%%%%%%
[x01,y01,z01,~]=DRRC_position1(pen_long,q10);
position01=[x01(7);y01(7);z01(7)];
[x02,y02,z02,~]=DRRC_position2(pen_long,q20);
position02=[x02(7);y02(7);z02(7)];
[x03,y03,z03,~]=DRRC_position3(pen_long,q30);
position03=[x03(7);y03(7);z03(7)];


d1=2*position01-position02-position03;
d2=position02-position01;
d3=position03-position01;
d=[d1;d2;d3];

e1=dq+((A+B)*J)'*mu+C'*lambda;
e2=(A+B)*J*dq+gamma*(A+B)*F-gamma*A*r-A*dr-gamma*d;
e3=lambda+g-C*dq-s;
e4=kron(L,eye(6))*dq;

E=[e1;
   e2;
   e3;
   e4];
end
