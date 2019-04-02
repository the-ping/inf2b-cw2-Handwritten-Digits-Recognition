function Dmap = try_it2(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
    %store loaded inputs
    arg1 = load(MAT_ClusterCentres);
    arg2 = load(MAT_M);
    arg3 = load(MAT_evecs);
    arg4 = load(MAT_evals);
    CC = arg1.C;
    M = arg2.M;
    Evecs = arg3.EVecs; %transpose to column vectors
    Evals = arg4.EVals;
   
%     Dmap = try_it2('task1_5_c_2.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);

    m = mean(Evecs);
    sd = 10;
    Xplot = linspace(m-5*sd, m+5*sd,200)';
    Yplot = linspace(m-5*sd, m+5*sd,200)';
    
    % Obtain the grid vectors for the two dimensions
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
    image(gridX);
%     
%     classes = length(Xv(:));
%     for i = 1:length(gridX) % Apply k-NN for each test point
%         dists = MySqDist(X, gridX(i, :))'; % Compute distances
%         [d, I] = sort(dists, 'ascend');
%         classes(i) = mode(C(I(1:Knn)));
%     end
%     figure;

end