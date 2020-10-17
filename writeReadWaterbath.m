function writeReadWaterbath(hexString,ndbytes)
global s;%Call global serial connection info
global response;%Call global response info
i = 1;
hexArray=split(hexString);%Split into Byte Array
while i <= size(hexArray,1) %Loop to send each byte until end
    %fprintf('0x'+hexArray(i)+'\n'); %For debugging, to see what it's sending
    write(s,str2num('0x'+hexArray(i)),"uint8"); %send byte of hex in binary to waterbath
    i = i+1;
end
%Retreiving response from waterbath
response = read(s,str2num(ndbytes)+6,"uint8"); %Make 14 bytes worth of response array
%While Loop to convert decimal array into HEX string called hexresponse
i=1;
hexresponse = "";
while i <= size(response,2)%for the length of response bytes
    hexresponse = append(hexresponse,dec2hex(response(1,i),2),' '); %Convert from dec to hex to 2fig, append to string, add space
    i = i+1;
end
hexresponse = strtrim(hexresponse);%Clean the response trailing space
fprintf('Waterbath >> '+hexresponse+'\n');
end