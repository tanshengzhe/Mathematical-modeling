function Example8_7
A=[0.1 0.2 0.3 0.3 0.05 0.05];
R=[0.8 0.2 0 0;
   0.56 0.44 0 0;
   0 0.6 0.4 0;
   0 0.5 0.5 0;
   0.7 0.3 0 0;
   0.5 0.5 0 0];
fuzzy_zhpj(3,A,R)
end
%%
function[B]=fuzzy_zhpj(model,A,R) %模糊综合评判
B=[];
[m,s1]=size(A);
[s2,n]=size(R);
if(s1~=s2)
     disp('A的列不等于R的行');
else
    if(model==1)                 %主因素决定型
        for(i=1:m)
           for(j=1:n)
               B(i,j)=0;
               for(k=1:s1)
                   x=0;
                   if(A(i,k)<R(k,j))
                      x=A(i,k);
                   else
                      x=R(k,j);
                   end
                  if(B(i,j)<x)
                     B(i,j)=x;
                  end
               end
           end
       end
   elseif(model==2)               %主因素突出型
       for(i=1:m)
          for(j=1:n)
              B(i,j)=0;
              for(k=1:s1)
                  x=A(i,k)*R(k,j);
                  if(B(i,j)<x)
                     B(i,j)=x;
                  end
              end
          end
       end
   elseif(model==3)              %加权平均型
          for(i=1:m)
             for(j=1:n)
                B(i,j)=0;
                for(k=1:s1)
                    B(i,j)=B(i,j)+A(i,k)*R(k,j);
                end
              end
           end
    elseif(model==4)             %取小上界和型
           for(i=1:m)
               for(j=1:n)
                   B(i,j)=0;
                   for(k=1:s1)
                       x=0;
                       x=min(A(i,k),R(k,j));
                       B(i,j)=B(i,j)+x;
                   end
                       B(i,j)=min(B(i,j),1);
               end
            end
      elseif(model==5)            %均衡平均型
            C=[];
            C=sum(R);
            for(j=1:n)
               for(i=1:s2)
                   R(i,j)=R(i,j)/C(j);
               end
            end
            for(i=1:m)
                for(j=1:n)
                    B(i,j)=0;
                   for(k=1:s1)
                       x=0;
                       x=min(A(i,k),R(k,j));
                       B(i,j)=B(i,j)+x;
                   end
                end
            end
        else
            disp('模型赋值不当');
        end
end
end
%%

