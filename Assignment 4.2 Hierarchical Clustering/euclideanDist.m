function dist = euclideanDist(x, y)
    % Euclidean distance between points x and y.
    dist = sqrt(sum((x - y).^2));
end

