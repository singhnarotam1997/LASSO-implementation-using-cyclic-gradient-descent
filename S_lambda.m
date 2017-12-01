function [ output ] = S_lambda( x,lambda )
% soft thresholding
% lambda = limit  
if (abs(x)>lambda)
  output=sign(x)*(abs(x)-lambda);
else
  output=0;
end


end