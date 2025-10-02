function [t,error]=LinearNormError(x0,gamma)
error=zeros(10,501);

gamma=5;
x0=[6 6 6 6];
tspan=[0:0.01:5]; 
options=odeset('Mass',@MatrixM,'MStateDep','none');

[t,x]=ode45(@ZNNRightHandSide,tspan,x0,options,gamma);
Xstar=10*[sin(t) cos(t) -cos(t) sin(t)]'; 
err2=x'-Xstar; total=length(t);
for i=1:total, nerr1(i)=norm(err2(:,i)); end

plot(t,nerr1,'b','linewidth',1.5);hold on

error=nerr1;
t=t';