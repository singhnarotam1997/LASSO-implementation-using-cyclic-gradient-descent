function [beta,er ] = cyclic_descent(X,Y,lambda,string)
new_data=X;
labels=Y;
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
new_data1=new_data;
beta = ones([dims,1]);
indx=1:dims;%randperm(dims);
k=1;
for epochs=1:100
    epochs;
    for i=1:dims
        p=mean(1*(labels-new_data*beta).*(new_data(:,indx(i))));
        beta(indx(i))=S_lambda(beta(indx(i))+p,lambda);   
    end
    
    er(k,1)= sqrt(mean((labels-new_data*beta).^2));
    k=k+1;
end
if (strcmp(string,'full'))
%relaxed lasso 
lambda=0;
ind=find(abs(beta)>0);
new_data=new_data(:,ind);
dims=size(new_data,2);
beta1 = ones([dims,1]);
indx=randperm(dims);
k=1;
for epochs=1:100
    epochs;
    for i=1:dims
        p=mean(1*(labels-new_data*beta1).*(new_data(:,indx(i))));
        beta1(indx(i))=S_lambda(beta1(indx(i))+p,lambda);   
    end
    
    er(k,2)= sqrt(mean((labels-new_data*beta1).^2));
    k=k+1;
end
b=beta;
b(ind)=beta1;
beta(:,2)=b;
%%%%%%%% for complete solution without lasso
lambda=0;
dims=size(new_data1,2);
beta2 = ones([dims,1]);
indx=randperm(dims);
k=1;
for epochs=1:100
    epochs;
    for i=1:dims
        p=mean(1*(labels-new_data1*beta2).*(new_data1(:,indx(i))));
        beta2(indx(i))=S_lambda(beta2(indx(i))+p,lambda);   
    end
    
    er(k,3)= sqrt(mean((labels-new_data1*beta2).^2));
    k=k+1;
end
beta(:,3)=beta2;

end

end

