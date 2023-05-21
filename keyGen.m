function key = keyGen(n)
%keyGen Summary of this function goes here
%   key generator function
key = randi([0 26], n,'uint8');
end