function [ output_args ] = U32TO8_BIG(v )
%U32TO8_BIG Summary of this function goes here
%   Detailed explanation goes here
% u32 x = (v); \

% d[0] = T8(x >> 24); \
% d[1] = T8(x >> 16); \
% d[2] = T8(x >> 8); \
% d[3] = T8(x); \

% u8 *d = (c); \
output_args = zeros(4,1);

output_args(1) = T8(bitshift(v, -24, 'uint32'));
output_args(2) = T8(bitshift(v, -16, 'uint32'));
output_args(3) = T8(bitshift(v, -8, 'uint32'));
output_args(4) = T8(v);
end

