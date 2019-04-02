%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

[EVecs, EVals] = comp_pca(X);
% PC_X = X*EVecs;

CumVar = cumsum(EVals);
ylabel('Cumulative variance'); xlabel('# of principal components')
plot(CumVar)

TotVar = CumVar(length(CumVar));
MinDims = [TotVar() * 0.7; TotVar(1) * 0.8; TotVar(1) * 0.9; TotVar(1) * 0.95];

%save 4 variables as .mat files
% f1 = sprintf('task1_3_evecs.mat');
% f2 = sprintf('task1_3_evals.mat');
% f3 = sprintf('task1_3_cumvar.mat');
% f4 = sprintf('task1_3_mindims.mat');
% save(f1,'EVecs');
% save(f2,'EVals');
% save(f3,'CumVar');
% save(f4,'MinDims');
end
