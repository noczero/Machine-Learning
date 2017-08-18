%Naive Bayes Classifier

%% Load data from csv file dataset.
Aggr = csvread('Classification_datasets\Aggregation.csv');
X = double(Aggr(:,1:2)); %forData
Y = double(Aggr(:,3));  %forClassc

%% Visualize train data
visualize(X,Y);

%% Make model of training set
Model = GaussianNaiveBayesFits(X,Y);

%% Testing data set and get label class
yPredict = GaussianNaiveBayesPredict(X,Model);

%% Make confusion matrix from actual label and predict label
% Calculate Performance F1 Micro
cfsMatrix = ConfusionMatrix(Y,yPredict);
calculatePerformance(cfsMatrix,1)

%% Show result of testing
visualize(X,yPredict);

%% Display Decision Boundaries
decbound2D(X,yPredict,Model);

