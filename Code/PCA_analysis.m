function [V,D] = PCA_analysis(data)

%take an input of data matrix, where columns are vectorised pixel
%intensities and rows are pixels. 

%Aim to apply PCA to extract principle components, gives you principle
%components matrix, and singular values squared

%size(x,1)==number of pixels size(x,2) = number of samples

%Output: columns of V are eigenvectors in decreasing eigenvalues, D,
%corresponding eigenvalues

%only returns 100 biggest magnitude eigenvalues

x = data; 
cov_mat = x*x';
[V,D] = eigs(cov_mat,100,'largestabs');

%flip, as we want decreasing size

%V = fliplr(V);
%D = flipud(D);
end
