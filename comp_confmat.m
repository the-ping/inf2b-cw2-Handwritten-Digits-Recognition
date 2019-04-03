function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
% 



CM = zeros(K,K);
tic
% sort Ypreds
    [Ypreds, idx] = sort(Ypreds, 'ascend');
    % sort Ytrues according to idx
    Ytrues = Ytrues(idx);
    % now each element in Ytrues match up with Ypreds'
for k = 1:K
    for kk = 1:K
        % count those elements that match in Ypreds and Ytrues
        i = 1:length(Ytrues);
        if Ypreds(i) == Ytrues(i)
        correctcounts = sum(Ypreds(i)==k-1); %correct classification
        CM(k,k) = correctcounts;
        else
        wrongcounts = sum(Ypreds(i)==k-1 & (Ytrues(i) == kk-1));
        CM(kk,k) = wrongcounts;
        end
    end

end
toc
   
%accuracy of correct classification
correctos = diag(CM); %extract diagonal of CM, which are the correctly predicted labels
acc = sum(correctos)/length(Ypreds); %those correct over the total
 return;
%     
%     % create array of 1s and 0s, 1s to signify next element is different.
%     difference = diff([Ypreds, max(Ypreds)+1]);
%     % extract indices where 1s occured
%     exindices = find([1, difference]);
%     % calculate distances between the 1s occurences
%     count = diff(exindices);
%     % correseponding integers?
%     y = Ypreds(find(difference))';
%     
    
    

% for k = 1:K
%     % cum countup no. of occurences of k occuring in Ypreds
%     
%        for i = 1:length(Ypreds)
%         count = sum(Ypreds(1:i) == k-1); %# of k's in Ypred
%            for t = 1:K
%             if Ytrues(i) == t-1 %is true label t?
%                 %store the count at tth row of CM for digit k
%                 CM(t,k) = count;
%             end
%            end
%        end
%        
% end
% CM = zeros(K,K);
% 
% for k = 1:K
%        for i = 1:length(Ypreds)
%         count = sum(Ypreds(1:i) == k-1); %# of k's in Ypred
%            for t = 1:K
%             if Ytrues(i) == t-1 %is true label t?
%                 %store the count at tth row of CM for digit k
%                 CM(t,k) = count;
%             end
%            end
%        end
%        
% end


end
