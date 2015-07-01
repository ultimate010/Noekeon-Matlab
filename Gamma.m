function [ output_state ] = Gamma( state )
%GAMMA Summary of this function goes here
%   Detailed explanation goes here
output_state = state;
% a[1] ^= ~a[3] & ~a[2];
t1 = bitxor(output_state(4), hex2dec('ffffffff'), 'uint32');
t2 = bitxor(output_state(3), hex2dec('ffffffff'), 'uint32');
output_state(2) = bitxor(output_state(2), bitand(t1, t2, 'uint32'),'uint32');

% a[0] ^=   a[2] & a[1];
output_state(1) = bitxor(output_state(1), bitand(output_state(3), output_state(2),'uint32'), 'uint32');

% tmp   = a[3];
tmp = output_state(4);

% a[3]  = a[0];
output_state(4) = output_state(1);

%  a[0]  = tmp;
output_state(1) = tmp;

% a[2] ^= a[0]^a[1]^a[3];
output_state(3) = bitxor(output_state(3), bitxor(output_state(4), bitxor(output_state(1), output_state(2), 'uint32'), 'uint32'), 'uint32');

% a[1] ^= ~a[3] & ~a[2];
t1 = bitxor(output_state(4), hex2dec('ffffffff'), 'uint32');
t2 = bitxor(output_state(3), hex2dec('ffffffff'), 'uint32');
output_state(2) = bitxor(output_state(2), bitand(t1, t2, 'uint32'),'uint32');

% a[0] ^=   a[2] & a[1];
output_state(1) = bitxor(output_state(1), bitand(output_state(3), output_state(2), 'uint32'),'uint32');


end

