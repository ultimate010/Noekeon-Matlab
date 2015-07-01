function [ output_state ] = Pi1( state )
%PI1 Summary of this function goes here
%   Detailed explanation goes here
output_state = state;
% a[1] = ROTL32 (a[1], 1);                                                                                                                 |||     Gamma
output_state(2) = ROTL32(output_state(2), 1);
% a[2] = ROTL32 (a[2], 5);                   
output_state(3) = ROTL32(output_state(3), 5);
% a[3] = ROTL32 (a[3], 2);
output_state(4) = ROTL32(output_state(4), 2);
end

