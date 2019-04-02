function val = myMean(Xs,d) %d - dimension
    if nargin <2
        val = sum(Xs)/(length(Xs));
    else
        val = sum(Xs,d)/(length(Xs)); %if N-1, produce diff answers from mean() 
    end
end
