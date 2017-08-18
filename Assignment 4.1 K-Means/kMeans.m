function [ finalCentroids result ] = kMeans( X , startCentroids )
% this function to do clustering with kMeans
% X is data training without label
% startCentroids is the variable to defined random position
% finalCentroids is the final center of data on every cluster
% result is the data training with the cluster label on it.

[ numRow numCol ]   = size(X);
[ numK numkCol ]    = size(startCentroids);
change              = true;
i                   = 0;
tempCentroids       = startCentroids; %save the centroids temporary
result              = X;
finalCentroids      = startCentroids;
listSSE             = [];

    while (change )
        tempCentroids = finalCentroids;
        % Form K clusters by assigning each point to its closest centroid.
        for i = 1:numRow
            whoMin = [];
            for j = 1:numK
                %Calculate the distance every single data to centroids
                sub = X(i,:) - finalCentroids(j,:);
                euclidean = sqrt(sum(sub.^2));
                % save euclidean to list
                whoMin = [whoMin; euclidean];
            end
            % find the smallest index
            [~ , idx ] = min(whoMin);

            % assign label to result
            result(i,3) = idx;
        end

        % calculate the new centroids
        for i = 1:numK
            % find same label in result
            condition = result(:, 3) == i;
            % calculate mean every cluster
            finalCentroids(i,:) = mean(result(condition,1:2));
            % disp(finalCentroids);
        end
        
        % calculate SSE
        listSSE = [listSSE ; SSE( result , finalCentroids )];
        
        % check centroids dont change
        if ((tempCentroids == finalCentroids))
            change = false;
        end
    end

    %plot(listSSE);
end

