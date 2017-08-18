function [newW1 , newW2] = backPropagation(model, matrixP, A1, A2 , E)
    %model is model
    % A1 is signal between Hidden and Output
    % A2 is signal output
    % E is substract Target and A2 (error learning).

    D2 = sigmoidGrad(A2).* E;
    outInvert = model.layer_w{2};
    EA = outInvert * D2';
    D1 = sigmoidGrad(A1) .* EA';
   
    dW1 = model.learning_Rate * D1' * matrixP;
    dW2 = model.learning_Rate * D2' * A1;
    
    % return the updated weight
    newW1 = model.layer_w{1} + dW1';
    newW2 = model.layer_w{2} + dW2';
    
end
