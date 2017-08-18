% Demo script for hierarchical clustering.
% (https://en.wikipedia.org/wiki/Hierarchical_clustering)
% Author: Tuomas Kynkaanniemi, 2015
close all;
clear all;
% Generate data matrix X from uniform distribution:

minNum = -10;
maxNum = 10;


X = [7.426	4.0211 ;
10.596	2.6234;
3.6536	2.0797;
11.776	8.9833;
1.1113	13.516;
5.9083	14.091;
0.050912	3.3178;
3.3102	7.2401;
0.019509	5.6402;
2.8377	7.8567;
2.1373	3.9731]';


% Plot initial state before the clustering:
cmap = hsv(size(X, 2)); % Color map for plotting
for i = 1:size(X, 2)
    plot(X(1,i),X(2,i),'s','MarkerEdgeColor',cmap(i,:),'MarkerFaceColor',cmap(i,:))
    hold on
end

% Do hierarchical clustering for data matrix X:
k = 11; % Quit clustering, when k groups are left

while k > 1  
    X = hcluster(X, k);
    k = k -1;
end

% Plot final state after clustering:
figure;
for i = 1:size(X, 2)
    g = X(end, i);
    plot(X(1,i),X(2,i),'s','MarkerEdgeColor',cmap(g,:),'MarkerFaceColor',cmap(g,:))
    hold on
end






