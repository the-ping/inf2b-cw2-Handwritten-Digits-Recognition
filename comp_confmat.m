function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
% 

N = length(Ytrues);
CM = zeros(K,K);

for k = 1:N
    yt = Ytrues(k) + 1;
    yp = Ypreds(k) + 1;
    
    %store increase count when match
    CM(yt, yp) = CM(yt, yp) + 1;
    
end

%no. of correct classifications / trace = sum of diagonal elements
acc  = trace(CM)/N;



end