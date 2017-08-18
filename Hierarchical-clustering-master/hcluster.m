function [X] = hcluster(X, k)
% Hierarchical clustering for data matrix X.
% (https://en.wikipedia.org/wiki/Hierarchical_clustering)
% Add class information to data matrix X:
n = size(X, 2);
X = [X; 1:n];

means = X(1:end-1, :);
numGroups = n;

% Distances between groups are defined in distance matrix:
distM = Inf(n, n);

    while numGroups > k
        for i = 1:n
            for j = i+1:n
                distM(i, j) = d(means(:, i), means(:, j));
            end
        end
        % Find smallest element from distM:
        [~, ind] = min(distM(:));
        [newG, oldG] = ind2sub(size(distM), ind);
        % Update group information:
        X = updateGroups(X, newG, oldG);
        % Calculate new means:
        for i = 1:n
            if i ~= oldG
                means(:, i) = meanVec(X, i);
            else
                 means(:, i) = Inf(size(X, 1)-1, 1);
            end
        end
        numGroups = numGroups - 1;
    end
end

