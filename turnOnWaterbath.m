%Turn ON Command
function turnOnWaterbath()
global s; %Call serial connection
global response;
turnONhex = "CA 00 01 81 08 01 02 02 02 02 02 02 02 66"; %HEX bytes
%Sends turnON hex commands in binary to machine
hexArray = split(turnONhex);
i = 1;
while i <= size(hexArray,1) %Loop to send each byte until end
    %fprintf('0x'+hexArray(i)+'\n'); %For debugging, to see what it's sending
    write(s,str2num('0x'+hexArray(i)),"uint8"); %send byte of hex in binary to waterbath
    i = i+1;
end
%Retreiving response from waterbath
  response = read(s,14,"uint8"); %Make 14 bytes worth of response array
  %While Loop to convert decimal array into HEX string called hexresponse
  i=1;
  hexresponse = "";
  while i <= size(response,2)
      hexresponse = append(hexresponse,dec2hex(response(1,i),2),' '); %Convert from dec to hex to 2fig, append to string, add space 
      i = i+1;
  end
  hexresponse = strtrim(hexresponse);%Clean the response trailing space
  fprintf('Waterbath >> '+hexresponse+'\n');
%   if(hexresponse == "CA 00 01 81 08 01 00 00 00 00 00 00 01 73")
%    fprintf("CA 00 01 81 08 01 00 00 00 00 00 00 01 73\nDONE\n");
%   else
%       fprintf(2,"Error");
%   end
end