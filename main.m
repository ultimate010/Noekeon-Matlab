%% Example Title
% Summary of example objective
clear
clc

k = hex2dec(['fe';'ff';'ff';'fa'; 'fe';'fe';'1f';'ff'; 'ff';'ff';'ff';'ff'; 'ff';'ff';'ff';'ff';]);
a = hex2dec(['fe';'fa';'ff';'fa'; 'fe';'fe';'1f';'ff'; 'ff';'ff';'ff';'ff'; 'ff';'ff';'ff';'ff';]);

test_func(k, a);

k = hex2dec(['00';'00';'00';'00'; '00';'00';'00';'00'; '00';'00';'00';'00'; '00';'00';'00';'00';]);
a = hex2dec(['00';'00';'00';'00'; '00';'00';'00';'00'; '00';'00';'00';'00'; '00';'00';'00';'00';]);

test_func(k, a);

k = hex2dec(['b1';'65';'68';'51'; '69';'9e';'29';'fa'; '24';'b7';'01';'48'; '50';'3d';'2d';'fc';]);
a = hex2dec(['2a';'78';'42';'1b'; '87';'c7';'d0';'92'; '4f';'26';'11';'3f'; '1d';'13';'49';'b2';]);

test_func(k, a);

% input_path=input('请输入待加密文件带文件名完整路径:','s');
% out_path =input('请输入加密后文件带文件名字完整路径:','s');

input_path = '/Users/nlp/temp/t.py';
out_path = '/Users/nlp/temp/t.py.enc';
dec_path = '/Users/nlp/temp/t.py.enc.bak';


fprintf('Now encrypting %s    to   %s\n', input_path, out_path);
encrypt_file(input_path, out_path, k);
fprintf('Now decrypting %s    to   %s\n', out_path, dec_path);
decrypt_file(out_path, dec_path, k);

fprintf('Done\n');


