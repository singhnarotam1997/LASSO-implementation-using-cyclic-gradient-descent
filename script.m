clc
k=2;
new_data=data(:,1:end-1);
labels=data(:,end);
% initially beta = 0;
for t=2:-.1:0
    t;
    [beta(:,k),er(:,k)]=cyclic_descent(new_data,labels,t,'less');
    k=k+1;
end
beta(:,1)=0;
mod=sqrt(sum(beta.^2));
ratio=mod/mod(end);
figure;
for i=1:size(beta,1)
    i;
plot(ratio,beta(i,:));
hold on
end
%title('Graph between lambda and RMS error');
xlabel('ratio of calculated weights to ridge regression weights');
ylabel('values of weights');
%%%%%% cross validation k-fold here k=10
[instances,dims]=size(new_data);
% standardisation of data
labels=labels-mean(labels);
new_data=new_data-mean(new_data);
s=sum(new_data.^2);
for i=1:size(s,2)
if (s(i)>10^-10)
    new_data(:,i)=new_data(:,i)/(sqrt(s(i)/instances));
end
end
[out]=cross_validation(10,new_data,labels);
figure;
plot(2:-0.2:0,out);
title('Graph between lambda and RMS error');
xlabel('lambda');
ylabel('RMSE');


%%%%%% for non-lasso solution
k=2;
for t=2:-.1:0
    t;
    [beta2(:,k),er2(:,k)]=mylinridgereg(data(:,1:end-1),data(:,end),t);
    k=k+1;
end
beta2(:,1)=0;
mod2=sqrt(sum(beta2.^2));
ratio2=mod2/mod2(end);
figure;
for i=1:size(beta2,1)
    i;
plot(ratio2,beta2(i,:));
hold on
end
%title('Graph between lambda and RMS error');
xlabel('ratio of calculated weights to ridge regression weights');
ylabel('Values of weights');
% after choosing lambda = 0.6 for the final lasso 
[betaf,errf]=cyclic_descent(data(:,1:end-1),data(:,end),0.6,'full');
