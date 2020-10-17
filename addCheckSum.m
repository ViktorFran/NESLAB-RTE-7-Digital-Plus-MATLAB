function csattach = addCheckSum(hexstring)
%Checksum Calculator
%Returns hex char for checksum byte by Bitwise inversion, by inputting the
%string of hex bytes as stated in waterbath manual.
%e.g. "CA 00 01 81 08 00 02 02 02 02 02 02 02" will return "67"
% 0xSUM XOR 0xFF and concate 0x and returns the whole char

cleanstring = strip(hexstring,'C');%Clean hex string to only checksum region
cleanstring = strip(hexstring,'C');
cleanstring = strip(cleanstring,'A');
cleanstring = split(strip(cleanstring));%split into array for hex summation
i = 1;
sum = 0;
while i <= size(cleanstring,1)%Sum all the checksum region in hex
    decNum = str2num('0x'+cleanstring(i));
    sum = sum + decNum;
    i = i + 1;
end
cs = dec2hex(bitxor(str2num(strcat('0x',dec2hex(sum))),0xFF));%Bitwise Inversion of sum and 0xFF
csattach = append(hexstring,' ',cs);%Add to original input
clc;
end