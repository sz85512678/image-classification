% NeutralisePixelMatrix substracts the mean from the sample raw data for
% both training set and test set
%
% Input "direction" indicates the direction to de-mean raw data to neutralise image intensity.
% This value can be either 1 or 2.
% When intensityDirection = 1, raw data are substracted by mean of pixels
% When intensityDirection = 2, raw data are substracted by mean of images
% (the same as lecture notes)

function [newTrainingMatrix, newTestMatrix] = NeutralisePixelMatrix(rawTrainingMatrix, rawTestMatrix, direction)

numSample = size(rawTrainingMatrix, direction);
meanValue = sum(rawTrainingMatrix, direction)/numSample;

if direction == 1
    newTrainingMatrix = rawTrainingMatrix - repmat(meanValue, [numSample 1]);
    newTestMatrix = rawTestMatrix - repmat(sum(rawTestMatrix,1)./size(rawTestMatrix,1), [size(rawTestMatrix, direction) 1]);
elseif direction == 2 
    newTrainingMatrix = rawTrainingMatrix - repmat(meanValue, [1 numSample]);
    newTestMatrix = rawTestMatrix - repmat(meanValue, [1 size(rawTestMatrix, direction)]);
end
    
end