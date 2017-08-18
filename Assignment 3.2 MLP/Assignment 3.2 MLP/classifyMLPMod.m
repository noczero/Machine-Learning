function yPredict = classifyMLPMod(trainedModel , dataTesting)
    % this function is to predict data Testing and return the label
    % trainedModel is the model that already train using backproporgation
    % dataTesting is single data for testing
    
    % do forward feed to get output A2
    [~ , resultA2] = forwardFeed(trainedModel,dataTesting);
        
    % search max element and return indices
    [~ , idx ] = max(resultA2);
    yPredict = idx;
end