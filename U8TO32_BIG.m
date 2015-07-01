function [ output_args ] = U8TO32_BIG( input_args )
%U8TO32_BIG Summary of this function goes here
%   Detailed explanation goes here

t1 = bitshift(uint32(T8(uint8(input_args(1)))),24, 'uint32');
t2 = bitshift(uint32(T8(uint8(input_args(2)))),16, 'uint32');
t3 = bitshift(uint32(T8(uint8(input_args(3)))),8, 'uint32');
t4 = uint32(T8(uint8(input_args(4))));
output_args = bitor(t1, t2, 'uint32');
output_args = bitor(output_args, t3, 'uint32');
output_args = bitor(output_args, t4, 'uint32');
output_args = uint32(output_args);
end

