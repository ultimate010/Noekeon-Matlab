function [ output_args ] = ROTL32( v, n )
%ROTL32 Summary of this function goes here
%   Detailed explanation goes here

% #define ROTL32(v, n)   (T32((v) << (n)) | ((v) >> (32 - (n))))
output_args = bitor(T32(bitshift(v, n, 'uint32')), bitshift(v,(n - 32), 'uint32'), 'uint32');

end

