%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    %load inputs
    arg1 = load(MAT_ClusterCentres);
    arg2 = load(MAT_M);
    arg3 = load(MAT_evecs);
    arg4 = load(MAT_evals);
    C = arg1.C; %k by 784
    M = arg2.M; %11 by 784
    Evecs = arg3.EVecs; %784 by 784
    Evals = arg4.EVals; %784 by 1
  
    Dmap = zeros(nbins, nbins);
%     Dmap = task1_7('task1_5_c_2.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);

    %invrted Evecs
    invEv = inv(Evecs');

    %get 2D mean
    meanND = M(11,:);
    mean2D = Evecs*(meanND' - posVec') ; % y = V' (x-p)

    % plot 2D space, dimension 200x200
    Xplot = linspace(mean2D(1)-5*sqrt(Evals(1)), mean2D(1) + 5*sqrt(Evals(1)),nbins)';
    Yplot = linspace(mean2D(2)-5*sqrt(Evals(2)), mean2D(2) + 5*sqrt(Evals(2)),nbins)';
  
    
    thirdD = zeros(782,1);  %the other remaining 782 dimensions uneccessary
 
    
    for i = 1 : nbins
        for j = 1 : nbins
            y = [Xplot(i); Yplot(j); thirdD]; %the NDim
            x2D = invEv * y + posVec'; %get 2D pointss
            [~, index] = min(MySqDist(C, x2D')); %get index of shortest distance between data point and centres    
            Dmap(i,j) = index; % this point in Dmap is this particular class (index)
         
                
        end
    end
    
    Dmap = (reshape(Dmap, nbins, nbins)');
    contourf(flip(Dmap));
    
    k = (extractBetween(MAT_ClusterCentres, 'c_', '.mat'));
    filename = sprintf('task1_7_dmap_%s.mat',k{1});
    imagename = sprintf('task1_7_imgs_%s.pdf',k{1});
    save(filename, 'Dmap');
    
    print(imagename, '-dpdf');

			  
end
