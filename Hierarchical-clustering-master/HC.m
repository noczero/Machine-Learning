function [cluster, tree, criterion] = HC(X, linkage, K)
%hierarchical clustering

%Inputs:

%required:

%X - matrix of inputs (rows - observations, columns - features)

%optional:

%linkage:
%single - minimum distance
%complete - maximum distance
%average - average distance (default value)
%centroid - mean distance

%K - number of clusters 
%(if not specified then using the largest difference between criteria -
%sum of squared distances between each point and centroid, summed over clusters

%Outputs:

%cluster - cluster for each object of matrix X (matrix [n, 1])
%tree - encodes a tree of hierarchical clusters of the rows of the real matrix X
%criterion - vector of sum of squared distances between each point and centre,
%summed over clusters 

switch nargin
    case 1
        linkage = 'single';   %default value for linkage
end

%size of matrix
[n, p] = size(X);

%normalize data
X = (X - ones(n, 1) * mean(X))./ (ones(n, 1) * std(X));

%creating structure:
%layer(i) - number of layer 
%obj - objects in clusters
%cluster - cluster in each layer
for i = 1:n
    layer(1).obj{i} = i;
    layer(1).cluster(i) = i;
end

criterion = [];
tree = zeros(n-1, 3);

for iter = 1:n-1
    pairwise_dist = zeros(length(layer(iter).obj), length(layer(iter).obj));
    incluster_dist = zeros(length(layer(iter).obj), 1);
    
    %calculate pairwise distances between clusters
    for i = 1:length(layer(iter).obj)
        for j = 1:length(layer(iter).obj)
            if (i~=j) && (isempty(X(layer(iter).obj{i}, :)) == 0) && (isempty(X(layer(iter).obj{j}, :)) == 0)
                pairwise_dist(i, j) = singlelink(X(layer(iter).obj{i}, :), X(layer(iter).obj{j}, :));
                
     
            else
                pairwise_dist(i, j) = 0;
            end
        end
        
        %sum of squared distances between objects and cluster centroid
        if length(layer(iter).obj{i}) > 1
            incluster_dist(i) = sum(sum((X(layer(iter).obj{i}, :) - ones(length(layer(iter).obj{i}), 1) * mean(X(layer(iter).obj{i}, :))).^2, 2));
        else 
            incluster_dist(i) = 0;
        end
    end
    
    %sum of squared distances between objects and cluster centroid summed by all clusters
    criterion = vertcat(criterion, sum(incluster_dist));
    
    %identify the pair of clusters that are least dissimilar 
    [a, b] = find(pairwise_dist == min(pairwise_dist(pairwise_dist>0)), 1, 'first');

    %create new layer
    layer(iter+1).obj = layer(iter).obj;
    layer(iter+1).obj{a} = [];
    layer(iter+1).obj{b} = [];
    %add new cluster
    layer(iter+1).obj{end+1} = [layer(iter).obj{a} layer(iter).obj{b}];
    
    %create encoded tree
    tree(iter, 1) = a;
    tree(iter, 2) = b;
    tree(iter, 3) = min(pairwise_dist(pairwise_dist>0));
    
    %create cluster
    cluster_obj = layer(iter+1).obj(~cellfun('isempty',layer(iter+1).obj));
    
    for i = 1:length(cluster_obj)
        layer(iter+1).cluster(cluster_obj{i}) = i;
    end
    
    iter = iter + 1;
end

%sum of squared distances between objects and cluster centroid
criterion(end+1) = sum(sum((X - ones(n, 1) * mean(X)).^2, 2));

%criterion depends on number of clusters
criterion = flipud(criterion);

%the difference between criteria
diff_criterion = abs(diff(criterion));

%choose number of clusters as the largest gap between criteria (exclude K_best=1)
K_best = find(abs(diff_criterion) == max(diff_criterion)) + 1;

%%if number of clusters is not specified
switch nargin
    case 1
        K = K_best;  
    case 2
        K = K_best;  
end

%best cluster
cluster = layer(n+1-K).cluster';
end