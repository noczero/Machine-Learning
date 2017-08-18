function [newW1 , newW2] = backPropagation(model, matrixP, A1, A2 , E)
  %model is model
  % A1 is signal between Hidden and Output
  % A2 is signal output
  % E is substract Target and A2.

    D2 = sigmoidgrad(A2).* E;
    outInvert = model.layer_w{2};
    EA = outInvert * D2';
    D1 = sigmoidgrad(A1) .* EA';
   
    % 10x6 - 399*6 
    % invert = D2';
    
    dW1 = model.learning_Rate * D1' * matrixP;
    dW2 = model.learning_Rate * D2' * A1;
    newW1 = model.layer_w{1} + dW1';
    newW2 = model.layer_w{2} + dW2';
    
end
