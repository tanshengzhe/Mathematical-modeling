val=[];
for n=2:100
    k=2
    while rem(n,k)~=0
        k=k+1;
    end
    if k==n
        val=[val,k];
    end
end
disp(val);