clc
x(1)=[];
y(1)=[];
x1=1./x;
ly=log(y);
lx=log(x);

stats2=reglm(y,x1,'linear'); 
 