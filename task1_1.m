
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% mydataset_dir = 'C:\Users\Uzumaki Naruto\Desktop\2B cw2';
% [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(mydataset_dir);

for d = 1:10
    array = collect(X,Y,d-1);

    montage(array);
%     filename = sprintf('task1_1_imgs_class%d.pdf', d);
%     print(filename, '-dpdf');
end

    function M = collect(X, Y, digit)

        M = cell(10, 1) ; %store each matrix in a 10x1 array
        k = 1;
        i = 1;
        while k<11 && i<size(X,1)
                if Y(i) == digit %collect images of this digit only 
                    M{k} = reshape(X(i,:), 28, 28)';
                    i = i + 1;
                    k = k + 1; 
                else
                    i = i + 1;
                end

        end
    end


end
