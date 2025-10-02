function [m,n] = g1(x,joint1,joint2,velocity1,velocity2)
x;
velocity1=0.98*velocity1;
velocity2=0.98*velocity2;
a=joint1*5/6;
b=joint2*5/6;
c=joint1-a;
d=joint2-b;
m = velocity1*((a<=x) & (x<=joint2))+ velocity1*(1-(sin(0.5*pi*(sin(0.5*pi*(x-a)/c))^2))^2)*((joint1<=x) & (x<a));
n =  velocity2*((joint1<=x) & (x<=b))+ velocity2*(1-(sin(0.5*pi*(sin(0.5*pi*(x-b)/d))^2))^2)*((b<x) & (x<=joint2));
end