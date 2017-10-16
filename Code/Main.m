%% Configuration

pctTrainingSet = 0.75;
randSeed = 1;

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