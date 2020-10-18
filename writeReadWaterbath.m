function writeReadWaterbath(hexString,ndbytes)
%Sends the string of Hex bytes ("hexString") in binary byte by byte to the waterbath
%"ndbytes" char then determines the size of bytes to listen to from the waterbath and concatnate the binary response into hex string
%global variable s and, response is used so that the values could be used from any function
%Total bytes to listen to is sum of 6 constant bytes + ndbytes value

global s;%Call global serial connection info
global response;%Call global response info

%Write to waterbath
hexArray=split(hexString);%Split into Byte Array
i = 1;
while i <= size(hexArray,1) %Loop to send each byte until end
    write(s,str2num('0x'+hexArray(i)),"uint8"); %send byte of hex in binary to waterbath
    i = i+1;
end

%Retreiving response from waterbath
response = read(s,str2num(ndbytes)+6,"uint8"); 

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