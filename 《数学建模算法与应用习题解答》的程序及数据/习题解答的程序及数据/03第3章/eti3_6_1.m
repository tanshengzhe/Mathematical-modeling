clc, clear
for a=0:4
    for b=[2 4 6 7]
        mb=@(x) 4*x(1)^3-a*x(1)-2*x(2); %定义目标函数的匿名函数
        aa=[1 1; 2 1; 1 -b]; bb=[4 5 -2]'; %定义线性不等式约束
        [x,y]=fmincon(mb,rand(2,1),aa,bb,[],[],zeros(2,1));
        fprintf('a=%d,b=%d时，y=%f\n',a,b,y)
        x
    end
end
