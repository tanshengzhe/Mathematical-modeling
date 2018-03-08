function ga_main()
% 遗传算法
% GA main program% Edited by Tan % Revision: 1.1 % Date: 2009/07/09 
% n-- 种群规模% ger-- 迭代次数% pc--- 交叉概率% pm-- 变异概率
% v-- 初始种群（规模为n）% f-- 目标函数值% fit-- 适应度向量
% vx-- 最优适应度值向量% vmfit-- 平均适应度值向量
clear all;
close all;
clc;%清屏
tic;%计时器开始计时
n=20;ger=100;pc=0.65;pm=0.05;%初始化参数
%以上为经验值，可以更改。
% 生成初始种群
v=init_population(n,22); %得到初始种群，22串长，生成20*22的0-1矩阵
[N,L]=size(v);           %得到初始规模行，列
disp(sprintf('Number of generations:%d',ger));
disp(sprintf('Population size:%d',N));
disp(sprintf('Crossover probability:%.3f',pc));
disp(sprintf('Mutation probability:%.3f',pm)); %sprintf可以控制输出格式
% 待优化问题
xmin=0;xmax=9;  %变量X范围
f='x+10*sin(x.*5)+7*cos(x.*4)';
% 计算适应度，并画出初始种群图形
x=decode(v(:,1:22),xmin,xmax);%22位二进制换成十进制，%冒号表示对所有行进行操作。
fit=eval(f);%eval转化成数值型的  %计算适应度
figure(1);%打开第一个窗口
fplot(f,[xmin,xmax]);%隐函数画图
grid on;hold on;
plot(x,fit,'k*');%作图
title('(a)染色体的初始位置');%标题
xlabel('x');ylabel('f(x)');%标记轴
% 迭代前的初始化
vmfit=[];%平均适应度
vx=[]; %最优适应度
it=1; % 迭代计数器
% 开始进化
while it<=ger %迭代次数 %100代
    %Reproduction(Bi-classist Selection)
    vtemp=roulette(v,fit);%复制  
    %Crossover    
    v=crossover(vtemp,pc);%交叉 
    %Mutation
    M=rand(N,L)<=pm;%这里的作用找到比0.05小的分量
    %M(1,:)=zeros(1,L);
    v=v-2.*(v.*M)+M;%两个0-1矩阵相乘后M是1的地方V就不变，再乘以2. 
    %这里是点乘 %变异  
    %Results 
    x=decode(v(:,1:22),xmin,xmax);%解码，求目标函数值
    fit=eval(f);        %计算数值
    [sol,indb]=max(fit);% 每次迭代中最优目标函数值，包括位置
    v(1,:)=v(indb,:);   %用最大值代替
    fit_mean=mean(fit); % 每次迭代中目标函数值的平均值。mean求均值
    vx=[vx sol];        %最优适应度值
    vmfit=[vmfit fit_mean];%适应度均值
    it=it+1;            %迭代次数计数器增加
end
%%%% 最后结果
disp(sprintf('\n'));  %空一行% 显示最优解及最优值
disp(sprintf('Maximum found[x,f(x)]:[%.4f,%.4f]',x(indb),sol));
% 图形显示最优结果
figure(2);
fplot(f,[xmin,xmax]);
grid on;hold on;
plot(x,fit,'r*');
title('染色体的最终位置');
xlabel('x');ylabel('f(x)');
% 图形显示最优及平均函数值变化趋势
figure(3);
plot(vx);
%title('最优,平均函数值变化趋势');
xlabel('Generations');ylabel('f(x)');hold on;
plot(vmfit,'r');hold off;
runtime=toc%记时结束
end
%%
%Decodify bitstrings
function x=decode(v,xymin,xymax)
% x    ----real value(precision:6)
% v    ----binary string(length:22)
v=fliplr(v); %实现左右翻转颠倒
[s,c]=size(v); %c代表串长。求行，列
aux=0:1:c-1;   %21维向量
aux=ones(s,1)*aux;%权值向量矩阵
x1=sum((v.*2.^aux)');%权值   %注意转置   %sum是求列和
x=xymin+(xymax-xymin)*x1./(2^c-1);    %最大值4194303;
end
%%
%Crossover
function v=crossover(vtemp,pc)
[N,L]=size(vtemp);
C(:,1)=rand(N,1)<=pc;%选择被杂交的。<=pc就是1否则是0构成0-1向量
I=find(C(:,1)==1);%找分量等于1的元素，其下标构成向量。
I';%变成行向量
j=1;
for i=1:2:size(I)%两两配对所以以2为步长
    if i>=size(I)%奇数个处理
        break;
    end
    site=fix(1+L*rand(1));%fix向零取整，L=22.%site属于1-22.
    temp=vtemp(I(i,1),:);%交换的暂存变量。T
    vtemp(I(i,1),site:end)=vtemp(I(i+1,1),site:end);%交换后面的数值
    vtemp(I(i+1,1),site:end)=temp(:,site:end);%交换
end
v=vtemp;%复制返回
end        
%%
%Function init_population
function v=init_population(n1,s1)
v=round(rand(n1,s1));%rand产生随机数，%round四舍五入取整
end
%%
function vtemp=roulette(v,fit)
N=size(v);  %N向量
fitmin=abs(min(fit));%最小值和绝对值
fit=fitmin+fit; %最小值加上步长，保证fit>=0.
%fit
S=sum(fit);%求向量的和
for i=1:N
    SI=S*rand(1);%rand随机数。0-s之间的一个随机数
    for j=1:N
        if SI<=sum(fit(1:j))  %累加列值
            vtemp(i,:)=v(j,:);%选中此样本
            break
        end
    end
end
end

