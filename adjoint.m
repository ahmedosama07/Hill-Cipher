function X = adjoint(A)
%ADJOINT   Adjoint of the square matrix A.
%   omputes adjoint matrix of a given matrix

% check input is a matrix
if ~ismatrix(A)
     error(message('Input Must Be Square')); 
end

% obtain dimensions of input
[m,n] = size(A);     
% check input is square
if m~=n 
    error(message('symbolic:sym:InputMustBeSquare')); 
end

[u,s,v] = svd(A);

% compute adjoint of the diagonal matrix s exploiting diagonal property
adjs=zeros(1,n);
for i=1:n
    sdiag=diag(s);
    sdiag(i)=1;
    adjs(i)=prod(sdiag);
end

adjs=diag(adjs); % create a matrix from the diagonal values
X = det(u*v')*v*adjs*u';
    
end
