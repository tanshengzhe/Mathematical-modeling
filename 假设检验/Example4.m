clear
clc
A=xlsread('¸½¼þ2.1.xlsx','Example4','B2:E14');
x=log(A(:,2:4));
y=log(A(:,1));
stats=reglm(y,x,'linear');