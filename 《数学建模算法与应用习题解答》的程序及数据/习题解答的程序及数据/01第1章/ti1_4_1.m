clc,clear
c=[3100;3800;3500;2850];
c=c*ones(1,3);
c=c(:);
a1=zeros(4,12);
for i=1:4
    a1(i,i:4:12)=1;
end
b1=[18;15;23;12];
a2=zeros(3,12);
for i=1:3
    a2(i,4*i-3:4*i)=1;
end
b2=[10 16 8]';
bb=[480;650;580;390];
a3=zeros(3,12);
for j=1:3
    a3(j,4*j-3:4*j)=bb;
end
b3=[6800 8700 5300]';
a=[a1;a2;a3];b=[b1;b2;b3];
aeq=zeros(2,12);
aeq(1,1:4)=1/10;
aeq(1,5:8)=-1/16;
aeq(2,5:8)=1/16;
aeq(2,9:12)=-1/8;
beq=zeros(2,1);
[x,y]=linprog(-c,a,b,aeq,beq,zeros(12,1));
x=reshape(x,[4,3]);
x=sum(x'),y=-y
