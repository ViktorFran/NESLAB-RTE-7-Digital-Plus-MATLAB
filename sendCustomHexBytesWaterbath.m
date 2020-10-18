function sendCustomHexBytesWaterbath()
%Sends typed in hex bytes, with option to auto add cs byte at the end
%"n d-byte" is defined in the manual and all the appropriate values are noted in the manual

hexString = input("Type in Custom Hex bytes to send(checksum byte not necessary)\ne.g. CA 00 01 00 00 FE\n",'s');
confirm = input("Add Checksum byte? Y/n\n",'s');
if isempty(confirm)
    confirm = 'Y';
end
if(confirm == 'Y' | confirm == 'y')
    hexString = convertCharsToStrings(hexString);%Needs to be converted to strings after reciving user input as char
    hexString = addCheckSum(hexString);%Add checksum byte
else
    hexString = convertCharsToStrings(hexString);%Needs to be converted to strings after reciving user input as char
end

ndbytes = input("Value of 'n d-byte' in BATH RESPONDS (00-08):\n",'s');%get the ndbyte for recieving from waterbath
clc;%Clear command window

fprintf('Hex bytes: '+ hexString +'\nReceiving n d-byte: '+ ndbytes + '\n');
confirm = input("OK? Y/n\n",'s');%Confirm produced Hex bytes and ndbyte
if isempty(confirm)
    confirm = 'Y';
end
if(confirm == 'Y' | confirm == 'y')
    writeReadWaterbath(hexString,ndbytes);%Send and read from waterbath
else
    return;
end
