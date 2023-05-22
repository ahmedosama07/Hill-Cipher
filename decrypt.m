function p = decrypt(c, k)
%decrypt Summary of this function goes here
%   function for Hill cipher decryption
base = 26;
c = letters2num(c);
kInv = mod(multInverse(det(k), base) * mod(adjoint(k), base), base);

m = size(k, 2);
n = size(c, 2) / m;

p = zeros(size(c));

for i = 1 : n
    tmp = mod(c(((i - 1) * m + 1) : i * m) * kInv, base);
    p(((i - 1) * m + 1) : i * m) = tmp;
end
p = nums2letters(p);
end