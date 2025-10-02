function ALL=DRRC_matrixALL(~,y)

global n m alpha_i a_i d_i D sa ca s2a c2a pen_long p ZJX FJX ZVJX FVJX L

q1=y(1:n);
q2=y(n+1:n+n);
dq1=y(2*n+1:3*n);
dq2=y(3*n+1:4*n);

lambda=y(4*n+2*m+1:4*n+2*m+2*p);
q=[q1;q2];
dq=[dq1;dq2];

J1=DRRC_J1(alpha_i,a_i,d_i,D,sa,ca,s2a,c2a,pen_long,q1);  
J2=DRRC_J2(alpha_i,a_i,d_i,D,sa,ca,s2a,c2a,pen_long,q2);  

J=[J1,zeros(3,6);
  zeros(3,6),J2];


I1=[1,0;0,0];
L=[1,-1;-1,1];
Im=eye(3);

A=kron(I1,Im);
B=kron(L,Im);

C=[eye(12);-eye(12)];

eta1=zeros(2*n,1);
eta2=zeros(2*n,1);
for i=1:1:12
    [x1,x2]=g1(q(i),FJX(i),ZJX(i),FVJX(i),ZVJX(i));
    eta1(i)=x1;
    eta2(i)=x2;
end

g=[eta2;-eta1];

s1=g-C*dq;
s=sqrt(lambda.*lambda+s1.*s1+10^(-5));

D1=diag(s1./s);
D2=diag(lambda./s);

W11=eye(12);
W12=J'*(A+B)';
W13=C';
W21=(A+B)*J;
W31=-C+D1*C;
W33=eye(2*p)-D2;
W41=kron(L,eye(6));


W=[W11,W12,W13;W21,zeros(2*m,2*m),zeros(2*m,2*p);W31,zeros(2*p,2*m),W33;W41,zeros(2*n,2*m),zeros(2*n,2*p)];

ALL=[eye(2*n,2*n),zeros(2*n,2*n+2*m+2*p);zeros(2*n+2*m+2*p+2*n,2*n),W];
% ALL=[kron(L,eye(6)),zeros(2*n,2*n+2*m+2*p);zeros(2*n+2*m+2*p,2*n),W];

end