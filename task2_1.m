%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
tic
[yp] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
time = toc


for K = 1:length(Ks)
    [cm, acc] = comp_confmat(Ytest, yp(:,K), 10);
    filename = sprintf('task2_1_cm%d.mat', Ks(K));
    save(filename, 'cm');
    wrongs = length(Ytest) - trace(cm);
   

%     diag(cm)
%     sum(diag(cm))
%     wrongs
    
    display(strcat('k= ' , int2str(Ks(K)))); % 1.no. of nearest neighbors
    display(strcat('N= ', int2str(length(Xtest)))); % no. of test samples
    display(((wrongs))); %no. of wrong classifications
    display((acc)); %correct classification rate
    
    
    
end




end
