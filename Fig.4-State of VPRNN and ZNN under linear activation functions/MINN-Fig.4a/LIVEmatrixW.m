function X=LIVEmatrixW(t)
% P=[0.5*sin(t)+2  cos(t); cos(t)  0.5*cos(t)+2];% Hessian matrix, which is positive definite
% A=[sin(4*t) cos(4*t)]; %Linear constrained matrix
% O=zeros(1);
% M=[P A';A O];
X=[cos(t)+3  sin(t) cos(3*t) 1 0 -1 0
    sin(t) cos(t)+3 sin(3*t) 0 1 0 -1
   cos(3*t)  sin(3*t) 0 0 0 0 0
   -1 0 0 1 0 0 0
   0 -1 0 0 1 0 0
   1 0 0 0 0 1 0
   0 1 0 0 0 0 1]; 
%  M=[0.5*sin(t)+2  cos(t) 0; cos(t)  0.5*cos(t)+2 0; 0 0 0]; % ·´Àý