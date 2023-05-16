function [ciphertext_letters ciphertext_numbers] = hill_encrypt(plaintext, key)
% Hill_Encrypt
% brief : this function implements the hill cipher encryption algorithm
% param : 2 parameters: text to be encrypted and the encryption key
% return: 2 values: ciphertext letters and numbers

    % Convert the plaintext to numbers
plaintext_numbers = double(plaintext) - 65;

% Define the modulo value
modulus = 26;

% Define the mapping from numbers to letters
letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

% Encrypt the plaintext
n = size(key, 1);
ciphertext_numbers = mod(key * reshape(plaintext_numbers, n, []), modulus);

% Convert the ciphertext to letters
ciphertext_letters = letters(ciphertext_numbers+1);

end