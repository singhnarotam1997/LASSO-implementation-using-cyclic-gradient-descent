function out = cross_validation( folds,data,labels)
% data -> (#instances)X(#dimensions) 
[instances,dimensions]=size(data);
index=randperm(instances);
bag_size=round(instances/folds);
out=[1,2,3]';
p=1;
for t=2:-.2:0
k=1;
 for i=1:bag_size:instances
   if(i+bag_size-1<=instances) 
   test_data=data(index(i:i+bag_size-1),:);
   test_labels=labels(index(i:i+bag_size-1),:);
   train_data=data(setdiff(index(1:instances),index(i:i+bag_size-1)),:);
   train_labels=labels(setdiff(index(1:instances),index(i:i+bag_size-1)),:);
   else
   test_data=data(index(i:instances),:);
   test_labels=labels(index(i:instances),:);
   train_data=data(setdiff(index(1:instances),index(i:instances)),:);
   train_labels=labels(setdiff(index(1:instances),index(i:instances)),:);        
   end
%    disp(test_data)
%    disp(test_labels)
%    disp(train_data)
%    disp(train_labels)
   [model]=cyclic_descent(train_data,train_labels,t,'less');
   predictions=test_data*model;
   err(k)=mean((predictions-test_labels).^2);
   k=k+1;
   
end
out(p,1) = mean(mean(err));
p=p+1;
end

end

