function Example8_2
A=[164.51	86.43	25.49	51.24
160.53	81.47	23.84	48.62
158.17	81.16	21.44	46.72
];%6个标准模式
B=[162.23,84.34,22.11,47.56];         %待判别对象
MAX = max(A)+1;
MIN = min(A)-1;
for i = 1:4
    A(:,i) = (A(:,i) -MIN(i)) / (MAX(i) - MIN(i));
    B(:,i) = (B(:,i) -MIN(i)) / (MAX(i) - MIN(i));
end
A,B                             %将数据标准化
fuzzy_mssb(2,A,B)               %调用函数使用最大最小贴近度判别
end
%%
function[C]=fuzzy_mssb(model,A,B)         %模糊模式识别
C=[];
[m,n]=size(A);%A中按行容纳待识别模式
s=length(B);%B是标准模式
if(n~=s)
     disp('两个向量的维数不一致');
else
     if(model==1)                        %格贴近度
         for(i=1:m)
             x=max(min(A(i,:),B));
             y=min(max(A(i,:),B));
             C(1,i)=(x+(1-y))/2;
         end     
     elseif(model==2)                    %最小最大贴近度
            for(i=1:m)
               x=sum(min(A(i,:),B));
               y=sum(max(A(i,:),B));
               C(1,i)=x/y;
            end
      elseif(model==3)                   %最小平均贴近度
            for(i=1:m)
               x=2*sum(min(A(i,:),B));
               y=sum(A(i,:)+B);
               C(1,i)=x/y; 
            end
      elseif(model==4)                   %海明贴近度
            for(i=1:m)
                C(1,i)=1-sum(abs(A(i,:)-B))/n;
            end
      elseif(model==5)                   %欧几里得贴近度
            for(i=1:m)
                C(1,i)=1-sqrt((A(i,:)-B)*(A(i,:)-B)')/sqrt(n);
            end
      else
            disp('模型赋值不当');
      end
 end

end
