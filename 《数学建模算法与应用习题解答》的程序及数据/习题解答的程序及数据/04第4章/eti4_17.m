clc, clear
x0=[1:8]; y0=[2,5,2,4,8,5,7,4];
a=zeros(8);
a(1,[2,3])=1; a(2,[4,5,7])=1;
a(3,[7,8])=1; a(4,[5,7])=1;
a(5,6)=1; a(6,7)=1; a(7,8)=1;
coordinate=[x0',y0'];
gplot(a,coordinate,'*-')
name=cellstr(num2str((1:8)'))
text(x0+0.1, y0, name,'FontSize',8,'color','k')
xlim([1,8.5]), ylim([1,8.5])
