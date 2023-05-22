function K = multInverse(determinant, base)
%multInverse Summary of this function goes here
%   function calculates multiplicative inverse of a number using Extended
%   Euclidean Algorithm
if numel(base) ~= 1
  error('base must be a scalar')
end
K = NaN(size(determinant));

[G,C] = gcd(round(determinant), base);
m = G == 1;
K(m) = mod(C(m), base);
end