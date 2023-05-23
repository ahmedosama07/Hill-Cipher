function key = keyGen(n)
%keyGen Summary of this function goes here
%   key generator function
base = 26;
t = 1;
while t ~= 1
    key = randi([0 26], n);
    t = gcd(det(key), base);
end
end