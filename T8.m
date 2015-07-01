function [ output_args ] = T8( input_args )
%T8 Summary of this function goes here
%   Detailed explanation goes here

output_args = uint8(bitand(uint32(input_args), uint32(hex2dec('ff')), 'uint32'));

end

