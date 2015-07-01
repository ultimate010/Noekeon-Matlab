function [ output_args ] = encrypt_file( input_path, out_path, k )
%ENCRYPT_FILE Summary of this function goes here
%   Detailed explanation goes here
keystruct = NESSIEkeysetup(k);
% encoded = NESSIEencrypt(keystruct, a);
% decoded = NESSIEdecrypt(keystruct, encoded);


[in_fileID,errmsg] = fopen(input_path, 'rb');
assert(in_fileID > 0, errmsg);
data = fread(in_fileID);
fclose(in_fileID);
len = numel(data);
yushu = rem(len, 16);
tianchong = 16 - yushu; %余数不为0，需要填充
if tianchong ~= 0
   data = [data; zeros(tianchong, 1)];
end
batch = numel(data) / 16;

[out_fileID,errmsg] = fopen(out_path, 'w');
assert(out_fileID > 0, errmsg);

fwrite(out_fileID,len, 'uint64');
fwrite(out_fileID,tianchong, 'uint64');
for i = 0:(batch - 1)
    start = i * 16;
    encoded = NESSIEencrypt(keystruct, data(start + 1:start + 16));
    fwrite(out_fileID,encoded,'uint8');     
end
fclose(out_fileID);
end

