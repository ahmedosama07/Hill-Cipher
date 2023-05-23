function key = keyGen(n)
%keyGen Summary of this function goes here
%   key generator function
base = 26;
t = 0;
while t ~= 1
    k = randi([0 26], n);
    t = gcd(int32(det(k)), base);
end
key = k;
end