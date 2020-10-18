# NESLAB-RTE-7-Digital-Plus-MATLAB-
Control NESLAB RTE 7 Refrigerated Bath with MATLAB through serial connection

1. RUN NESLAB_RTE7_Waterbath_Setup.m once to establish serial connection
2. Run commands such as "turnOnWaterbath"
3. Custom commands could be sent using wizard "sendCustomHexBytesWaterbath.m"
4. To create new functions use "writeRreadWaterbath("String of Hex byte to send",Recieving ndbytes size char (00-08)). This sends the hex bytes in binary to the machine, and returns the string of hex bytes responded by the machine
5. When the Checksum keeps failing, re-establish serial connection


