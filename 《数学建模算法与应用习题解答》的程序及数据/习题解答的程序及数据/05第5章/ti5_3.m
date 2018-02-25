clc, clear
x=[1:8]';
y=[15.3	20.5	27.4	36.6	49.1	65.6	87.87	117.6]';
xishu=[ones(8,1),x]; %构造系数矩阵
cs=xishu\log(y); %线性最小二乘法拟合参数
cs(1)=exp(cs(1)) %把lna变换成a
