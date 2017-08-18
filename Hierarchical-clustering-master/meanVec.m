function [mean] = meanVec(X, g)
% Calculates mean vector for group g in matrix X.
ind = find(X(end,:) == g);
vectorSum = sum(X(1:end-1, ind), 2);
counts = size(ind, 2);
mean = vectorSum ./ counts;
end

