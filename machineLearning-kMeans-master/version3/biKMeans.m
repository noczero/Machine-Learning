function [ centroids, data2cluster ] = biKMeans( data,k )
%%
%   data: data matrix needs to be clustered.
%   k: the number of clusters we expected.
%   centroids: the centroid of clusters
% data2cluster: 
%   (:,1) mapping matric from data to cluster.
%	(:,2) disntance from the instance to its cluster centroid.
%                                    by Joly Zhang 10-12-2016.
%%

len = 1; %the current number of clusters.
[nInstances,~] = size(data);
centroids = zeros(k, size(data,2));
centroids(1,:) = mean(data);
data2cluster(:,1) = ones(nInstances,1);
data2cluster(:,2) = sqrt(sum((data - repmat(centroids(1,:),nInstances,1)).^2, 2));

figure
hold on;

while len < k  
   minSE = inf;
   iSplit = 0; %indicate which cluster will be splited in this iterate.
   bestCentroidsForICluster = [];
   bestData2Cluster = [];
   for i = 1:len
       index1 =data2cluster(:,1) == i;
       index2 = data2cluster(:,1) ~=i;
       currentData = data(index1, :);
       [iCentroids, iData2cluster] = kMeans(currentData,2);
       currentMinSE = sum(iData2cluster(:,2)) + sum(data2cluster(index2, 2));
       disp([i, currentMinSE]);
       if currentMinSE < minSE
           minSE = currentMinSE;
           iSplit = i;
           disp(['i=',num2str(i)]);
           bestCentroidsForICluster = iCentroids;
           bestData2Cluster = iData2cluster;
       end
   end
   disp('---------');
   plot(len,minSE,'-*');
   
   %to split the cluster iSplit into to clusters, one cluster is indexed
   %with iSplit and another with len+1.
   c1 = indexMapping(data2cluster, iSplit, bestData2Cluster, 1);
   c2 = indexMapping(data2cluster, iSplit, bestData2Cluster, 2);
   
   centroids(iSplit,:) = bestCentroidsForICluster(1,:);
   data2cluster(c1,1) = iSplit;
   data2cluster(c1,2) = bestData2Cluster(bestData2Cluster(:,1)==1, 2);
   
   len = len+1;
   centroids(len,:) =  bestCentroidsForICluster(2,:);
   data2cluster(c2,1) = len;
   data2cluster(c2,2) = bestData2Cluster(bestData2Cluster(:,1)==2, 2);
end
    plot(len,minSE,'-*');
end

%%
% mapping the data index of new clusters to original clusters.
%
%%
function [index] = indexMapping(data2cluster, i, iData2cluster, ic)
iCluster = find(data2cluster(:,1) == i);
index = iCluster(iData2cluster(:,1) == ic);
end
