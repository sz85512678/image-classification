function [predictLabel] = LdaClassifier(trainingSet, trainingLabel, testSet)

% Creat the % Create a default (linear) discriminant analysis classifier.
MdlLinear = fitcdiscr(trainingSet',trainingLabel);

testSet_ = testSet';

predictLabel = zeros(1, size(testSet_, 1));

for i = 1:size(testSet_, 1) % loop through sample
    predictLabel(i) = predict(MdlLinear, testSet_(i,:));
end

end