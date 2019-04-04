function covans = myCov(X)
    N = length(X);
    meanshift = bsxfun(@minus, X, myMean(X));
    covans = 1/(N-1) * (meanshift'*meanshift);
end