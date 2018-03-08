function example7_9()
%7.2.3.2离散形式的阻滞增长模型
r=1.8;
x=0.1;                            % 赋初值
n=40; 
for i=1:n
   x(i+1)=x(i)+R*x(i)*(1-r);           %迭代计算
end
k=(0:40)';
[k,xx]                            % 输出结果
plot(k,x),    
