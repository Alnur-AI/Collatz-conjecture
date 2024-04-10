#analyze list and sort it

#listCopy = 1:2:99999;
#listCopy = list;

#for i = 1:500000
#  yyy(i) = max(list_levels(1:i));
#end
plot(1:2000,yyy(1:2000))

%{
fileID = fopen('collatz_code_1-99999.txt','r');

raw = fscanf(fileID,'\n')

fclose(fileID);
%}
