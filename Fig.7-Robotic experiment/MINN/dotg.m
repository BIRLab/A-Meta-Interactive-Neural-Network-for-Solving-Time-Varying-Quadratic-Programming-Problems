function [m,n] = g2(x,dotx,joint1,joint2,velocity1,velocity2)
dotx;
velocity1=0.98*velocity1;
velocity2=0.98*velocity2;
a=joint1*5/6;
b=joint2*5/6;
c=joint1-a;
d=joint2-b;
m = 0*((a<=x)&(x<=joint2))  -velocity1*(pi^2)*sin(0.5*pi*(sin(0.5*pi*(x-a)/c))^2)*cos(0.5*pi*(sin(0.5*pi*(x-a)/c))^2)*(sin(0.5*pi*(x-a)/c))*(cos(0.5*pi*(x-a)/c))*dotx*((joint1<=x)&(x<a))/c;
n=  0*((joint1<=x) & (x<=b))  -velocity2*(pi^2)*sin(0.5*pi*(sin(0.5*pi*(x-b)/d))^2)*cos(0.5*pi*(sin(0.5*pi*(x-b)/d))^2)*(sin(0.5*pi*(x-b)/d))*(cos(0.5*pi*(x-b)/d))*dotx*((b<x)&(x<=joint2))/d;
end