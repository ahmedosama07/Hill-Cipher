function X = adjoint(A)
%ADJOINT   Adjoint of the square matrix A.
%   X = ADJOINT(A) computes a matrix X of the same dimensions
%   as A such that A*X = det(A)*eye(n) = X*A, where n is the number
%   of rows of A.
%
%   Example:
%      X = adjoint(hilb(5))
%
%   See also SYM/ADJOINT, DET, INV, RANK.

%   Copyright 2018-2019 The MathWorks, Inc.

% check number of arguments is 1
narginchk(1,1);

if ~(isa(A,'single') || isa(A,'double'))
     error(message('symbolic:sym:adjoint:MustBeSingleDoubleOrSym')); 
end

% check input is a matrix
if ~ismatrix(A)
     error(message('symbolic:sym:InputMustBeSquare')); 
end

% obtain dimensions of input
[m,n] = size(A);     
% check input is square
if m~=n 
    error(message('symbolic:sym:InputMustBeSquare')); 
end
% The method is to compute the singular value decomposition, X =
% u*s*v' then use the product property of the adjoint
% adj(A*B)=adj(B)*adj(A) to reduce the calculation to smaller pieces.
% u,v are unitary so their inverse is the conjugate transpose.
% adj(A)=det(A)*inv(A) and det(AB)=det(A)*det(B)
% elementary use of these properties proves an identity used below.

[u,s,v] = svd(A);

% compute adjoint of the diagonal matrix s exploiting diagonal property
adjs=zeros(1,n);
for i=1:n
    sdiag=diag(s);
    sdiag(i)=1;
    adjs(i)=prod(sdiag);
end

adjs=diag(adjs); % create a matrix from the diagonal values
X = det(u*v')*v*adjs*u'; % an identity that can be proven by elementary manipulations
    
end
