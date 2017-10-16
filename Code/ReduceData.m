function [reduced_data] = ReduceData(original_data,m,n,V)

%This function takes a column vector 1032*1 as an input, out puts reduced
%data only using a certain range of features

%m, number of leading principle components to be removed

%n, number of principle components to be kept

%V, matrix of principle components calculated in previous steps

V = V(m+1:m+n,:);

reduced_data = V'*original_data;

end


