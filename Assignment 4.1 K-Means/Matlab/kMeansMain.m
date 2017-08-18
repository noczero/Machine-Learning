%% Load data
aggregation = csvread('Clustering_DataSets/K-means/Aggregation.csv');
X = aggregation(:,1:2);
%% Visualize
scatter(X(:,1),X(:,2),20);


%% makeRandomCentroid
[numRow , numCol] = size(X);
k = 7; % number of cluster according to number of class
startCentroids = zeros(k,2);
% Randomly select K examples to be initial centorids
startCentroids = X(randperm(numRow, k), :);

%% do kMeans
[ finalCentroids result ] = kMeans( X , startCentroids);

%% Visualize the centroids and Result
% Visualize the centroids
label = [1:length(finalCentroids)]';
visualizeCentroid(finalCentroids , label)
hold on;
% Visualize Result
visualize(result, result(:,3));


%% makeRandomCentroid from class
k = 7; % number of cluster according to number of class
startCentroids = zeros(k,2);
% Randomly select K examples to be initial centorids in the class
for i = 1 : k
    condition = aggregation(:,3) == i;
    filterX = X(condition,:);
    [numRow , numCol] = size(filterX);
    startCentroids(i,:) = filterX(randi([1 numRow]), :);
end

%% do kMeans
[ finalCentroids result ] = kMeans( X , startCentroids);

%% Visualize the centroids and Result
% Visualize the centroids
label = [1:length(finalCentroids)]';
visualizeCentroid(finalCentroids , label)
hold on;
% Visualize Result
visualize(result, result(:,3));







