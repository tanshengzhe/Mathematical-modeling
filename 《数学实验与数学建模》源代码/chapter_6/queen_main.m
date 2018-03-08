function queen_main()
count=anpai_queen();
disp(sprintf('一共：%d组摆放方法',count));
end
%%
function count=anpai_queen()
count=0;k=1;N=8;
x(k)=0;
while(k>=1)
    x(k)=x(k)+1;%开始计数
    while x(k)<=N&~canbeplace(k,x)
        x(k)=x(k)+1;%表示已经放置了一个棋子
    end
    if x(k)>N   %回溯
        k=k-1;
    else
        if k==N
            %%%%%%%%%%%%%%%%%%%%%%
            printresult(x);%打印一组解
            %%%%%%%%%%%%%%%%%%%
            count=count+1;
        else
            k=k+1;
            x(k)=0;%进行下一次迭代
        end
    end
end
end
%%
function flag=canbeplace(k,x)
flag=1;
for i=1:k
    if i~=k
    if ((x(i)==x(k))|(abs(x(i)-x(k))==abs(i-k)))%隐式约束
        flag=0;
    end
    end
end
end
%%
function printresult(x)
board=zeros(8,8);N=8;
for i=1:N
    board(i,x(i))=1;
end
disp(board);
end
%%


        