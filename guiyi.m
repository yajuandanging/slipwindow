%��һ����ʼ����
function y_guiyi=guiyi(x)
% x=importdata('E:\����\���ķ���֮����ARMAģ�͵����˥��Ԥ��\2010-11-26ARMAԤ���㷨\ResponseData.txt');
for i=1:size(x)
xmin=min(x);
xmax=max(x);
y(i,:)=((x(i,:)-xmin)/(xmax-xmin))*(1.0-0.0);
end
y_guiyi=y;
% dlmwrite('E:\����\���ķ���֮����ARMAģ�͵����˥��Ԥ��\2010-11-26ARMAԤ���㷨\ResponseData01.txt',y,';');
