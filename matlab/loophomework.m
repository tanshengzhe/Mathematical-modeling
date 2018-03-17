%若一个数等于它的各个真因子之和， 则称该数为完数， 如6=1+2+3， 所以6是完数。 求 [1,500] 之间的全部完数
clear;
val(1)=0;
as=[];
for n=2:500
    val=[];
    val(1)=0;
    for i=1:n-1
        if(rem(n,i)==0)
            val(end+1)=i;
        end
    end
    k=sum(val);
    if (k==n)
        as=[as,k];
    end
end

as