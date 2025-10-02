function M=MatrixM(t,x)
A=0.1*[sin(t) cos(t); -cos(t) sin(t)]; 
B=0.1*[0.1*sin(t) 0; 0 0.2*cos(t)];
M=kron(eye(size(B)),A)-kron(B.',eye(size(A)));