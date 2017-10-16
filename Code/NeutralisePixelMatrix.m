
function [newPixelMatrix, meanVector] = NeutralisePixelMatrix(rawPixelMatrix, direction)

numSample = size(rawPixelMatrix, direction);
meanValue = sum(rawPixelMatrix, direction)/numSample;

if direction == 1
    newPixelMatrix = rawPixelMatrix - repmat(meanValue, [numSample 1]);
    meanVector = transpose(meanValue);
elseif direction == 2 
    newPixelMatrix = rawPixelMatrix - repmat(meanValue, [1 numSample]);
    meanVector = meanValue;
end

end