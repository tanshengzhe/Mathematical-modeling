clc, clear
c=[30   25  18  32  27  19  22  26
29  31  19  18  21  20  30  19
28  29  30  19  19  22  23  26
29  30  19  24  25  19  18  21
21  20  18  17  16  14  16  18];
c=c(:);
a=zeros(8,40);
for j=1:8
    a(j,[(j-1)*5+1:j*5])=1;
end
b=ones(8,1);
aeq=zeros(5,40);
for i=1:5
    aeq(i,[i:5:40])=1;
end
beq=ones(5,1);
[x,y]=bintprog(c,a,b,aeq,beq);
x=reshape(x,[5,8])
