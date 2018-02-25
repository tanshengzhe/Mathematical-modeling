[i,j,b]=find(a);
data=[i';j';b'];
index=data(1:2,:);
result=[];
loop=length(a)-1;
while length(result)<loop
    temp=min(data(3,:));
    flag=find(data(3,:)==temp);
    flag=flag(1);
    v1=index(1,flag);v2=index(2,flag);
    if v1~=V2
        result=[result,temp];
    end
    index(find(index==v2))=v1;
    index(:,flag)=[];
    data(:,flag)=[];
end