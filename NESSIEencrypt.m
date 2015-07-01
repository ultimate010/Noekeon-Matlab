function [ ciphertext ] = NESSIEencrypt( keystruct, plaintext)
%NESSIEENCRYPT Summary of this function goes here
%   Detailed explanation goes here
RC1ENCRYPTSTART = T8(hex2dec('80'));

state = zeros(4, 1);
state(1) = U8TO32_BIG(plaintext(1:4));
state(2) = U8TO32_BIG(plaintext(5:8));
state(3) = U8TO32_BIG(plaintext(9:12));
state(4) = U8TO32_BIG(plaintext(13:16));

state = CommonLoop(keystruct, state, RC1ENCRYPTSTART, 0);

ciphertext = zeros(16, 1);
ciphertext(1:4) = U32TO8_BIG(state(1));
ciphertext(5:8) = U32TO8_BIG(state(2));
ciphertext(9:12) = U32TO8_BIG(state(3));
ciphertext(13:16) = U32TO8_BIG(state(4));

end

