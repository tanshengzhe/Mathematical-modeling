s=0;
x1=rand(10000,1);
x2=rand(10000,1);
x3=randn(10000,1);
for i=1:10000
if x1(i)<0.7
T1=0;
elseif x1(i)<0.9
T1=5;
         else
              T1=10;
         end
T2=30+2*x3(i);
if x2(i)<0.3
              T3=28;
elseif x2(i)<0.7
              T3=30;
         elseif x2(i)<0.9
              T3=32;
         else 
              T3=34;
         end
if T3<T1+T2
              s=s+1;
end
end
[s/10000]
