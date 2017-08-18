function [data2cluster ] = kMeans(file,k ,draw)
%%
% file: data source file
% k: the number of clusters
% draw: optional label, drawing scatter if signed by 'g'.
% data2cluster: 
%   (:,1) mapping matric from data to cluster.
%	(:,2) disntance from the instance to its cluster centroid.
%                                    by:Joly Zhang 10-11-2016
%%
data = load(file);
[mInstances, ~] = size(data);
rc = randomCentroids(data,k);
data2cluster = zeros(mInstances,2);
centroidsChange = 1;
while centroidsChange
   centroidsChange = 0;%assume that the centroids don't change any more.
   for i = 1:mInstances
       instance = data(i,:);
       [dist,nearest ] = computeNearestCluster(instance, rc);
       if data2cluster(i,1) ~= nearest
           centroidsChange = 1; %the i-th instance changes its cluster.
           data2cluster(i,:) = [nearest, dist];
       end
   end
   if centroidsChange == 1
        rc = adjustCentroids(data,data2cluster,k);
   end
end
if nargin == 3 && draw == 'g'
    drawGraphic(data,data2cluster,k);
end
end

%%
%draw the result with scatter.
%
%%
function [] = drawGraphic(data,data2cluster,k)
    for i = 1:k
        scatter(data(data2cluster(:,1)==i,1),data(data2cluster(:,1)==i,2),'*');
        hold on;
    end
end

%%
%   Adjust the cluster centroids according to the latest clusting result.
%
%%
function [centroids] = adjustCentroids(data, data2cluster,k)
centroids = zeros(k,size(data,2));
for i = 1:k
   centroids(i,:) = mean(data(data2cluster(:,1) == i, :)); 
end
end

%%
% compute the nearest cluster to instance and the distance between them.
%
%%
function [nearest, dist] = computeNearestCluster(instance, centroids)
[k,~] = size(centroids);
[nearest, dist] = min( sqrt(sum((repmat(instance, k,1) - centroids).^2, 2)));
end


%%
% Randomly generate the cluster centroids.
%
%%
function [centroids] = randomCentroids(data,k)
[~, attributes] = size(data);
%centroids = zeros(k,attributes);
mins = min(data);
maxs = max(data);
centroids =repmat(mins,k,1) + rand(k, attributes).*repmat((maxs-mins),k,1);
end
