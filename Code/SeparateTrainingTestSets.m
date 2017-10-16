function [trainingSet, testSet, trainingLabel, testLabel] = SeperateTrainingTestSets(wholeDataSet, wholeLabel, pctTrainingSet, randSeed)

numWholeSet = size(wholeDataSet, 2);

% Seeds the random number generator
rng(randSeed);

x = randn(1, numWholeSet);
[~, randIdx] = sort(x);

numTrainingSet = floor(pctTrainingSet * numWholeSet);

trainingSet = wholeDataSet(:, randIdx(1:numTrainingSet));
trainingLabel = wholeLabel(randIdx(1:numTrainingSet));

testSet = wholeDataSet(:, randIdx(numTrainingSet+1:end));
testLabel = wholeLabel(randIdx(numTrainingSet+1:end));

end