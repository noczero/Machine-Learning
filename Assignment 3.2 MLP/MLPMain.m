Compound = csvread('Classification_datasets\Compound.csv');
X = Compound(:,1:2);
Y = Compound(:,3);

visualize(X,Y);
%% MLP Model
%variable to make MLP Architecture
learningRate    = 0.0001;
numLayers       = 2 ; %H-O
numHiddenNodes  = 150;
numFeatures     = size(X,2);
epoch           = 10000;
%instance the MLP Architecture
model = MLP(learningRate, numLayers, numHiddenNodes, numFeatures ,epoch);

% Make Target Matrix from Y label
yTarget = [];
for i = 1:length(Y)
    yTarget = [yTarget ; makeTarget(Y(i))];
end

%% Training
trainModel = trainMLP(model,X,yTarget);

%% Plotting the MSE
plot(trainModel.MSE(:,1));

%% Testing
yPredict = [];
for i = 1 : length(X)
    yPredict = [yPredict ; classifyMLPMod(trainModel,X(i,:))];
end

%% Visualize
visualize(X,yPredict);

%% Performance Analysis
cfsMatrix = ConfusionMatrix(Y,yPredict);
calculatePerformance(cfsMatrix,1)

%% Decision Boundaries
decbound2D(X,yPredict,trainModel);