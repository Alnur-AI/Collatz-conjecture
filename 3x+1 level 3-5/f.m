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