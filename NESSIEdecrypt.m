function [ plaintext ] = NESSIEdecrypt( keystruct, ciphertext)
%NESSIEDECRYPT Summary of this function goes here
%   Detailed explanation goes here
RC2DECRYPTSTART = T8(hex2dec('D4'));
state = zeros(4, 1);
% state[0]=U8TO32_BIG(ciphertext   );
state(1) = U8TO32_BIG(ciphertext(1:4));
% state[1]=U8TO32_BIG(ciphertext+4 );
state(2) = U8TO32_BIG(ciphertext(5:8));
% state[2]=U8TO32_BIG(ciphertext+8 );
state(3) = U8TO32_BIG(ciphertext(9:12));
% state[3]=U8TO32_BIG(ciphertext+12);
state(4) = U8TO32_BIG(ciphertext(13:16));


% k[0]=kencrypt[0];
% k[1]=kencrypt[1];
% k[2]=kencrypt[2];
% k[3]=kencrypt[3];
k = keystruct;
% Theta(NullVector,k);
k = Theta(zeros(4,1), k);

%  CommonLoop (k,state,0,RC2DECRYPTSTART);
state = CommonLoop(k, state, 0, RC2DECRYPTSTART);

plaintext = zeros(16, 1);
% U32TO8_BIG(plaintext   , state[0]);
plaintext(1:4) = U32TO8_BIG(state(1));
plaintext(5:8) = U32TO8_BIG(state(2));
plaintext(9:12) = U32TO8_BIG(state(3));
plaintext(13:16) = U32TO8_BIG(state(4));
end

