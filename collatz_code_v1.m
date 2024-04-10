%% v1
fileID = fopen('collatz_code_v1_22222222222222000000-22222222222222009999.txt','w');
list_levels = [];

for i = 22222222222222000000+1:2:22222222222222000000+9999

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

