function decrypted_plaintext_letters = hill_decrypt(ciphertext_numbers, key)
% Hill_Decrypt
% brief : this function implements the hill cipher decryption algorithm
% param : 2 parameters: text to be decrypted and the encryption key
% return: 1 value: plainletter

    % Decrypt the ciphertext
    modulus = 26;
    n = size(key, 1);
    letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    inverse_key = mod(inv(key), modulus);
    decrypted_plaintext_numbers = mod(inverse_key * reshape(ciphertext_numbers, n, []), modulus);

    % Round the decrypted plaintext numbers to the nearest integer
    decrypted_plaintext_numbers = round(decrypted_plaintext_numbers);

    % Check that all decrypted plaintext numbers are non-negative
    if any(decrypted_plaintext_numbers < 0)
        error("Invalid key or ciphertext");
    end

    % Convert the decrypted plaintext to letters
    decrypted_plaintext_letters = letters(decrypted_plaintext_numbers+1);
end