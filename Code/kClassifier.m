function r_class = kClassifier(training_data, training_label,testing_data,m,n,k,V)

%main function, take training data, and one testing_data, output the class as a number

% m,n are parameters, k defines how many neighbours are we using

%first of all, reduce data, for both training and testing


%reduced_data = zeros(n,size(training_data,2));

%for j = 1:size(training_data,2)
%    reduced_data(:,j) = ReduceData(training_data(:,j),m,n,V);
%end

reduced_data = ReduceData(training_data,m,n,V);

testing_data = ReduceData(testing_data,m,n,V);

%Then run the internal classifier
FD = knnsearch(reduced_data',testing_data','K',k);
r_class = mode(training_label(FD'));

end




