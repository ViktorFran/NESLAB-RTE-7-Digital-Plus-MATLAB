%Served as Code dumpster
%Not needed for any function





%seriallist
%fprintf('\n,%d',123);
%str2num(hexchar)

%   Turn On 
%   write(s,0xCA,"uint8");
%   write(s,0x00,"uint8");
%   write(s,0x01,"uint8");
%   write(s,0x81,"uint8");
%   write(s,0x08,"uint8");
%   write(s,0x01,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x66,"uint8");

%   Turn Off
%   write(s,0xCA,"uint8");
%   write(s,0x00,"uint8");
%   write(s,0x01,"uint8");
%   write(s,0x81,"uint8");
%   write(s,0x08,"uint8");
%   write(s,0x00,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x02,"uint8");
%   write(s,0x67,"uint8");
% 
%   response = read(s,14,"uint8"); %Make 14 bytes worth of response array
%   %While Loop to convert decimal array into HEX string called hexresponse
%   i=1;
%   hexresponse = "";
%   while i <= size(response,2)
%       hexresponse = append(hexresponse,dec2hex(response(1,i),2),' '); %Convert from dec to hex to 2fig, append to string, add space 
%       i = i+1;
%   end
%   hexresponse = strtrim(hexresponse);%Clean the response trailing space
%   disp(hexresponse);
  
% % CA 11001010
% % 00 00000000
% 
% % readInternalTemp 110010100000000000000001001000000000000011011110
% %FF = 11111111
% %21 = 100001
% %XO
% % readAcknowledge 110010100000000000000001000000000000000011111110
% decXOR = bitxor(hexA,hexB)//"uint8"
% clear s;
%   s = serialport("COM6",19200);%COM port number may differ
%   pause(1); %in seconds
  