function [ output_args ] = decrypt_file( input_path, out_path, k )
%DECRYPT_FILE Summary of this function goes here
%   Detailed explanation goes here
keystruct = NESSIEkeysetup(k);
% encoded = NESSIEencrypt(keystruct, a);
% decoded = NESSIEdecrypt(keystruct, encoded);


[in_fileID,errmsg] = fopen(input_path, 'rb');
assert(in_fileID > 0, errmsg);
len = fread(in_fileID, 1, 'uint64');
tianchong = fread(in_fileID, 1, 'uint64');
data = fread(in_fileID,Inf, 'uint8');
fclose(in_fileID);

batch = numel(data) / 16;
[out_fileID,errmsg] = fopen(out_path, 'w');
assert(out_fileID > 0, errmsg);
for i = 0:(batch - 2)
    start = i * 16;
    encoded = NESSIEdecrypt(keystruct, data(start + 1:start + 16));
    fwrite(out_fileID,encoded,'uint8');     
end
if tianchong ~= 0
    % 去掉最后的填充数据
    start = (batch - 1) * 16;
    encoded = NESSIEdecrypt(keystruct, data(start + 1:start + 16));
    fwrite(out_fileID,encoded(1: (16 - tianchong)),'uint8'); 
    
end
fclose(out_fileID);

end

