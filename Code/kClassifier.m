function r_class = kClassifier(training_data, testing_data,m,n)

%main function, take training data, and one testing_data, output the class as a number

% m,n are parameters

%first of all, reduce data, for both training and testing

V = PCA_analysis(training_data);

for k = 1:size(training_data,2)
    training_data(:,k) = ReduceData(training_data(:,k),V,m,n);
end

testing_data = ReduceData(testing_data,V,m,n);

%Then run the internal classifier
FD = knnsearch(training_data,testing_data);
r_class = FD;

end




