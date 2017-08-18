%% Load the Data
hierarchical_1 = csvread('Clustering_DataSets/Hierarchical/Hierarchical_1.csv');
X = hierarchical_1;

%% Visualize the Data
scatter(X(:,1),X(:,2),20);


%% do hierarchical clustering
% single-link method
Y = pdist(X);   %calculate euclidean distance
Z = agglomerative(Y,'single'); 
disp(Z);

% complete-link method
Y = pdist(X);   %calculate euclidean distance
Z = agglomerative(Y,'complete');
disp(Z);

% average group method
Y = pdist(X);   %calculate euclidean distance
Z = agglomerative(Y,'average');
disp(Z);

% centroid method
Y = pdist(X);   %calculate euclidean distance
Z = agglomerative(Y,'centroid');
disp(Z);




