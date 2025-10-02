function output=DiffM(t,x)
%syms u; DM=diff(MatrixM(u)); 
%u=t; output=eval(DM);
output=0.1*[9/10*cos(t) -sin(t) 0 0;sin(t) 9/10*cos(t) 0 0;0 0 cos(t)+1/5*sin(t) -sin(t);0 0 sin(t) cos(t)+1/5*sin(t)];