% hexString = "CA 00 01 81 08 00 02 02 02 02 02 02 02 67"
function csState = checkSum(hexString)
%Returns bool whether if the cs byte is correct
%Calculates the cs byte using same method as "addCheckSum.m"

cleanstring = strip(hexString,'C');%Clean hex string to only checksum region
cleanstring = strip(cleanstring,'C');
cleanstring = strip(cleanstring,'A');
cleanstring = split(strip(cleanstring));%split into array for hex summation

csOriginal = cleanstring()%Keep the original cs byte for later comparison

i = 1;
sum = 0;
while i <= size(cleanstring,1)%Sum all the checksum region in hex
    decNum = str2num('0x'+cleanstring(i));
    sum = sum + decNum;
    i = i + 1;
end
cs = dec2hex(bitxor(str2num(strcat('0x',dec2hex(sum))),0xFF));%Bitwise Inversion of sum and 0xF