function result = trainMLP(model , matrixP , matrixT);
    % this function to train the model and update weight of the model with
    % the proper weight using forwardFeed and backPropagation function.
    % return the result of trained model.
    % model is architecture of MLP 
    % matrixP is data training
    % matrixT is label class from matrixP in formatted label.
    
    epoch   = model.epoch;
    listMSE = [];
    n       = 0;
    meetCondition = false;
    
    while (n < epoch) && (~meetCondition) 
        for j = 1 : length(matrixP)
           % forward feed
           [resultA1 resultA2] = forwardFeed(model, matrixP);
           
           % calculate Error
           E = matrixT - resultA2;
           
           %do back propagation to update new weight
           [newW1, newW2 ] = backPropagation(model, matrixP, resultA1 , resultA2 ,E);
           
           %update new weight to model
           model.layer_w{1} = newW1;
           model.layer_w{2} = newW2;
        end
        
        % Test Performance do forwardFeed
        [resultA1 resultA2] = forwardFeed(model, matrixP);
        % calculate Error
        % E = matrixT - resultA2;
        % up = sum(E.^2,2);
        % MSE2 = sum(up) / 399; 
        
        error = sum((resultA2 - matrixT).^2,2); 
        MSE = mean(error);          % same result with the explicit formula
        listMSE = [listMSE ; MSE n];% save MSE result to list
        
        % if the MSE is suitable with our's hope then stop
        if (MSE <= 0.05)
            meetCondition = true;
        end
        
         n = n + 1;
    end
    
    model.MSE = listMSE;        % return list MSE for plotting analysist
    model.epochFinal = epoch; 	% to known the final epoch
    result = model;
end