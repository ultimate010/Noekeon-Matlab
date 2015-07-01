function [ output_args ] = test_func( k, a )
%TEST_FUNC Summary of this function goes here
%   Detailed explanation goes here
keystruct = NESSIEkeysetup(k);
encoded = NESSIEencrypt(keystruct, a);
decoded = NESSIEdecrypt(keystruct, encoded);


fprintf('====================== The Noekeon algorithm test ======================\n');
fprintf('                     k = %s\n', disp_vec(k));
fprintf('                     a = %s\n', disp_vec(a));
fprintf('after NESSIEencrypt, b = %s\n',disp_vec(encoded));
fprintf('after NESSIEdecrypt, a = %s\n',disp_vec(decoded));


assert(sum(a - decoded) == 0, 'There is a bug');

fprintf('Pass test\n\n');

end


