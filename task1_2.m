%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

M = cell(11,1); %array to store 11 blurry iamges
for d = 1:11
    array = collect(X,Y,d-1); 
    Data = cat(3,array{:}); %concatenate to get array Data
    mu = (myMean(Data,3)); %average each element in array (uint8 type makes image blurry if Xtrn not /255)
    M{d} = mu;

end

function C = collect(X, Y, digit) %collects 10 versions of 0's

        C = cell(size(X,1),1);
        k = 1;
        i = 1;
        if digit == 10
            while i<size(X,1)
                C{k} = reshape(X(i,:), 28, 28)';
                i = i + 1;
                k = k + 1; 
            end
        end
                
        while i<size(X,1)   
                if Y(i) == digit %collect images of this digit only 
                    C{k} = reshape(X(i,:), 28, 28)';
                    i = i + 1;
                    k = k + 1; 
                else
                    i = i + 1;
                end

        end
    end
end
