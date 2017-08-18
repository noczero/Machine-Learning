function [centroids, data2cluster ] = kMeans(data,k)
%%
% data: data matrix needs to be clustered.
% k: the number of clusters.
% draw: optional label, drawing scatter if signed by 'g'.
% centroids: the k clusters' centroid.
% data2cluster: 
%   (:,1) mapping matric from data to cluster.
%	(:,2) disntance from the instance to its cluster centroid.
%                                    by:Joly Zhang 10-11-2016
%%
[mInstances, ~] = size(data);
rc = randomCentroids(data,k);
data2cluster = zeros(mInstances,2);
centroidsChange = 1;
xx = 1;
figure
hold on;
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
   plot(xx,sum(data2cluster(:,2)),'*');
   xx = xx +1;
end
centroids =rc;
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
