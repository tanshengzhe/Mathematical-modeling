function ti12_2_1
global M N L
N=379; M=24; L=M*N;
[x,fval]=ga(@fun12_2_1,L,[],[],[],[],zeros(L,1),ones(L,1),@fun12_2_2)
%*************************************************
%目标函数
%*************************************************
function f=fun12_2_1(x);
global M N L
f=0; x=reshape(x,[M,N]);
for j=1:N-1
    for t=j+1:N
        f=f+x(:,j)'*x(:,t);
    end
end
for i=1:M-1
    for k=i+1:M
        f=f+x(i,:)*x(k,:)';
    end
end

%*************************************************
%非线性约束条件函数
%*************************************************
function [c,ceq]=fun12_2_2(x);
global M N
x=reshape(x,[M,N]); alpha=2; k=1;
for i=1:M
    c(k)=-sum(x(i,:))+4*N/M-alpha;
    c(2*k-1)=sum(x(i,:))-4*N/M-alpha; k=k+1;
end
k=2*M+1;
for j=1:N-1
    for t=j+1:N
        c(k)=x(:,j)'*x(:,t)-3;
        k=k+1;
    end
end
for j=1:N
    ceq(j)=sum(x(:,j))-4;
end
