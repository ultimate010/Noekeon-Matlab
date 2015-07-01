function [ output_args ] = NESSIEkeysetup( input_args )
%NESSIEKEYSETUP Summary of this function goes here
%   Detailed explanation goes here
output_args(1) = U8TO32_BIG(input_args(1:4));
output_args(2) = U8TO32_BIG(input_args(5:8));
output_args(3) = U8TO32_BIG(input_args(9:12));
output_args(4) = U8TO32_BIG(input_args(13:16));
end

