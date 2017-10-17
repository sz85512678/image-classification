%% Configuration

Config;

%% Loading image data

% Load raw data
fileName = 'Data/YaleB_32x32.mat';
load(fileName);
% Data pre-possessing
pixelMat = transpose(fea);
picLabel = transpose(gnd);

%% Separating training and test sets

[trainingSet, testSet, trainingLabel, testLabel] =...
    SeparateTrainingTestSets(pixelMat, picLabel, config.pctTrainingSet, config.randSeed);

%% Neutralising (intensity of) data sets

[newTrainingSet, newTestSet] =...
    NeutralisePixelMatrix(trainingSet, testSet, config.intensityDirection);

%% Testing

tic;
[V,D] = PCA_analysis(newTrainingSet);
test_result = zeros(1,size(newTestSet,2));
for i = 1:size(newTestSet,2)
    test_result(i) = kClassifier(newTrainingSet, trainingLabel, newTestSet(:,i),config.numRemovedFea,config.numFeatures,config.numNeighbours,V);
end
elapsedTime = toc;

%% Reporting

[success_rate,type1error_rate,type2error_rate] = PerformanceReporter(testLabel,test_result,1:32);
disp(' ');
disp('Performance Report:');
disp(['The total elapsed time is ', num2str(elapsedTime), ' seconds.']);
disp(['The success rate is ', num2str(success_rate*100), '%.']);
disp(' ');
