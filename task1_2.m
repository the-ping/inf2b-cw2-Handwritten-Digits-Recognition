%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
M = zeros(0, 28*28); %array to store 11 blurry iamges
Mfinal= zeros(28,28,0);
for d = 1:10
    Data = X(Y ==(d-1),:); %concatenate to get array Data
 
    mu = (myMean(Data)); %average each element in array (uint8 type makes image blurry if Xtrn not /255)
  
    M(d,:) = mu;
    Mfinal(:,:,d) = reshape(mu, 28, 28)';

end

    M(11,:) = myMean(X);
    Mfinal(:,:,11) = reshape(myMean(X), 28, 28)';
    
    
    
end
