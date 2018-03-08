function example7_12()
%2．计算五年内动物数量变化规律
x0=[1000;1000;1000];
L=[0 4 3;1/2 0 0;0 1/4 0];
X=x0;
x(1)=X(1);y(1)=X(2);z=X(3);
for k=2:6
   X=L*X;
   x(k)=X(1);y(k)=X(2);z(k)=X(3);
end
t=0:5;
bar(t,x),
figure,bar(t,y)
figure,bar(t,z)
