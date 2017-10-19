%% Configuration

Config;

%% Loading image data

% Load raw data
fileName = 'Data/YaleB_32x32.mat';
load(fileName);
% Data pre-possessing
pixelMat = transpose(fea);
picLabel = transpose(gnd);

uniqueLabel = unique(picLabel);

% Display data
displayData(fea(config.displayImage,:));

%% Separating training and test sets

[trainingSet, testSet, trainingLabel, testLabel] =...
    SeparateTrainingTestSets(pixelMat, picLabel, config.pctTrainingSet, config.randSeed);

%% Neutralising (intensity of) data sets

[newTrainingSet, newTestSet] =...
    NeutralisePixelMatrix(trainingSet, testSet, config.intensityDirection);

%% Learning - k-th nearest neighbours search

tic;

% Abstract the principal components from the original feature vector
[pcFeatures,~] = PCA_analysis(newTrainingSet);

% Apply k-nearest-neighbour algorithm
testResult_Knn = zeros(1,size(newTestSet,2));
for i = 1:size(newTestSet,2)
    testResult_Knn(i) = kClassifier(newTrainingSet, trainingLabel, newTestSet(:,i),config.numRemovedFea,config.numFeatures,config.numNeighbours,pcFeatures);
end
elapsedTimeKNN = toc;

% Reporting
[success_rate,type1error_rate,type2error_rate] = PerformanceReporter('KNN', testLabel,testResult_Knn,uniqueLabel);
disp(' ');
disp('KNN Performance Report:');
disp(['The total elapsed time is ', num2str(elapsedTimeKNN), ' seconds.']);
disp(['The success rate is ', num2str(success_rate*100), '%.']);
disp(' ');

%% Learning - Linear discriminantal classifier

tic;

testResult_Lda = LdaClassifier(trainingSet, trainingLabel, testSet);

elapsedTimeLDA = toc;

% Reporting
[success_rate,type1error_rate,type2error_rate] = PerformanceReporter('LDA', testLabel,testResult_Lda,uniqueLabel);
disp(' ');
disp('LDA Performance Report:');
disp(['The total elapsed time is ', num2str(elapsedTimeLDA), ' seconds.']);
disp(['The success rate is ', num2str(success_rate*100), '%.']);
disp(' ');
