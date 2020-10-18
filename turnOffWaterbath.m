function turnOffWaterbath()
%Turn OFF Command
turnOFFhex = "CA 00 01 81 08 00 02 02 02 02 02 02 02 67";
ndbyte = '08';

%Send hex bytes to machine
writeReadWaterbath(turnOFFhex,ndbyte);

%ADD ERROR CHECKING
%   if(hexresponse == "CA 00 01 81 08 00 00 00 00 00 00 00 01 74")
%    fprintf("CA 00 01 81 08 00 00 00 00 00 00 00 01 74\nDONE\n");
%   else
%       fprintf(2,"Error\n");
%   end
end