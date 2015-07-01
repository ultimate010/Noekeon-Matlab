function [ output_args ] = disp_vec( input_args )
%DISP_VEC Summary of this function goes here
%   Detailed explanation goes here
len = size(input_args, 1);
str = sprintf('%s', dec2hex(input_args(1)));
for i = 2:len
    str = sprintf('%s,%s', str, dec2hex(input_args(i)));
end
output_args = str;
end

