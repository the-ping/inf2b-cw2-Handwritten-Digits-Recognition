%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double) 42024 by 784
%  Ytrain : M-by-1 label vector (unit8) for X 42024 by 1
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.




%partA :: first transform ND training datas onto 2D; Xin2D



%get PCAs
[evecs, evals] = comp_pca(Xtrain); %784 by 784 and 784 by 1

% invEv = inv(evecs');

mappedX = (Xtrain - (myMean(Xtrain)) *  evecs) ; % y = V' (x-p) // 42024 by 784

%care only first 2 principal components
mappedX = Xtrain * evecs(:, 1:2); %42024 by 2

%means of each class
means = zeros(11,2);
covmats = zeros(2,2,11); %2 by 2 because we care only t   

%store computed correlation of 10 classes plus correlation among all
%classes
ClassStorage = cell(11,1);
for i = 1:11
    if i <11
    thatClass = mappedX(Ytrain == i-1,:);
    ClassStorage(i,1) = {thatClass};
    selectedX = cell2mat(ClassStorage(i)); %10 by 1 to be 10 by 874
    means(i,:) = myMean(selectedX);
    %updated X with mean?
    covmats(:,:,i) = myCov(selectedX);
    else
        means(i,:) = myMean(mappedX);
        covmats(:,:,i) = myCov(mappedX);
    end

end

mean2D = sum(mappedX)/length(mappedX);

size(means) %11 b y2
size(covmats) %2 by 2 by 11

%store all the SDs for each case
SDs = zeros(11,1);
%store all the normalisation
NORMs = zeros(11,1);

for i = 1:11
    %get standard deviation
    sd = diag(covmats(:,:,i).^0.5;
    NORMs = [(a - mean2D)/sd ]
end



% - for Xtrain
%mean of each vector
%standard deviation of each vector
%normalise each vector elements

% - for Ytrain


%calculate correlation between pt 1 and 2 on Xin2D; in regards to each class



end
