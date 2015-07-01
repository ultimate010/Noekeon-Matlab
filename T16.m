function [ output_args ] = T16( input_args )
%T16 Summary of this function goes here
%   Detailed explanation goes here

output_args = uint16(bitand(input_args, hex2dec('ffff'), 'uint32'));

end

