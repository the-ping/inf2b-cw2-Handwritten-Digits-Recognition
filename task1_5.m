%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

% elapsedTime = zeros(length(Ks),1); %array store runtimes for each k
Legend=cell(length(Ks),1); %store legends for each k
for i = 1:length(Ks)
tic
    initC = X(1:Ks(i),:); %first k points of X
    [C, idx, SSE] = my_kMeansClustering(X, Ks(i), initC);
        
        str = sprintf('SSE for k=1,2,3,4,5,7,10,15,20');
        title(str);
        ylabel('SSE'); 
        xlabel('Iteration number');
        hold on;
        plot(SSE);
  
    %save variables
    f1 = sprintf('task1_5_c_%d.mat', Ks(i));
    f2 = sprintf('task1_5_idx_%d.mat', Ks(i));
    f3 = sprintf('task1_5_sse_%d.mat', Ks(i));
    save(f1,'C');
    save(f2,'idx');
    save(f3,'SSE');
toc
elapsedTime = toc;   
txt = sprintf('k = %d, runtime = %.5f sec',i,elapsedTime);
Legend{i} = (txt);

end
legend(Legend);
%     hold off;
%     legend('k = 1 with', 'k = 2', 'k = 3', 'k = 4', 'k = 5', 'k = 7', 'k = 10', 'k = 15', 'k = 20')

    filename = sprintf('SSE for k=1,2,3,4,5,7,10,15,20');
    print(filename, '-dpdf');
end


