function try_it2(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
    %load inputs
    arg1 = load(MAT_ClusterCentres);
    arg2 = load(MAT_M);
    arg3 = load(MAT_evecs);
    arg4 = load(MAT_evals);
    C = arg1.C;
    M = arg2.M;
    Evecs = arg3.EVecs; %transpose to column vectors
    Evals = arg4.EVals;
   
%     Dmap = try_it2('task1_5_c_2.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);

    Xplot = linspace(-5*sqrt(Evals(1)), 5*sqrt(Evals(1)),nbins)';
    Yplot = linspace(-5*sqrt(Evals(2)), 5*sqrt(Evals(2)),nbins)';
    
    % Obtain the grid vectors for the two dimensions
    [Xv Yv] = meshgrid(Xplot, Yplot); %200x200. both
    gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point. %becomes40000x2.
    
    size(gridX)
    size(Evecs)
    pos = (Evecs(:,1:2))*(gridX)' + posVec';
    size(pos)
    size(C)
    
    Dmap = zeros();
    dist2 = zeros();
    
    for i = 1:length(C)
        dist2 = MySqDist(C(i), pos');
        [~,Dmap(i)] = min(dist2);
    end
     
      
  cmap = [0.80369089, 0.61814689, 0.46674357;
0.81411766, 0.58274512, 0.54901962;
0.58339103, 0.62000771, 0.79337179;
0.83529413, 0.5584314 , 0.77098041;
0.77493273, 0.69831605, 0.54108421;
0.72078433, 0.84784315, 0.30039217;
0.96988851, 0.85064207, 0.19683199;
0.93882353, 0.80156864, 0.4219608 ;
0.83652442, 0.74771243, 0.61853136;
0.7019608 , 0.7019608 , 0.7019608];

    colormap(cmap);
    imshow(Dmap/size(C,1));
    return
    [~,Dmap] = min(dist);
           

    
  cmap = [0.80369089, 0.61814689, 0.46674357;
0.81411766, 0.58274512, 0.54901962;
0.58339103, 0.62000771, 0.79337179;
0.83529413, 0.5584314 , 0.77098041;
0.77493273, 0.69831605, 0.54108421;
0.72078433, 0.84784315, 0.30039217;
0.96988851, 0.85064207, 0.19683199;
0.93882353, 0.80156864, 0.4219608 ;
0.83652442, 0.74771243, 0.61853136;
0.7019608 , 0.7019608 , 0.7019608];

    colormap(cmap);
    imshow(Dmap/size(C,1));
% 
% for i = nbins
%     xs = (Evecs*gridX(i))' + posVec;
% end


% 
%     
%     
%     dist = MySqDist(xs, C); % distance between clusterCentres (2D) and the points generated in xs (on th 2D plane)
%     
%     min(dist); %the clusster centre the data point is closest to, hence,
%     
%     
%     
    
    
end