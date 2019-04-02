%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%
  k = (extractBetween(MAT_ClusterCentres, 'c_', '.mat'));%extract the no. of cluster centres from Ks
  MC = load(MAT_ClusterCentres);
  M = cell(size(MC.C,1),1);
  for i = 1:size(MC.C,1)
      M{i} = reshape(MC.C(i,:), 28, 28)';
  end
  
  montage(M);
    
  filename = sprintf('task1_6_imgs_%s.pdf', k{1});
  print(filename,'-dpdf');
  
  
  
end
