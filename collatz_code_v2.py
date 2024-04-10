import numpy as np

list_of_numbers = [3]
code = []
isExit = 0
#N = 40 #222222222222222000000
N = 324823587123058979129835731298579132598238993805198235782
for i in range(N+1,N+50,2):

    num = i;
    l_num = 0;

    print(str(i) + ':  ',end=" ")

    while num != 1:

        k = 0;
        if np.mod(num,2)==1:
            num = 3*num + 1
            #print(1,int(num))
        else:
            while np.mod(num,2)==0:
                num = num/2
                k = k + 1
                #print(2, int(num))
            
        '''
            for index in range(0,len(list_of_numbers)):
                if num == list_of_numbers[index]:
                    print(str(k) + ' ['+ str(num) +']',end = " ")
                    isExit = 1
                    break
        
            if isExit == 0 and num != 1:
                list_of_numbers.append(int(num))
                #list_of_numbers = [list_of_numbers, num]
        
        if isExit == 1:
            isExit = 0
            num = 1
            break;
        '''
            
        if k != 0:
            code.append(k)
            print(str(k) + ' ',end=" ")
            l_num = l_num + 1

    print('\n',end=" ")

ANS = 2 ** (sum(code))
l = len(code)
for i in range(0,l):
    #print(code[0:i])
    ANS = ANS - (2 ** (sum(code[0:l-i])) * 3 ** (sum(code[0:i])) )
print(int(ANS/ 3 ** (l)))




