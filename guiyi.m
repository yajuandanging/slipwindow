%归一化初始数据
function y_guiyi=guiyi(x)
% x=importdata('E:\发表\论文发表之基于ARMA模型的软件衰退预测\2010-11-26ARMA预测算法\ResponseData.txt');
for i=1:size(x)
xmin=min(x);
xmax=max(x);
y(i,:)=((x(i,:)-xmin)/(xmax-xmin))*(1.0-0.0);
end
y_guiyi=y;
% dlmwrite('E:\发表\论文发表之基于ARMA模型的软件衰退预测\2010-11-26ARMA预测算法\ResponseData01.txt',y,';');
