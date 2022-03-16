% XOR corrector

clc;
clear all;

fid = fopen('trng.txt');
trng = fread(fid)
fclose(fid);


trngbin = dec2bin(trng,8)

L = length(trngbin);
stream = reshape(trngbin',1,L*8)

stream2 = reshape(stream,2,L*4)

xorcor = mod(stream2(1,:)+stream2(2,:),2)

stream = reshape(xorcor,8,L/2)';

output = bi2de(stream,'left-msb');

fid2 = fopen('XOR.txt', 'w');
fwrite(fid2, output);
fclose(fid2);
fclose('all');