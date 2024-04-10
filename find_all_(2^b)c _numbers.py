import numpy as np
import matplotlib.pyplot as plt

N = 15434
out = np.zeros([1,N])

for count in range(1,N+1):
    x = count
    n = int(x/4)

    #A = np.zeros([n,int( np.log2(x/3) )])
    nonzero_counter = 0;

    for i in range(1, int( np.log2(x/3) + 1 )):
        for j in range(0, n):
            temp = (2**i)*(2*j+3)
            if temp < x:
                #A[j][i-1] = temp
                nonzero_counter += 1
            #else:
                #A[j][i-1] = 0

    print(count)
    out[0][count-1] = nonzero_counter

#print(out)
plt.plot(np.arange(1, N+1),np.transpose(out), np.arange(1, N+1),np.arange(1, N+1))
plt.show()
