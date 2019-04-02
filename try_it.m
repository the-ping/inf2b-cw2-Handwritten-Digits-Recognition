

function try_it(X, Ks) %%task1_5
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours



for i = 1:length(Ks)
    initC = X(1:Ks(i),:); %first k points of X
    [C, idx, SSE] = my_kMeansC(X, Ks(i), initC);
        
        str = sprintf('SSE for k=1,2,3,4,5,7,10,15,20');
        title(str);
        ylabel('SSE'); 
        xlabel('Iteration number');
        hold on;
        plot(SSE);
        
   
    %save variables
    f1 = sprintf('task1_3_c_%d.mat', Ks(i));
    f2 = sprintf('task1_3_idx_%d.mat', Ks(i));
    f3 = sprintf('task1_5_sse_%d.mat', Ks(i));
    save(f1,'C');
    save(f2,'idx');
    save(f3,'SSE');
    
end
    hold off;
    legend('k = 1', 'k = 2', 'k = 3', 'k = 4', 'k = 5', 'k = 7', 'k = 10', 'k = 15', 'k = 20')

    filename = sprintf('SSE for k=1,2,3,4,5,7,10,15,20');
    print(filename, '-dpdf');
end

function [C, idx, SSE] = my_kMeansC(X, k, initialCentres, maxIter) %%my_kMeansClustering
 if nargin < 4
    maxIter = 500;
 end

N = size(X,1);
D = zeros(k, N); %kxN matrix store distances between centres and obsv.
idx_prev = zeros(1,N);
SSE = zeros(maxIter+1,1);

for i = 1 : maxIter
   
    %compute sq distance between each cluster centre and each observation
    c = 1:k;
    D(c,:) = MySqDist(X, initialCentres(c,:));
    
    
    %Ds - distances of data point to their resp. cluster centre
    %,idx - cluster assignments 
    if k ==1
        [Ds, idx] = min(D);
        Ds = D;
    else
        [Ds, idx] = min(D);
    end
    
    %update cluster centres
     for c = 1:k
        if (sum(idx==c) ==0)
            warning('k-means: cluster %d is empty', c);
        else
           initialCentres(c, :) = myMean( X(idx==c,:)); 
        end
     end
  
     SSE(i,1) = sum(Ds);
     
         %check for convergence
         if isequal(idx_prev, idx) && isequal(initialCentres_prev, initialCentres)
             SSE = SSE(1:i,1);
             break
         end
%      ( sum( abs(idx - idx_prev) ) == 0);
         %update previous assignment vector with current
         idx_prev = idx;
         initialCentres_prev = initialCentres;
     
%      %early stopping
%      if isequal(initialCentres_prev, initialCentres) && isequal(idx_prev, idx)
%          SSE = SSE(1:i,1);
%          break
% 
%      end
    
     
end
    C = initialCentres;
end


% % function [EVecs, EVals] = try_it(X)
% % % Input:
% % %  X : M-by-D data matrix (double)
% % % Output:
% % %  EVecs, Evals: same as in comp_pca.m
% % %  CumVar  : D-by-1 vector (double) of cumulative variance
% % %  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
% % %            to cover 70%, 80%, 90%, and 95% of the total variance.
% % [EVecs, EVals] = comp_pca(X);
% % PC_X = double(X) * EVecs;
% % CumVar = cov(PC_X);
% % %show data in original basis
% % % scatter(X(:,1), X(:,2));
% % % xlabel('x'); ylabel('y');
% % % axis([-400 400 -400 400])
% % hold on;
% % %plot first new basis?
% % % hh = refline(EVecs(2,1)/EVecs(1,1), 0);
% % % hh.Color = 'r';
% % % hold on;
% % %Plot second new basis?
% % 
% % 
% % end
% % 
% % 
% % 
% % 
% % 
% % % function M = try_it(X,Y)
% % %  
% % % M = cell(11,1); %array to store 11 blurry iamges
% % % for d = 1:11
% % %     array = collect(X,Y,d-1); %an array of 10 0's
% % %     Data = cat(3,array{:}); %concatenate cell array
% % %     %arrays into 3D array (of type unint8)
% % % %     mu = mean(double(Data));%convert to type double to be able to mean/ gives 
% % %     %D = double(Data); %28x28x10 double
% % %     mu = uint8(mean(Data,3)); %average each element in array, type uint8 for blurry
% % %     M{d} = mu;
% % % %     mean(array{1},array{2});
% % %     %     avg = mean(allData,4);
% % % %     M = image(avg);
% % % %     k = input('Hit return: ', 's');
% % % %     disp(d-1);
% % % %     data = montage(array);
% % % %     fnm = sprintf('file_%d.mat',d);
% % % %     save(fnm,'data');
% % % %     
% % % 
% % % end
% % % % M = allData;
% % % function C = collect(X, Y, digit) %collects 10 versions of 0's
% % % 
% % %         C = cell(size(X,1),1);
% % %         %C = cell(10, 1) ; %store each matrix in a 10x1 array
% % %         k = 1;
% % %         i = 1;
% % %         if digit == 10
% % %             while i<size(X,1)
% % %                 C{k} = reshape(X(i,:)*255.0, 28, 28)';
% % %                 i = i + 1;
% % %                 k = k + 1; 
% % %             end
% % %         end
% % %                 
% % %         while i<size(X,1)   
% % %                 if Y(i) == digit %collect images of this digit only 
% % %                     C{k} = reshape(X(i,:)*255.0, 28, 28)';
% % %                     i = i + 1;
% % %                     k = k + 1; 
% % %                 else
% % %                     i = i + 1;
% % %                 end
% % % 
% % %         end
% % %     end
% % %  
% % % end
