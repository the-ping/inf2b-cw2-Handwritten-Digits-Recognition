%
%
function Dmap = task2_2(X, Y ,k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.


%Dmap = task2_2(Xtrn(1:2000,:), Ytrn(1:2000,:), 3, 'task1_3_evecs.mat', 'task1_3_evals.mat', mean(Xtrn), 200);


    %load inputs012
    arg3 = load(MAT_evecs);
    arg4 = load(MAT_evals);
 
    Evecs = arg3.EVecs; %784 by 784
    Evals = arg4.EVals; %784 by 1
    
    %get 2D mean
    meanND = myMean(X);
    mean2D = Evecs*(meanND - posVec') ; % y = V' (x-p)
  
    Dmap = zeros(nbins, nbins);
 
    % plot 2D space, dimension 200x200
    Xplot = linspace(mean2D(1)-5*sqrt(Evals(1)), mean2D(1) + 5*sqrt(Evals(1)),nbins)';
    Yplot = linspace(mean2D(2)-5*sqrt(Evals(2)), mean2D(2) + 5*sqrt(Evals(2)),nbins)';
 
    % Obtain the grid vectors for the two dimensions
    [Xv Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
 
    %2D data points from ND
    x2D = (Evecs(:,1:2) * gridX' + posVec')'; %784 by 40K

    yp = run_knn_classifier(X, Y, x2D, k);
    Dmap = (reshape(yp, nbins, nbins)');
    contourf(flip(Dmap));
    
    filename = sprintf('task2_2_dmap_%d.mat',k);
    imagename = sprintf('task2_2_imgs_%d.pdf',k);
    save(filename, 'Dmap');
    
    print(imagename, '-dpdf');

end
