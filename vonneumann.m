% von Neumann Correction

clc;
clear all;

fid = fopen('trng.txt');
trng = fread(fid)
fclose(fid);


trngbin = dec2bin(trng,8)

L = length(trngbin);
stream = reshape(trngbin',1,L*8)

stream2 = reshape(stream,2,L*4)
vonneu = [];
j=1;

for i=1:L*4
    if stream2(1,i) ~= stream2(2,i)
        vonneu(j) = stream2(1,i);
        j=j+1;
    end
    
end
vonneu = mod(vonneu, 2);
L2 = length(vonneu);

L3 = L2-mod(L2,8);
vonneu = vonneu(1:L3)

stream = reshape(vonneu,8,L3/8)';

output = bi2de(stream,'left-msb');

fid2 = fopen('VON.txt', 'w');
fwrite(fid2, output);
fclose(fid2);
fclose('all');