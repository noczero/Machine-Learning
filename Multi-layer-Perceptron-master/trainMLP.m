function result = trainMLP(model , matrixP , matrixT);
    % model is architecture of MLP 
    % matrixP is data training
    % matrixT is target
    epoch = model.epoch;
    listMSE = [];
    n = 0;
    meetCondition = false;
    while (n <= epoch) && (~meetCondition) 
        n = n + 1;
        for j = 1 : length(matrixP)
           %forward feed
           [resultA1 resultA2] = forwardfeed(model, matrixP);
           
           %calculate MSE
           E = matrixT - resultA2;
           %up = sum(E.^2,2);
           %MSE2 = sum(up) / 399;
           %error = sum((resultA2 - matrixT).^2,2);
           %MSE = mean(error);
           
           [newW1, newW2 ] = backPropagation(model, matrixP, resultA1 , resultA2 ,E);
           
           %update new weight to model
           model.layer_w{1} = newW1;
           model.layer_w{2} = newW2;
        end
        
        % Test Performance
        [resultA1 resultA2] = forwardfeed(model, matrixP);
        error = sum((resultA2 - matrixT).^2,2);
        MSE = mean(error);
        listMSE = [listMSE ; MSE n];
        
        if(MSE <= 0.2 )
            meetCondition = true;
        end
    end
    
    model.MSE = listMSE;
    model.epochFinal = epoch;
    result = model;
end