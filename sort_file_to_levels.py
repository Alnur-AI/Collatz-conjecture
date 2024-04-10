
f = open("collatz_code_1-99999.txt", "r")

code_array = []

for x in f:
    x = x.replace("{", "")
    x = x.replace("}", "")
    x = x.replace("=", "")
    x = x.replace("[", "")
    x = x.replace("]", "")
    x = x.replace("\n", "")

    y = x.split(' ')
    y =  list( filter(None, y) )

    z = [int(t) for t in y]
    code_array = [code_array,z]
    print(z[0])

import csv

with open('code_array.csv', 'w') as f:
    writer = csv.writer(f)
    writer.writerows(code_array)

'''
%% v1
fileID = fopen('collatz_code_v1_1-99999.txt','w');
list_levels = [];

for i = 1:2:99999

  num = i;
  k = 0;
  fprintf(fileID,'%d ',i);
  fprintf('%d: \n',i);
  while ( num != 1 )

    kDigit = 0;
    if(mod(num,2)==1)
      num = 3*num + 1;
    else
      while (mod(num,2) == 0)
        num = num / 2;
        kDigit = kDigit + 1;
      end
    end
    if (kDigit ~= 0)
      fprintf(fileID,'%d ',kDigit);
      k = k + 1;
    end

  end
  fprintf(fileID,'%d\n',k);

  list_levels = [list_levels k];
end

fclose(fileID);
'''
    
