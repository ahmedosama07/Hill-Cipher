function word = nums2letters(nums)
%nums2letters Summary of this function goes here
%   function returns letter corresponding to a number
word = char(round(nums) + double('A'));
end