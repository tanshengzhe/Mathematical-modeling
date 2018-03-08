function shortroad_ant_main
% Ant main program
clear all;close all;clc;%清屏
tic;%计时开始
Ant=50;Ger=100;%运行参数初始化
power=[0 5 3 100 100 100 100 100 100 100 100 100 100 100 100 100;
    100 0 100 1 3 6 100 100 100 100 100 100 100 100 100 100;
    100 100 0 100 8 7 6 100 100 100 100 100 100 100 100 100;
    100 100 100 0 100 100 100 6 8 100 100 100 100 100 100 100;
    100 100 100 100 0 100 100 3 5 100 100 100 100 100 100 100;
    100 100 100 100 100 0 100 100 3 3 100 100 100 100 100 100;
    100 100 100 100 100 100 0 100 8 4 100 100 100 100 100 100;
    100 100 100 100 100 100 100 0 100 100 2 2 100 100 100 100;
    100 100 100 100 100 100 100 100 0 100 100 1 2 100 100 100;
    100 100 100 100 100 100 100 100 100 0 100 3 3 100 100 100;
    100 100 100 100 100 100 100 100 100 100 0 100 100 3 5 100;
    100 100 100 100 100 100 100 100 100 100 100 0 100 5 2 100;
    100 100 100 100 100 100 100 100 100 100 100 100 0 6 6 100;
    100 100 100 100 100 100 100 100 100 100 100 100 100 0 100 4;
    100 100 100 100 100 100 100 100 100 100 100 100 100 100 0 3;
    100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 0];
[PM PN]=size(power);
% 初始化蚂蚁位置
v=init_population(Ant,PN);
v(:,1)=1;v(:,PN)=1;%始点和终点纳入路径
%把距离当信息素浓度
fit=short_road_fun(v,power);
%距离越小越好，所以要和信息素浓度相对应。
T0 = max(fit)-fit;
% 画出图形
figure(1);grid on;hold on;
plot(fit,'k*');
title('(a)蚂蚁的初始位置');
xlabel('x');ylabel('f(x)');
% 初始化
vmfit=[];vx=[];
P0=0.2;           % P0----全局转移选择因子
P=0.8;            % P ----信息素蒸发系数
%C=[];
% 开始寻优
for i_ger=1:Ger
    lamda=1/i_ger;    % 转移步长参数 
    [T_Best(i_ger),BestIndex]=max(T0);%最大信息素浓度   
    for j_g=1:Ant    % 求取全局转移概率
        r=T0(BestIndex)-T0(j_g);%与最佳的蚂蚁的距离
        Prob(i_ger,j_g)=r/T0(BestIndex);%应该以多大的速率向它靠拢
    end  
    for j_g_tr=1:Ant
        if Prob(i_ger,j_g_tr)<P0
            %局部转移----小动作转移
            M=rand(1,PN)<lamda;
            temp=v(j_g_tr,:)-2.*(v(j_g_tr,:).*M)+M;
        else
            %全局转移----大步伐转移
            M=rand(1,PN)<P0;
            temp=v(j_g_tr,:)-2.*(v(j_g_tr,:).*M)+M;
        end
        %始点和终点重新加入。即不能在移动过程中发生改变。
        temp(:,1)=1;temp(:,end)=1;        
        if short_road_fun(temp,power)<short_road_fun(v(j_g_tr,:),power)
            %记录
            v(j_g_tr,:)=temp;
        end
    end  
    %信息素更新 ，准备下一次迭代
    fit=short_road_fun(v,power);
    T0 = (1-P)*T0+(max(fit)-fit);%信息素蒸发
    [sol,indb]=min(fit);
    v(1,:)=v(indb,:);%记录本次迭代的状态
    media=mean(fit);
    vx=[vx sol];
    vmfit=[vmfit media];
end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%%%% 最后结果
disp(sprintf('\n'));    %空一行
% 显示最优解及最优值
disp(sprintf('Shortroad is %s',num2str(find(v(indb,:)))));%num2str数据转换成字符。
disp(sprintf('Mininum is %d',sol));
v(indb,:)
% 图形显示最优结果
figure(2);grid on;hold on;
plot(fit,'r*');
title('蚂蚁的最终位置');
xlabel('x');
ylabel('f(x)');
% 图形显示最优及平均函数值变化趋势
figure(3);
plot(vx);
title('最优,平均函数值变化趋势');
xlabel('Generations');ylabel('f(x)');
hold on;plot(vmfit,'r');hold off;
runtime=toc%时间结束
end
%%
function fit=short_road_fun(v,power)
[vm vn]=size(v);
fit=zeros(vm,1);%记录每一条路径的距离
for i=1:vm
    I=find(v(i,:)==1);%寻找在路径上的点
    [Im,In]=size(I);
    for j=1:In-1
        fit(i)=fit(i)+power(I(j),I(j+1));%求路径的距离
    end
end
end
%%
%Function init_population
function v=init_population(n1,s1)
v=round(rand(n1,s1));%初始化所有的蚂蚁
end

    