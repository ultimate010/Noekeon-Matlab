function [ output_args ] = RCShiftRegBwd( input_args )
%RCSHIFTREGBWD Summary of this function goes here
%   Detailed explanation goes here
% if ((*RC)&0x01) (*RC)=((*RC)>>1) ^ 0x8D; else (*RC)>>=1;
output_args = input_args;
if bitand(hex2dec('1'), output_args, 'uint8') ~= 0
    % (*RC)=((*RC)>>1) ^ 0x8D;
    output_args = bitxor(bitshift(output_args, -1, 'uint8'), hex2dec('8D'), 'uint8');
else
    % (*RC)>>=1;
    output_args = bitshift(output_args, -1, 'uint8'); 
end

end

