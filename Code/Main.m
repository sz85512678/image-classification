%% Configuration

Config;

%% Loading image data

% Load raw data
fileName = 'Data/YaleB_32x32.mat';
load(fileName);
% Data pre-possessing
pixelMat = transpose(fea);
picLabel = transpose(gnd);

%% Separate training and test sets

[trainingSet, testSet, trainingLabel, testLabel] =...
    SeparateTrainingTestSets(pixelMat, picLabel, config.pctTrainingSet, config.randSeed);

%% Neutralise (intensity of) data sets

[newTrainingSet, newTestSet] = NeutralisePixelMatrix(trainingSet, testSet, config.intensityDirection);

%% Testing

%r_class = kClassifier(trainingSet, trainingLabel, testSet(:,1),2,10,10);
tic
[V,D] = PCA_analysis(newTrainingSet);
test_result = zeros(1,size(newTestSet,2));
for i = 1:size(newTestSet,2)
    test_result(i) = kClassifier(newTrainingSet, trainingLabel, newTestSet(:,i),config.numRemovedFea,config.numFeatures,config.numNeighbours,V);
end
toc
[success_rate,type1error_rate,type2error_rate] = Reporter(testLabel,test_result,1)

