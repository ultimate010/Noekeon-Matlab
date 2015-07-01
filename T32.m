function [ output_args ] = T32( input_args )
%T32 Summary of this function goes here
%   Detailed explanation goes here

output_args = uint32(bitand(input_args, hex2dec('ffffffff'), 'uint32'));

end

