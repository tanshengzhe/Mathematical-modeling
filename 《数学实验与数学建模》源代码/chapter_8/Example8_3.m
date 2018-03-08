function  Example8_3
A=[10 23.35 0.1204 74.88 0.092;
   17 36.09 0.2523 99.54 0.2592;
   30 150 0.6 150 0.45;
   50 350 1.4 350 1.05;
   70 500 2 500 1.5];
B=[14 67.3 0.12 59.9 0.29;
   4.33 37.1 0.21 53.6 0.15
   5.95 46.5 0.23 56.1 0.12];
[C]=fuzzy_lshsA(1,1,A)
[D]=fuzzy_lshsB(1,1,A,B)
fuzzy_mssb(3,C,D(1,:))
fuzzy_mssb(3,C,D(2,:))
fuzzy_mssb(3,C,D(3,:))      %分别做A的隶属度与各样品的隶属度的模式识别
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
function[B]=fuzzy_lshsB(cs,k,A,B)%将B用隶属度表达出来
[m,n]=size(A);
[p,q]=size(B);
C=min(A);
if(cs==1)%适用于指标越小越好的情形
    for(i=1:p)
        for(j=1:n)
            if(B(i,j)<=C(j))
               B(i,j)=1;
           else
               B(i,j)=exp(-k*(B(i,j)-C(j))^2);
           end
       end
   end
else %适用于指标越大越好的情形
    for(i=1:p)
        for(j=1:n)
            if(B(i,j)<=C(j))
               B(i,j)=0;
           else
               B(i,j)=1-exp(-k*(B(i,j)-C(j))^2);
           end
       end
   end
end
end
%%
function[C]=fuzzy_lshsA(cs,k,A)%将A用隶属度表达出来
[m,n]=size(A);
C=min(A);
if(cs==1)%适用于指标越小越好的情形
    for(i=1:m)
        for(j=1:n)
            if(A(i,j)<=C(j))
               A(i,j)=1;
           else
               A(i,j)=exp(-k*(A(i,j)-C(j))^2);
           end
       end
   end
else %适用于指标越大越好的情形
    for(i=1:m)
        for(j=1:n)
            if(A(i,j)<=C(j))
               A(i,j)=0;
           else
               A(i,j)=1-exp(-k*(A(i,j)-C(j))^2);
           end
       end
   end
end
end
%%


