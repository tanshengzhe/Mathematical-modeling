clear
n=50000
X=rand(n,1);
Y=rand(n,1);   
k=0;
for i=1:n;
    if X(i)^2+Y(i)^2<=1
       k=k+1;
    end
end
4*k/n
