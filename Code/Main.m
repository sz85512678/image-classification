%% Configuration

pctTrainingSet = 0.75;
randSeed = 1;
intensityDirection = 2;

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

%% Testing


%r_class = kClassifier(trainingSet, trainingLabel, testSet(:,1),2,10,10);
[V,D] = PCA_analysis(trainingSet);
test_result = zeros(1,size(testSet,2));
for i = 1:size(testSet,2)
    test_result(i) = kClassifier(trainingSet, trainingLabel, testSet(:,i),2,10,10,V);
end

error = sum(test_result==testLabel);
%% Intensity

[newTrainingSet, meanVectorIntensity]...
    = NeutralisePixelMatrix(trainingSet, intensityDirection);

