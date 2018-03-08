function example7_7()
%建立主函数shark.m运行得到下图：
    [t1,x]=ode45(@shier1,[0 15],[25 2]);         
    [t2,y]=ode45(@shier2,[0 15],[25 2]);   
    x1=x(:,1);x2=x(:,2); x3=x2./(x1+x2);
    y1=y(:,1);y2=y(:,2); y3=y2./(y1+y2);
    plot(t1,x3,'-',t2,y3,'*')
%%
function dx=shier1(t,x)
    dx=zeros(2,1); 
    dx(1)=x(1)*(0.7-0.1*x(2));
    dx(2)=x(2)*(-0.8+0.02*x(1));
%%
function dy=shier2(t,y)
    dy=zeros(2,1); 
    dy(1)=y(1)*(0.9-0.1*y(2));
    dy(2)=y(2)*(-0.6+0.02*y(1));

