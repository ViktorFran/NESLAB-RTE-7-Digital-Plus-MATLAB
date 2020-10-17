function sendCustomHexBytesWaterbath()
hexString = input("Type in Custom Hex bytes to send(checksum byte not necessary)\ne.g. CA 00 01 00 00 FE\n",'s');
confirm = input("Add Checksum byte? Y/n\n",'s');%Confirm produced Hex bytes
if isempty(confirm)
    confirm = 'Y';
end
if(confirm == 'Y' | confirm == 'y')
    hexString = convertCharsToStrings(hexString);
    hexString = addCheckSum(hexString);%Add checksum byte
else
    hexString = convertCharsToStrings(hexString);
end
ndbytes = input("Value of 'n d-byte' in BATH RESPONDS (00-08):\n",'s');
clc;
fprintf('Hex bytes: '+ hexString +'\nReceiving n d-byte: '+ ndbytes + '\n');
confirm = input("OK? Y/n\n",'s');%Confirm produced Hex bytes and ndbyte
if isempty(confirm)
    confirm = 'Y';
end
if(confirm == 'Y' | confirm == 'y')
    writeReadWaterbath(hexString,ndbytes);
else
    return;
end
