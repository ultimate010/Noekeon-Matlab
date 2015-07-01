function [ output_state ] = Round( keystruct,state,RC1,RC2 )
%ROUND Summary of this function goes here
%   Detailed explanation goes here
output_state = state;  % copy
% a[0] ^= RC1;
output_state(1) = bitxor(output_state(1), uint32(RC1), 'uint32');
% Theta(k,a);
output_state =  Theta(keystruct, output_state);
% a[0] ^= RC2;
output_state(1) = bitxor(output_state(1), uint32(RC2), 'uint32');
% Pi1(a);
output_state =  Pi1(output_state);
% Gamma(a);
output_state =  Gamma(output_state);
% Pi2(a);
output_state =  Pi2(output_state);

end

