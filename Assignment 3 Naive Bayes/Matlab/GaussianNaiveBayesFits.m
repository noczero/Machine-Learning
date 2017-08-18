function model = GaussianNaiveBayesFits(X,Y)
% This function fits a Gaussian Naive Bayes model
% X is dataTrain
% Y is class label

    listClass = unique(Y); 
    numberClass = length(listClass); %Number of class
    S = size(X);
    N = S(1); % Number of samples
    D = S(2); % Dimension of each sample
    classSizes = zeros(1, numberClass);
    classPrior = zeros(1, numberClass);
    featureParams = zeros(D, numberClass, 2); % mean and squared deviation of each feature in each class
    
    % Calculating the class priors and the means of the features
    for i = 1:N
        c = Y(i);
        classSizes(c) = classSizes(c) + 1;
        classPrior(c) = classPrior(c) + 1; 
        for j = 1:D
            att = X(i, j);
            featureParams(j, c, 1) = featureParams(j, c, 1) + att;
        end
    end
    
    classPrior = classPrior / N;
    
    for i = 1:numberClass
        featureParams(:, i, 1) = featureParams(:, i, 1) / classSizes(i);
    end
    
    % Calculating the squared deviation of the features
    for i = 1:N
        c = Y(i);
        for j = 1:D
            att = X(i, j);
            squaredDifference = ( att - featureParams(j, c, 1) ).^2;
            featureParams(j, c, 2) = featureParams(j, c, 2) + squaredDifference;
        end
    end
    
    for i = 1:numberClass
        featureParams(:, i, 2) = featureParams(:, i, 2) / classSizes(i);
    end
    
    model = { classPrior, featureParams };
end