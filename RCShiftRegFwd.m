function [ output_args ] = RCShiftRegFwd( input_args )
%RCSHIFTREGFWD Summary of this function goes here
%   Detailed explanation goes here
% if ((*RC)&0x80) (*RC)=((*RC)<<1) ^ 0x1B; else (*RC)<<=1;
output_args = input_args;
if bitand(hex2dec('80'), output_args, 'uint8') ~= 0
    % (*RC)=((*RC)<<1) ^ 0x1B;
    output_args = bitxor(bitshift(output_args, 1, 'uint8'), hex2dec('1B'), 'uint8');
else
    % (*RC)<<=1;
    output_args = bitshift(output_args, 1, 'uint8'); 
end

end

