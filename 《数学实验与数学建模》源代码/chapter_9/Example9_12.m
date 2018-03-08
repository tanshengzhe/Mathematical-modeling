function Example9_12
clc
a=[1,1,1,4,1,1/2
   1,1,2,4,1,1/2
   1,1/2,1,5,3,1/2
   1/4,1/4,1/5,1,1/3,1/3
   1,1,1/3,3,1,1
   2,2,2,3,3,1];%Ò»ÖÂ¾ØÕó
[x,y]=eig(a);eigenvalue=diag(y);lamda=max(eigenvalue);
ci1=(lamda-6)/5;cr1=ci1/1.24
w1=x(:,1)/sum(x(:,1))
b1=[1,1/4,1/2;4,1,3;2,1/3,1];
[x,y]=eig(b1);eigenvalue=diag(y);lamda=eigenvalue(1);
ci21=(lamda-3)/2;cr21=ci21/0.58
w21=x(:,1)/sum(x(:,1))
b2=[1  1/4   1/5;4   1   1/2;5   2    1];
[x,y]=eig(b2);eigenvalue=diag(y);lamda=eigenvalue(1);
ci22=(lamda-3)/2;cr22=ci22/0.58
w22=x(:,1)/sum(x(:,1))
b3=[1    3  1/3;1/3   1    1/7;3   7    1];
[x,y]=eig(b3);eigenvalue=diag(y);lamda=eigenvalue(1);
ci23=(lamda-3)/2;cr23=ci23/0.58
w23=x(:,1)/sum(x(:,1))
b4=[1   1/3   5;3   1    7;1/5  1/7   1];
[x,y]=eig(b4);eigenvalue=diag(y);lamda=eigenvalue(1);
ci24=(lamda-3)/2;cr24=ci24/0.58
w24=x(:,1)/sum(x(:,1))
b5=[1   1    7;1   1    7;1/7  1/7   1];
[x,y]=eig(b5);eigenvalue=diag(y);lamda=eigenvalue(1);
ci25=(lamda-3)/2;cr25=ci25/0.58
w25=x(:,1)/sum(x(:,1))
b6=[1   7   9;1/7  1   1 ;1/9   1   1];
[x,y]=eig(b6);eigenvalue=diag(y);lamda=eigenvalue(1);
ci26=(lamda-3)/2;cr26=ci26/0.58
w26=x(:,1)/sum(x(:,1))
w_sum=[w21,w22,w23,w24,w25,w26]*w1
ci=[ci21,ci22,ci23,ci24,ci25,ci26];
cr=ci*w1/sum(0.58*w1)