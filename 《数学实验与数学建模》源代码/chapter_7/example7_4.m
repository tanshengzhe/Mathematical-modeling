function example7_4()
%7.1.3.3传染病模型
%模型Ⅲ
%编写MATLAB程序如下：
y=dsolve('Dy=0.01*y*(1-y)-0.05*y','y(0)=0.7','x');   %
ezplot(y,[0,120])
y2=dsolve('Dy=0.3*y*(1-y)-0.15*y','y(0)=0.7','x');   % 
y3=dsolve('Dy=0.3*y*(1-y)-0.15*y','y(0)=0.3','x');
figure,ezplot(y2,[0,25]);
figure,ezplot(y3,[0,25])
