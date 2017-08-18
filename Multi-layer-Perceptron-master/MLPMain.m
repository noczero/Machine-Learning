Compound = csvread('Classification_datasets\Compound.csv');
X = Compound(:,1:2);
Y = Compound(:,3);

visualize(X(:,1),X(:,2));

learningRate = 0.000025;
numLayers = 2 ; %H-O
numHiddenNodes = 6;
numFeatures = size(X,2);
epoch = 10000;

model = MLP(learningRate, numLayers, numHiddenNodes, numFeatures ,epoch);

% Make Target Matrix from Y label
yTarget = [];
for i = 1:length(Y)
    yTarget = [yTarget ; makeTarget(Y(i))];
end

trainModel = trainMLP(model,X,yTarget);
plot(trainModel.MSE(:,2),trainModel.MSE(:,1));