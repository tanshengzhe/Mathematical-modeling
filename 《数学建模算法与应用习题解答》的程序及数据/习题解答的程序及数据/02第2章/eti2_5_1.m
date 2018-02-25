clc, clear
s=[];
for i=0:2
    for j=0:3
        for k=0:6
            if 2.9*i+2.1*j+k>5.9 & 2.9*i+2.1*j+k<=6.9
                s=[s,[i,j,k,6.9-(2.9*i+2.1*j+k)]'];
            end
        end
    end
end
[sy,ind]=sort(s(4,:)); %对料头按从小到大次序排序
s=s(:,ind)
