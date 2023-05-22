function num = letters2num(word)
%letters2num Summary of this function goes here
%   function returns the numerical value of letters
num = double(upper(word)) - double('A');
end