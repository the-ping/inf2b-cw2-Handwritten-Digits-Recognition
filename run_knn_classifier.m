function r_zx = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest



Ypreds = zeros(length(Xtest),length(Ks));
DI = zeros(length(Xtest),length(Xtrain)); %store distances of each test point from training points
% for i=1:length(Ks)
    
        %obtain matrix d of distances between Xtraining and Xtesting
        DI = sqd(Xtest, Xtrain);
        
    function d = sqd(Xte, Xtr)
        %Xte : N by D, N-# test instances
        %Xtr : M by D, M-# train
        [N,~] = size(Xte);
        [M,~] = size(Xtr);
        d = zeros(N, M);
        i = 1:N;
        j = 1:M;
        d(i,j) = abs(Xte(i,:)-Xtr(j,:)).^2;
    end
        
        %sort distances ascending
%         [r_zx, idx] = sort(r_zx, 2, 'ascend'); %[B,I] = sort(__) B=A(I)
%         
%         r_zx = r_zx(1:Ks(i)); %keep the first k distances
%         idx = idx(1:Ks(i)); %keep the first k indexes
%    
%         %majority vote on those k indexes 
%         class = Ytrain(idx); %re-arrange labels in Ytrain,
%         Ypreds(ii,i) = mode(class);
%         
%     end
%     
% end


end
