function m=slipewindow(SD,inputdatalist)
InputTrainData=inputdatalist(:,1);
m=length(InputTrainData);
w1=rand(3,SD);
w2=rand(1,3);
b1=rand(3,1);
b2=rand();            

TrainDataInput=[];
TrainDataOutput=[];
for f=1:6
    InputTrainData=inputdatalist(:,f);
for n=1:(m-SD)                 
    for j=n:n+SD-1  
       SubInputTrainData(j-n+1,n)=InputTrainData(j);
    end;
        SubOutputTrainData(n)=InputTrainData(j+1);     
 end;
 TrainDataInput=[TrainDataInput,SubInputTrainData];
 TrainDataOutput=[TrainDataOutput,SubOutputTrainData];
end
clear SubInputTrainData SubOutputTrainData pr;
SubInputTrainData=TrainDataInput;
SubOutputTrainData=TrainDataOutput;
%%
%
       pr=minmax(SubInputTrainData);
       net=newff(pr,[3,1],{'logsig','purelin'},'trainlm');
       net.iw{1,1} = w1;
       net.b{1}    = b1;
       net.lw{2,1} = w2;
       net.b{2}    = b2;
       EP=net.trainParam.epochs;                    
       r=net.layers{1}.size;     
 %%    
   for r=3:12 
        net=newff(pr,[r,1],{'logsig','purelin'},'trainlm');
        net = init(net);        
        net.iw{1,1};
        net.b{1};
        net.iw{2,1};
        net.b{2};                                
         EP=0;
         perf = 0;
        while  (( EP<10 ) || (perf>0.5)) 
            net=train(net,SubInputTrainData,SubOutputTrainData);  
            y = sim(net,SubInputTrainData);
            e = SubOutputTrainData-y;
            perf = mse(e);
            EP=EP+1;
        end;
        w1=net.iw{1,1};                                
        b1=net.b{1};                                  
        w2=net.lw{2,1};
        b2=net.b{2};
        %继续进行的
        %1保存当前的神经网络的各个参数
        %2 使用MSE 计算MSE，求解出最小的M，返回
        [TL,x,e]=smpre(net,w1,b1,w2,b2,m,r,SD,l); 
        
        TLC(r,:)=TL(r,:);
        xC(r,:)=x(r,:);
        EE(r,:)=e;
  end;