function [ m ] = prime_judgement( x )
%输入一个数并判断该书是否为质数。是返回1，否则为0.
%   eg.输入x=5，返回m=1；输入x=6，返回m=0
k=2;
    if x==1
        m=0;
    else
        while rem(x,k)~=0
            k=k+1;
        end
            if k==x
                m=1;
            else
                m=0;
        end
    end
end

