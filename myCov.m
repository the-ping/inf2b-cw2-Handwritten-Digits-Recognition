function covans = myCov(X)
    N = length(X);
    covans = 1/(N-1) * (X'*X);
end