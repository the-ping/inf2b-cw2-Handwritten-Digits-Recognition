%
%
function ClassStorage = task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)


%transform X to the 2D space, spanned by the first 2 principal
%components

%get PCA
[evecs, evals] = comp_pca(X);

%map X onto 2D space
mappedX = X * evecs(:, 1:2);

%calculate (1) CovarianceMatrix, and (2) mean vector of each class
means = zeros(10,2); %there are 2 means = 2 centres -> xcentre vs ycentre
covmats = zeros(2,2,10); %2 by 2 because we care only t   

%store data by according to their classes
ClassStorage = cell(10,1); %there are 10 classes
for i = 1:10
    thatClass = mappedX(Y == i-1,:);
    ClassStorage(i,1) = {thatClass};
    selectedX = cell2mat(ClassStorage(i)); %10 by 1 to be 10 by 874
    means(i,:) = myMean(selectedX);
    %updated X with mean?
    covmats(:,:,i) = myCov(selectedX);

end
% 
% 
%                             
% 
% for i = 1:10
%     selectedX = cell2mat(ClassStorage(i)); %10 by 1 to be 10 by 874?
%     means(i,:) = myMean(selectedX(i,:));
%     %updated X with mean?
%     covmats(:,:,i) = myCov(mappedX);
% 
% end



%Step3. Plot contour of distribution for each class
%Notes:
% - use plot(), not contour()
% - lengths of axes of ellipse should be proportional to standard deviation
%  for the axis


figure;
hold on;
t = linspace(0, 2*pi,360); %theta

for i = 1:10
%      thatClass = mappedX(Y == (i-1),:);
%      [covmats, means] = [myCov(thatClass);
%     
%      size(covmats)
%      covmats
%      return
     
    %initialise mu and Sigma
    mu = means(i,:); %centres, mu(1) x-centre, mu(2) y-centre
    Sigma = diag(covmats(:,:,i)).^0.5; %radius aka sd
   
    %angle of rotation, orientation of ellipse
    p = covmats(2,1,i) / (covmats(1,1,i)*covmats(2,2,i)^0.5);
    tan = 1/p;
    alpha = atan(tan);
    
    %https://uk.mathworks.com/matlabcentral/answers/129273-to-plot-an-ellipse
%     x = Sigma(1) * cos(t) + mu(1);
%     y = Sigma(2) * sin(t) + mu(2);
    
%     x = @(t)Sigma(1) * cos(t) * cos(alpha) - Sigma(2) * sin(t) * sin(alpha) + mu(1);
%     y = @(t)Sigma(1) * cos(t) * sin(alpha) + Sigma(2) * sin(t) * cos(alpha) + mu(2);
%     
       
    x = Sigma(1) * cos(t) * cos(alpha) - Sigma(2) * sin(t) * sin(alpha) + mu(1);
    y = Sigma(1) * cos(t) * sin(alpha) + Sigma(2) * sin(t) * cos(alpha) + mu(2);
    
%     xs = arrayfun(x, t);
%     ys = arrayfun(y,t);
%     
    
    plot(x,y);
    ylabel('2nd principal component'); xlabel('1st principal component')
    
    xn = mu(1);
    yn = mu(2);
    
    text(xn, yn, num2str(i-1));
    
%     %get radii
%     var = diag(Sigma);
%     % keep the max variance
%     maxsd = max(var(1), var(2));
    
   
end



end
