%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  if nargin < 3
      
  end
  
  %% TO-DO
N = size(X,1);
D = zeros(k, N); %kxN matrix store distances between centres and obsv.
idx_prev = zeros(1,N);
SSE = zeros(maxIter+1,1);

for i = 1 : maxIter
   
    %compute sq distance between each cluster centre and each observation
    for c = 1:k
        D(c,:) = MySqDist(X, initialCentres(c,:));
    end
    
    %Ds - distances of data point to their resp. cluster centre
    %,idx - cluster assignments 
    if k ==1
        [Ds, idx] = min(D);
        Ds = D;%when k==1, min(D) gives a 1x1 result. Hence, this to avoid.
    else
        [Ds, idx] = min(D);
    end

    %update cluster centres
     for c = 1:k
        if (sum(idx==c) ==0)
            warning('k-means: cluster %d is empty', c);
        else
            if k == 1
                C = mean(X);
            else
                initialCentres(c, :) = myMean( X(idx==c,:));
                C = initialCentres;
            end
          
        end
     end
  
     SSE(i,1) = sum(Ds);
     
         %check for convergence
         if isequal(idx_prev, idx) && isequal(initialCentres_prev, initialCentres)
             SSE = SSE(1:i,1);
             break
         end
%      ( sum( abs(idx - idx_prev) ) == 0);
         %update previous assignment vector with current
         idx_prev = idx;
         initialCentres_prev = initialCentres;
     
%      %early stopping
%      if isequal(initialCentres_prev, initialCentres) && isequal(idx_prev, idx)
%          SSE = SSE(1:i,1);
%          break
% 
%      end
    
     
end
    
end
