function output=MINNRightHandSide(t,x,gamma)
if nargin==2, 
    gamma=5; end
C=MatrixC(t); [m,n]=size(C); dotC=DiffC(t,x);
vecC=reshape(C,m*n,1); vecDotC=reshape(dotC,m*n,1);
M=MatrixM(t,x); dotM=DiffM(t,x); 
aaa=[-4 0.3 0.2 0.5
     0.3 -4 0.1 0.6
     0.2 0.1 -4 0.4
     0.5 0.6 0.4 -4];
output=-dotM*x-gamma*(M*x+vecC)-vecDotC+aaa*AFPower(M*x+vecC);
% Power-sigmoid activation-function mapping is used as an example.