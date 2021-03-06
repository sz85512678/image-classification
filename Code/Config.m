% CONFIG defines the struct config that configures the learning problem

% Indices of the images that user would like to show
% The element of this vector should be integer from 1 to 2414
% If the user does not wish to see any image, this value can be set as []
config.displayImage = [1:25];

% Seed of the random value generator to shuffle the original data set as a
% preparation for separating training and test data sets.
config.randSeed = 1;

% Percentage of the whole data set which is used to define the size of of
% training data set.
% This value ranges from 0 to 1.
config.pctTrainingSet = 0.8;

% Direction to de-mean raw data to neutralise image intensity.
% This value can be either 1 or 2.
% When intensityDirection = 1, raw data are substracted by mean of pixels
% When intensityDirection = 2, raw data are substracted by mean of images
% (the same as lecture notes)
config.intensityDirection = 1;

% Number of features to be used for each image in the learning process.
% This value ranges from 1 to the size of the total features.
config.numFeatures = 100;

% Number of the first principle components to be removed.
% This value ranges from 1 to the size of the total features.
% Notes: the sum of the numFeatures and numRemovedFeatures shall not exceed
% the size of the total features.
config.numRemovedFea = 15;

% Number of neighbours to be used in the k-nearest-neighbour classifier
% This value ranges from 1 to the size of the data set
config.numNeighbours = 1;