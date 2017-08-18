 function [A1 , A2 ] = forwardfeed(model, matrixP)
    %model is model of MLP
    % matrixP is input data
    % return A1 and A2 where A1 is signal process in H-O and A2 is Output
    % Activation
      V1 =    matrixP * model.layer_w{1};
      A1 = logsig(V1);
      
      V2 =  A1 * model.layer_w{2} ;
      A2 = logsig(V2);
   
end