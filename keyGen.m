function key = keyGen(n)
%keyGen Summary of this function goes here
%   key generator function
base = 26;
t = 1;
while t
    key = randi([0 26], n);
    t = isnan(multInverse(int32(det(key)), base));
end
end