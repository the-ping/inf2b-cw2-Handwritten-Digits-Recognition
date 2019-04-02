function [r_zx, idx, Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest

Ypreds = zeros(length(Xtest),length(Ks));

for i=1:length(Ks)
 
    for ii = 1:length(Xtest)
        %dist. first test pt. and each training observation
        r_zx = MySqDist(Xtrain, Xtest(1,:));
%         size(r_zx)
        
        %sort distances ascending
        [r_zx, idx] = sort(r_zx, 2, 'ascend');
%         size(r_zx)
%         size(idx)
        r_zx = r_zx(1:Ks(i)); %keep the first k distances
        idx = idx(1:Ks(i)); %keep the first k indexes
%         size(r_zx)
%         size(idx)
        
        %majority vote on those k indexes
        Ypreds(ii,i) = mode(Ytrain(idx));
        
    end
    
end


end
