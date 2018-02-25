clear,clc
load data
f=[zeros(100,1);-1];
a=[-A',ones(150,1)];b=zeros(150,1);
aeq=[ones(1,100) 0];beq=1;
lb=[zeros(100,1);-inf];ub=[ones(100,1);inf];
x=linprog(f,a,b,aeq,beq,lb,ub);
v=x(end)
