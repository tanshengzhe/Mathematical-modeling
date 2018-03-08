r=rand(1,10);
for i=1:10;
                  if r(i)<0.4
                    n(i)=0;
                  elseif 0.4<=r(i)&r(i)<0.7
                    n(i)=1;
                  else n(i)=2;
                 end;
              end
           r
           n
