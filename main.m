clc;
clear all;
% Prompt the user for the key
key = input("Enter the key matrix (e.g. [3 4; 2 3]): ");

% Check that the key is a square matrix
if ~ismatrix(key) || size(key, 1) ~= size(key, 2)
    error("Key must be a square matrix");
end

% Prompt the user for the plaintext
plaintext = upper(input("Enter the plaintext (letters only): ", 's'));

% Check that the length of the plaintext matches the dimension of the key
n = size(key, 1);
if mod(length(plaintext), n) ~= 0
    error("Length of plaintext is not a multiple of the key dimension");
end

[ciphertext_letters ciphertext_numbers] = hill_encrypt(plaintext, key);
decrypted_plaintext_letters = hill_decrypt(ciphertext_numbers, key);
% Print the results
fprintf("Plaintext: %s\n", plaintext);
fprintf("Ciphertext: %s\n", ciphertext_letters);
fprintf("Decrypted plaintext: %s\n", decrypted_plaintext_letters);