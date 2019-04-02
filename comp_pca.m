function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO
    N = length(X); %no. of observations
    colmean = myMean(X,1); %mean of each column
    X = bsxfun(@minus,(X), colmean); %mean shift the original matrix
    covar_m = 1/(N-1) * (X'*X); %covariance matrix of X
    [EVecs, EVals] = eig(covar_m);
    EVals = diag(EVals); %extract diagonal  of matrix as vector
    [tmp, ridx] = sort(EVals, 1, 'descend'); %sort variances in decreasing order
    EVals = EVals(ridx);
    EVecs = EVecs(:,ridx);
    
    %%extra constraints:
    EVecs(1,:) = abs(EVecs(1,:));%first element of each eigenvector is non negative
    
end

