function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest


Ypreds = zeros(length(Xtest), 1);
d = sqrdist(Xtest, Xtrain); %size: 3985 x 42024

    for k=1:length(Ks)
        knn = Ks(1,k);
        [sortedd, idx] = sort(d, 1);
        newidx = idx(:,1:knn);
        class = Ytrain(newidx);
        %loop over Ypreds?
        Ypreds(:,k) = mode(class,2);
    end

end

