%% Configuration

pctTrainingSet = 0.7;
randSeed = 1;
intensityDirection = 1;
numFeatures = 98;   % 0 - 90
numRemovedFea = 2;  % 0 - 10
numNeighbours = 10; % 5 - 30

%% Loading image data

% Load raw data
fileName = 'Data/YaleB_32x32.mat';
load(fileName);
% Data pre-possessing
pixelMat = transpose(fea);
picLabel = transpose(gnd);

%% Separate training and test sets

[trainingSet, testSet, trainingLabel, testLabel] =...
    SeparateTrainingTestSets(pixelMat, picLabel, pctTrainingSet, randSeed);

%% Neutralise data set

[newTrainingSet, trainingMeanVec] = NeutralisePixelMatrix(trainingSet, intensityDirection);
if intensityDirection == 1
    newTestSet = testSet - repmat(sum(testSet,1)./size(testSet,1), [size(testSet, intensityDirection) 1]);
elseif intensityDirection == 2
    newTestSet = testSet - repmat(trainingMeanVec, [1 size(testSet, intensityDirection)]);
end

%% Testing

%r_class = kClassifier(trainingSet, trainingLabel, testSet(:,1),2,10,10);
[V,D] = PCA_analysis(newTrainingSet);
test_result = zeros(1,size(newTestSet,2));
for i = 1:size(newTestSet,2)
    test_result(i) = kClassifier(newTrainingSet, trainingLabel, newTestSet(:,i),numRemovedFea,numFeatures,numNeighbours,V);
end

successRate = sum(test_result==testLabel)/size(newTestSet,2);

