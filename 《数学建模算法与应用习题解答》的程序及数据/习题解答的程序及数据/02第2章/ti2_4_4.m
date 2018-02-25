load sj.txt
fen=sj(:,1:2:20);
gai=sj(:,2:2:20);
for i=1:4
    for j=1:10
        zhun(i,j)=fen(4*i-3:4*i,j)'*gai(4*i-3:4*i,j);
    end
end
dlmwrite('data2_2.txt',zhun)
