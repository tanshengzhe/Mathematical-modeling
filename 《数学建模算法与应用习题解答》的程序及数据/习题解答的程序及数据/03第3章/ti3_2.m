fun3_1=@(delta) sum(delta.^2); %定义目标函数的匿名函数
[del,val]=fmincon(fun3_1,rand(6,1),[],[],[],[],-30*ones(6,1),30*ones(6,1),@fun3_2)
