function [centroids, clusterAssment ] = doKMeans(file,k,draw )
%%
%  file: the path of source data file. 
%  k: the expected number of the clusters.
% draw: optional labels, drawing result when assmented with 'g'.
% centroids: the k clusters' centroid.
% clusterAssmemt: 
%   (:,1) mapping matric from data to cluster.
%	(:,2) disntance from the instance to its cluster centroid.
%                                    by:Joly Zhang 10-12-2016
%%
data = load(file);
[centroids, clusterAssment] = biKMeans(data,k);
if nargin == 3 && draw == 'g'
    drawGraphic(data,clusterAssment,centroids,k);
end
end

%%
%draw the result with scatter.
%
%%
function [] = drawGraphic(data,data2cluster,centroids,k)
    figure
    hold on;
    for i = 1:k
        scatter(data(data2cluster(:,1)==i,1),data(data2cluster(:,1)==i,2),'*');
        scatter(centroids(i,1),centroids(i,2),'xr');
    end
end
