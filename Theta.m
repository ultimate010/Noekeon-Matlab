function [ output_state ] = Theta( keystruct, state )
%THETA Summary of this function goes here
%   Detailed explanation goes here
output_state = state;
%keyboard
% tmp  = a[0]^a[2];
tmp  = bitxor(output_state(1), output_state(3), 'uint32');

% tmp ^= ROTL32(tmp,8)^ROTL32(tmp,24);
tmp = bitxor(tmp, bitxor(ROTL32(tmp, 8), ROTL32(tmp, 24), 'uint32'), 'uint32');

% a[1]^= tmp;
output_state(2) = bitxor(output_state(2), tmp, 'uint32');

% a[3]^= tmp;
output_state(4) = bitxor(output_state(4), tmp, 'uint32');

% a[0] ^= k[0]; a[1] ^= k[1]; a[2] ^= k[2]; a[3] ^= k[3];
output_state(1) = bitxor(output_state(1), keystruct(1), 'uint32');
output_state(2) = bitxor(output_state(2), keystruct(2), 'uint32');
output_state(3) = bitxor(output_state(3), keystruct(3), 'uint32');
output_state(4) = bitxor(output_state(4), keystruct(4), 'uint32');

% tmp  = a[1]^a[3];
tmp = bitxor(output_state(2), output_state(4), 'uint32');

% tmp ^= ROTL32(tmp,8)^ROTL32(tmp,24);
tmp = bitxor(tmp, bitxor(ROTL32(tmp, 8), ROTL32(tmp, 24), 'uint32'), 'uint32');

% a[0]^= tmp;
output_state(1) = bitxor(output_state(1), tmp, 'uint32');

% a[2]^= tmp;
output_state(3) = bitxor(output_state(3), tmp, 'uint32');

end

