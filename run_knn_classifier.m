function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest

Ypreds = zeros(length(Xtest),length(Ks));
for i=1:length(Ks)
    k = Ks(i); %# of clusters
    C = my_kMeansClustering(Xtrain,k); %corr. class labels for each training pt.
    Xtrain = cat(2, Xtrain, C);%concat labels to the training data
    
    for ii = 1:length(Xtest)
        %dist. first test pt. and each training observation
        r_zx = MySqDist(Xtrain, Xtest(ii,:));
        %sort distances ascending
        [r_zx, idx] = sort(r_zx, 2, 'ascend');
        
        r_zx = r_zx(1:Ks(i)); %keep the first k distances
        idx = idx(1:Ks(i)); %keep the first k indexes
        
        %majority vote on those k indexes
        Ypreds(ii,i) = mode(C(idx));
        
    end
    
end


end
