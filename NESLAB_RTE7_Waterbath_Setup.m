%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%NESLAB RTE7 'Digital Plus' Waterbath Control via Matlab
%
%RUN THIS CODE ONCE BEFORE USING FUNCTIONS FOR WATERBATHS
%
%RS-232 Serial Connection 19200 Baud Start-bit:1 Data-bit:8 Stop-bit:1, no
%parity
%COM port address should be adjusted for each computer
%For detailed information refer to instruments manual "Appendix B NC Serial
%Communications Protocol"
%
% Takuma Kume 16 OCT 2020
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%AVAILABLE COMMANDS/FUNCTIONS:
%turnOnWaterbath - Turns on with last setting
%turnOffWaterbath - Turns off
%customTurnOnWaterbath - Set ON/OFF Array
%sendCustomHexBytesWaterbath - Send Custom Hex Bytes to waterbath

clear all;
baudRate = 19200;%If baud rate is changed from default, adjust here

%Serial Port Selection
while 1
    fprintf('\n');
    fprintf('Port List:\n');
    fprintf(seriallist+'\n');
    tempcomPort = input("Type Waterbath port name (e.g. COM5):\n",'s');
if(ismember(tempcomPort,seriallist))&& ~isempty(tempcomPort)
    comPort = tempcomPort;
    clear tempcomPort;
    break
end
    fprintf(2,"COM port Not Found!\n");
end

%Start serial communication
clc;%Clear Command window
fprintf("Connecting...\n");
global s;
global response;
s = serialport(comPort,baudRate);%Connect serial to waterbath
response = "";
clc;




