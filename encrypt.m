function [c, k] = encrypt(text)
%encrypt Summary of this function goes here
%   function for Hill cipher encryption
plainText = cleanText(text);
p = letters2num(plainText);
factors = factor(size(p, 2));
m = factors(1);
n = size(p, 2) / m;
k = keyGen(m);
base = 26;

c = zeros(size(p));

for i = 1 : n
    tmp = mod(p(((i - 1) * m + 1) : i * m) * k, base);
    c(((i - 1) * m + 1) : i * m) = tmp;
end
c = nums2letters(c);
end