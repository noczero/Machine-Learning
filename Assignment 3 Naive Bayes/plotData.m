function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.
%
% Note: This was slightly modified such that it expects y = 1 or y = 0

% Find Indices of Positive and Negative Examples
c1 = find(y == 1); c2 = find(y == 2);
c3 = find(y == 3); c4 = find(y == 4);
c5 = find(y == 5); c6 = find(y == 6);
c7 = find(y == 7);

% Plot Examples
plot(X(c1, 1), X(c1, 2), 'k+','Marker', 'o' , 'LineWidth', 1, 'MarkerSize', 5)
hold on;
plot(X(c2, 1), X(c2, 2), 'ko','LineWidth', 1, 'MarkerFaceColor', 'y', 'MarkerSize', 5)
hold on;
plot(X(c3, 1), X(c3, 2), 'k*','LineWidth', 1,'MarkerFaceColor', 'm', 'MarkerSize', 5)
hold on;
plot(X(c4, 1), X(c4, 2), 'kh','LineWidth', 1,'MarkerFaceColor', 'c', 'MarkerSize', 5)
hold on;
plot(X(c5, 1), X(c5, 2), 'kx','LineWidth', 1,'MarkerFaceColor', 'r', 'MarkerSize', 5)
hold on;
plot(X(c6, 1), X(c6, 2), 'ks','LineWidth', 1,'MarkerFaceColor', 'g', 'MarkerSize', 5)
hold on;
plot(X(c7, 1), X(c7, 2), 'kp','LineWidth', 1,'MarkerFaceColor', 'b', 'MarkerSize', 5)

hold off;

end