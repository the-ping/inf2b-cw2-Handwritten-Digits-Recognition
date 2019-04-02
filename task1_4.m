%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m

    M = cell(10, 1) ; %store each matrix in a 10x1 array
            i = 1;
            while i<11
                M{i} = reshape(EVecs(:,i), 28, 28)';
                i = i + 1;
            end
    montage(M, 'DisplayRange', [-0.2,0.3]);
%  montage(A, 'DisplayRange', [-r, r])

end
