function [ output,MSE] = mylinridgereg(X,Y,lambda)
%initially equal weights
alpha=0.1;
[rows,cols]=size(X);
W=zeros(cols+1,1);
Xn=[ones(rows,1) X];
  for it=1:200
     for j=1:cols+1 
        W_n(j,1)=W(j,1)-(alpha*(1/rows)*(sum((Xn*W-Y).*Xn(:,j))+lambda*W(j,1)));
     end
        W=W_n;
  end
error=(Xn*W-Y);
MSE=mean(error.*error);
%fprintf('MSE -> %d RMSE -> %d\n',MSE,sqrt(MSE));
output=W;
end

