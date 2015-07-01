function [ output_state ] = CommonLoop(keystruct, state, RC1, RC2)
%COMMONLOOP Summary of this function goes here
%   Detailed explanation goes here
output_state = state;
NROUND = 16;    
% for(i=0 ; i<NROUND ; i++) {
for c = 1:NROUND
% Round(k,a,RC1,RC2);
    output_state = Round(keystruct,output_state,RC1,RC2);
% RCShiftRegFwd(&RC1);
    RC1 = RCShiftRegFwd(RC1);
% RCShiftRegBwd(&RC2);
    RC2 = RCShiftRegBwd(RC2);
end
% a[0]^=RC1;

output_state(1) =  bitxor(output_state(1), uint32(RC1), 'uint32');
% Theta(k,a);
output_state = Theta(keystruct,output_state);
% a[0]^=RC2;
output_state(1) = bitxor(output_state(1), uint32(RC2), 'uint32');
end

