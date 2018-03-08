function example7_13()
%MATLAB³ÌÐòÈçÏÂ
c=input('input c:=');
x0=[1000;1000;1000];
L=[0 4 3;1/2 0 0;0 1/4 0];
x1=L*x0-c;
x2=L*x1-c;
x3=L*x2-c;
x4=L*x3-c;
x5=L*x4-c;
[x1';x2';x3';x4';x5']
