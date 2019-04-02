function sq_dist = MySqDist(U, v)
    %compute 1xM row vector of sq distances for MxN(U) and 1xN(v) data U and v,
    sq_dist = sum(bsxfun(@minus, U,v).^2, 2)';
   
end