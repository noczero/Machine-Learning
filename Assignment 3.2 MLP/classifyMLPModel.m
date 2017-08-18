function yPredict = classifyMLPModel(trainedModel , dataTest)
    % this function return class label from input pattern.
    % trainedModel is model JST that already trained
    % dataTest is data testing
    yPredict = [];
    numberClass = trainedModel.output_nodes;
    classMatrix = [];
    
    % Make class matrix
    for i = 1 : numberClass 
        classMatrix = [classMatrix ; makeTarget(i)];
    end
    
    for i = 1 : length(dataTest)
        % do forwardFeed
        [~ , resultA2] = forwardFeed(trainedModel,dataTest(i,:));
        whoMin = []; % declare matrix to search min
        for j = 1 : length(classMatrix)
            Error = classMatrix(j,:) - resultA2;
            euclidean = sqrt(sum(Error.^2));
            
            whoMin = [whoMin; euclidean];
        end
        
        [~ , idx ] = min(whoMin);
        yPredict = [yPredict ; idx];
    end
end