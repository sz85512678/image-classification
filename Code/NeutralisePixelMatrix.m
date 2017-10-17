% NeutralisePixelMatrix

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