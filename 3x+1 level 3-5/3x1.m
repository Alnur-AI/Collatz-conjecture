%% test all k = 3
clc
clear 

format rat

allpos = (2)*(2*3)*(2*3*3-1)
len = 3;
A = zeros(allpos,len+2);



pointer = 1;
for i1 = 1:2
    for i2 = 1:2*3
        for i3 = 4:(2*3*3+2)
                k = [i1 i2 i3];
                two_k = 2.^cumsum(k,2);
                two = two_k(1:len-1);
                three = 3.^[0:len-2];
                three =  fliplr(three); 
                
                A(pointer,1) = i1;
                A(pointer,2) = i2;
                A(pointer,3) = i3;
                
                x0 = (  two_k(len) - dot(three,two)  - 3^(len-1)  )/3^(len);
                A(pointer,4) = x0 - floor(x0);
                A(pointer,5) = x0;
                pointer = pointer+1
        end
    end
end
index = find(A(:,len+1)==0);
AllNumbers = A(index,:);
%% test all k = 4 bad way 
clc
clear 

format rat


allpos = (2)*(2*3)*(2*3*3)*(2*3*3*3-1)
len = 4;
A = zeros(allpos,len+2);
A = double(A);


pointer = 1;
for i1 = 1:2
    for i2 = 1:2*3
        for i3 = 1:2*3*3
            for i4 = 4:(2*3*3*3+2)
                k = [i1 i2 i3 i4];
                
                s = cumsum(k,2);
                two_k = 2.^s;
                two = two_k(1:len-1);
                three = 3.^[0:len-2];
                three =  fliplr(three); 
                
                A(pointer,1) = i1;
                A(pointer,2) = i2;
                A(pointer,3) = i3;
                A(pointer,4) = i4;
                
                x0 = (  two_k(len) - dot(three,two)  - 3^(len-1)  )/3^(len);
                
                reminder = 0;
                for i = 1:len-1
                    reminder = reminder + (nchoosek(s(len),i)-nchoosek(s(len-1),i))*3^(i-len)*(-1)^(s(len-1)-i);
                end
                reminder = reminder - 1/3;
                
                for j = 1:len-2
                    for i = 1:j
                        reminder = reminder - nchoosek(s(len),i)*3^(i-j-1)*(-1)^(s(j)-i);
                    end
                end
                
                %reminder = x0 - floor(x0);%1/3
                
                A(pointer,5) = abs(reminder)-floor(abs(reminder));
                A(pointer,6) = x0;
                pointer = pointer+1;
            end
        end
    end
end
index = find(A(:,len+1)==0);
AllNumbers = A(index,:);
whos
%% test all k = 5 bad way 
clc
clear 

format rat


allpos = (2)*(2*3)*(2*3*3)*(2*3*3*3)*(2*3*3*3*3-1)
len = 5;
A = zeros(allpos,len+2);


pointer = 1;
for i1 = 1:2
    for i2 = 1:2*3
        for i3 = 1:2*3*3
            for i4 = 1:2*3*3*3
                for i5 = 4:(2*3*3*3*3+2)
                    k = [i1 i2 i3 i4 i5];
                    two_k = 2.^cumsum(k,2);
                    two = two_k(1:len-1);
                    three = 3.^[0:len-2];
                    three =  fliplr(three); 

                    A(pointer,1) = i1;
                    A(pointer,2) = i2;
                    A(pointer,3) = i3;
                    A(pointer,4) = i4;
                    A(pointer,5) = i5;

                    x0 = (  two_k(len) - dot(three,two)  - 3^(len-1)  )/3^(len);
                    A(pointer,6) = x0 - floor(x0);
                    A(pointer,7) = x0;
                    pointer = pointer+1
                end
            end
        end
    end
end
index = find(A(:,len+1)==0);
AllNumbers = A(index,:);
%% task 1 from k get x0
clc
clear

format rat


k = [ 3 5 4]
 
% --for x0 constants--- % 
len = size(k,2);
two_k = 2.^cumsum(k,2);
two = two_k(1:len-1);
three = 3.^[0:len-2];
three =  fliplr(three); 
% --------------------- %

x0 = (  two_k(len) - dot(three,two)  - 3^(len-1)  )/3^(len)

%% task 2 from x0 get k
clc 
clear 


x2  = 0;
x4  = 0;
x6  = 0;
x8  = 0;
x10 = 0;
    
for j = 5%3:2:999999
    x0 = j;

    maxlen = 10000;
    k = zeros(maxlen+1,1);
    x = zeros(maxlen+1,1);
    x(1) = x0;

    for i = 2:maxlen
        i;
        t = f(x(i-1));
        while( mod(t,2)==0 )
            t = f(t);
            k(i) = k(i)+1;
        end
        x(i) = t;
        if(t == 1)
            break
        end
    end
    
    t = fliplr( x(x~=0)' );
    
    len = size(t,2);
    if(2 <= len)
        x2 = [x2, t(2)];
    end
    if(3 <= len)
        x4 = [x4, t(3)];
    end
    if(4 <= len)
        x6 = [x6, t(4)];
    end
    if(5 <= len)
        x8 = [x8, t(5)];
    end
    if(6 <= len)
        x8 = [x8, t(6)];3
    end
end
matrix = [ k(x~=0)'; x(x~=0)' ]
%unique(x4)




 function ans = f(x)

    if( mod(x,2) == 0)
        ans = x/2;
        return
    end
    if( mod(x,2) == 1)
        ans = 3*x+1;
        return
    end
end
