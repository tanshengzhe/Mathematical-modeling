function [a1,b1]=sortd(n,a,b)%еепР
[m,n]=size(a);
for h=1:n-1
  for j=1:n-h
   if a(j)<a(j+1)
      t1=a(j);a(j)=a(j+1);a(j+1)=t1;
     t2=b(j);b(j)=b(j+1);b(j+1)=t2;
  end
end
end
a1=a;
b1=b;

