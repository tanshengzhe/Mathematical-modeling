clear
days=30;
P=[125,150];
Q=[150,250];
cost=[0,0];
arrivalinterval=2;
storagefee=0.5;lossfee=1.6;bookfee=75;
storage0=110;booknumber=0;arrivedate=0;
nr=rand(days,1);
for i=1:2
      storage(1)=storage0;
      n=round(99*nr(1));
      sale=n;
      remain=storage(1)-n;
      if remain<=P(i);
          booknumber=Q(i);
          arrivedate=4;
          orderfee=bookfee;
       else
           orderfee=0;
       end
       storage(1)=remain;
       cost(i)=cost(i)+remain*storagefee+orderfee;
       for j=2:days
               dh=j;
               if  abs(dh-arrivedate)<0.01
                      storage(j)=storage(j-1)+booknumber;
                      booknumber=0;
                      arrivedate=j;
               else
                      storage(j)=storage(j-1);
               end
               n=round(99*nr(j));
               if storage(j)>=n
                   sale=n;
                   remain=storage(j)-n;
                   shortagenumber=0;
               else 
                   sale=storage(j);
                   remain=0;
                   shortagenumber=n-storage(j);
               end
               storage(j)=remain;
               if remain+booknumber<=P(i);
                   booknumber=Q(i);
                   arrivedate=dh+arrivalinterval;
                   orderfee=bookfee;
               else
                   orderfee=0;
               end
               cost(i)=cost(i)+remain*storagefee+shortagenumber*lossfee+orderfee;
        end;
           mincost=min(cost);
   end
   cost
   mincost
