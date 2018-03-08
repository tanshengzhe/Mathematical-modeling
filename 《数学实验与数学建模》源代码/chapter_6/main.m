function main()
%粒子群算法
clc
clear
format long;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N =30;    %粒子数目
dt=2;    %时间间隔
vm=30;   %最大速度
w0=0.4;  %权值  下同
w1=0.3;w2=0.5;
width=1024;  %图片的宽
height=768;  %图片的高
MN=1024;    %可容纳的最大数据量
con=1;          %控制计算的是第几个圆的几何中心
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bpos=zeros(5,MN);   %用以保存五个圆的全部像点坐标
file_in=fopen('data.txt','r+');
%以只读方式打开数据文件，
%这里的文件指的是一些像素的坐标，由处理相片后得到
num=1;pos_x=0;pos_y=0;count=1;
[num,count_data]=fscanf(file_in,'%d',[1 1]);
while (~feof(file_in))
    [pos_x,count_data]=fscanf(file_in,'%d',[1 1]);
    if pos_x<=6%控制是否是下个圆的数据
        num=pos_x;
        count=1;
        continue;
    end
    [pos_y,count_data]=fscanf(file_in,'%d',[1 1]);
    if num==5&count>590 break;end%文件读写控制
    bpos(num,count)=pos_x;
    bpos(num,count+1)=pos_y;
    count=count+2;
end
fclose(file_in);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 disp(sprintf('圆心的坐标如下：'));
while con<=5%控制计算机第几个圆的中心
    pos=bpos;
    pos_calc=zeros(N,6);%保存当前位置(x1,x2)，历史最优位置(x3,y4)，当前速度(x5,x6)
    gbest=[100,100];b=[0,0];%粒子群最优位置
    %srand(time(tic));%??????????????
    for i=1:N %初始化30个粒子
        %初始化位置
        pos_calc(i,3)=fix(rand()*width);%//位置  x,
        pos_calc(i,1)=pos_calc(i,3);
        pos_calc(i,4)=fix(rand()*height);%//位置  y
        pos_calc(i,2)= pos_calc(i,4);
        %初始速度
        if rem(rand(),2)==0
            pos_calc(i,5)=fix(rand()*vm);
        else
            pos_calc(i,5)=-fix(rand()*vm);
        end
        if rem(rand( ),2)==0
            pos_calc(i,6)=fix(rand()*vm);
        else
            pos_calc(i,6)=-fix(rand()*vm);
        end
        %比较获得最优位置，与以前的最优相互比较
        if  f(pos_calc(i,1),pos_calc(i,2),con,pos)<f(gbest(1),gbest(2),con,pos) %//获得初始的种群最优位置
            gbest(1)=pos_calc(i,1);gbest(2)=pos_calc(i,2);
        end
    end
    count=0;
    while count<20 %迭代20次，直到误差足够小
        for i=1:N  %更新速度
            vx=w0*(pos_calc(i,3)-pos_calc(i,1))/dt+w1*(gbest(1)-pos_calc(i,1))/dt+w2*pos_calc(i,5);
            vy=w0*(pos_calc(i,4)-pos_calc(i,2))/dt+w1*(gbest(2)-pos_calc(i,2))/dt+w2*pos_calc(i,6);
            if vx>vm  %防止超过最高速度
                pos_calc(i,5)=vm/3;
            else
                pos_calc(i,5)=vx;
            end
            if vy>vm
                pos_calc(i,6)=vm/3;
            else
                pos_calc(i,6)=vy;
            end
        end
        for i=1:N %更新位置
            pos_calc(i,1)=pos_calc(i,1)+pos_calc(i,5)*dt;
            pos_calc(i,2)=pos_calc(i,2)+pos_calc(i,6)*dt;
            if f(pos_calc(i,1),pos_calc(i,2),con,pos)<f(pos_calc(i,3),pos_calc(i,4),con,pos)%更新历史最好位置
                pos_calc(i,3)=pos_calc(i,1);
                pos_calc(i,4)=pos_calc(i,2);%当前和历史更优并更新
            end
            b(1)=gbest(1);
            b(2)=gbest(2);
            if f(pos_calc(i,1),pos_calc(i,2),con,pos)<f(gbest(1),gbest(2),con,pos)
                %当前处于粒子群最优，更新粒子群最优位置
                gbest(1)=pos_calc(i,1);gbest(2)=pos_calc(i,2);
            end
        end
        count=count+1;
    end
    b(1)=fix(gbest(1));gbest(1)=b(1);%坐标取整
    b(2)=fix(gbest(2));gbest(2)=b(2);
    for i=(b(1)-5):(b(1)+5) %//在邻域内计算得到最优解
        for j=(b(2)-5):(b(2)+5)
            if f(i,j,con,pos)<f(gbest(1),gbest(2),con,pos)
                gbest(1)=i;gbest(2)=j;%领域内调整
            end
        end
    end
    disp(sprintf('%d  %d',gbest(1),gbest(2)));
    con=con+1;
end
end
%%
function r=f(x,y,num,pos)%适应度函数，此函数值越大则适应度越小
r=0;
MN=1024;    %可容纳的最大数据量
for i=1:2:MN %求此点到此圆的各像点的距离之和
    if pos(num,i)~=0
        r=r+sqrt((x-pos(num,i))*(x-pos(num,i))+(y-pos(num,i+1))*(y-pos(num,i+1)));
    end
end
end
%%
function pos=init_data()  %初始化数据---从文件中读取
MN=1000;    %可容纳的最大数据量
pos=zeros(5,MN);   %用以保存五个圆的全部像点坐标
file = fopen('data.txt','r+');
if(file~=-1)
    disp('ok');
else
    disp('sorry!');
end
%以只读方式打开数据文件，
%这里的文件指的是一些像素的坐标，由处理相片后得到
num=0;pos_x=0;pos_y=0;count=1;
[num,count_data]=fscanf(file,'%d');
while ~feof(file)
%     if feof(file)
%         break;
%     end
disp('here');
    [pos_x,count_data]=fscanf(file,'%d');
    if pos_x<=6%控制是否是下个圆的数据
        num=pos_x;
        count=1;
        continue;
    end
    [pos_y,count_data]=fscanf(file,'%d');
    pos(num,count)=pos_x;
    pos(num,count+1)=pos_y;
    count=count+2;
end
fclose(file);
pos
end
%%



