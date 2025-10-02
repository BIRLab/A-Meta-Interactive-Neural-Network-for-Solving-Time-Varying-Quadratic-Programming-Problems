function output=ZNNRightHandSide(t,x,gamma)
if nargin==2, 
    gamma=5; end
C=MatrixC(t); [m,n]=size(C); dotC=DiffC(t,x);
vecC=reshape(C,m*n,1); vecDotC=reshape(dotC,m*n,1);
M=MatrixM(t,x); dotM=DiffM(t,x); 
output=-dotM*x-gamma*AFSwish(M*x+vecC)-vecDotC;
% Power-sigmoid activation-function mapping is used as an example.