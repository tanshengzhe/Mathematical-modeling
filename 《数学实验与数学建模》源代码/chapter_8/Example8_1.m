function Example8_1
A=[0.7 0.5 0.2 0.4;0.8 0.3 0.4 0.2];   %模式A和B
B=[0.6 0.4 0.5 0.3];                   %模式C
fuzzy_mssb(1,A,B)  %调用函数
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
%%
