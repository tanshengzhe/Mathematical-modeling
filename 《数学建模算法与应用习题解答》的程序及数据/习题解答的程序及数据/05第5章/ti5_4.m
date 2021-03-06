clc, clear
a=load('data53.txt');
t0=a(:,[1,3]); t0=t0(:); %提出时间数据，并展开成列向量
h0=a(:,[2,4]); h0=h0(:); %提出高度数据，并展开成列向量
hs=0.3024; %单位换算数据
D=57*hs;  %水塔直径，单位m
h=h0/100*hs; %高度数据，单位换算成m
t=t0/3600; %时间单位化成小时
V=pi/4*D^2*h; %计算各时刻的体积
dv=gradient(V,t); %计算各时刻的数值导数（导数近似值）
no1=find(h0==-1) %找出原始无效数据的地址
no2=[no1(1)-1:no1(2)+1,no1(3)-1:no1(4)+1] %找出导数数据的无效地址
tt=t; tt(no2)=[]; %删除导数数据无效地址对应的时间
dv2=-dv; dv2(no2)=[]; %给出各时刻的流速
plot(tt,dv2,'*') %画出流速的散点图
pp=csape(tt,dv2); %对流速进行插值
tt0=0:0.1:tt(end); %给出插值点
fdv=ppval(pp,tt0); %计算各插值点的流速值
hold on, plot(tt0,fdv) %画出插值曲线
I=trapz(tt0(1:241),fdv(1:241)) %计算24小时内总流量的数值积分
