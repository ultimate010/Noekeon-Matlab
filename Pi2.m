function [ output_state ] = Pi2( state )
%PI2 Summary of this function goes here
%   Detailed explanation goes here
output_state = state;
% a[1] = ROTL32 (a[1], 31);
output_state(2) = ROTL32(output_state(2), 31);
% a[2] = ROTL32 (a[2], 27);
output_state(3) = ROTL32(output_state(3), 27);
% a[3] = ROTL32 (a[3], 30);
output_state(4) = ROTL32(output_state(4), 30);
end

