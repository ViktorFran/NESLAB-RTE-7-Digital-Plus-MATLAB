function customTurnOnWaterbath()
%Allows user to customise ON/OFF Array
%Details in manual Table 1 "Set ON/OFF Array"
global s; %Call serial connection
d1 = dec2hex(input("1/8 Unit ON/OFF?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d2 = dec2hex(input("2/8 Sensor Enable?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d3 = dec2hex(input("3/8 Faults Enabled?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d4 = dec2hex(input("4/8 Mute?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d5 = dec2hex(input("5/8 Auto Restart?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d6 = dec2hex(input("6/8 0.01C Enable?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d7 = dec2hex(input("7/8 Full Range Cool Enable?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
d8 = dec2hex(input("8/8 Serial Comm Enable?: 0=OFF, 1=ON, 2=NO CHANGE\n"),2);
customHex = "CA 00 01 81 08 ";
hexString = append(customHex,d1,' ',d2,' ',d3,' ',d4,' ',d5,' ',d6,' ',d7,' ',d8);%Prepare to get cs
hexString = addCheckSum(hexString);

fprintf(hexString+'\n');
confirm = input("OK? Y/n\n",'s');%Confirm produced Hex bytes
if isempty(confirm)
    confirm = 'Y';
end
if(confirm == 'Y' | confirm == 'y')
    clc;
    %Write to waterbath
    writeReadWaterbath(hexString,'08');
else
    return;
end
    
