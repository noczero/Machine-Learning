function cfsMatrix = ConfusionMatrix( Ytrain , Ypredict)
    listClass = unique(Ytrain);
    numberClass = length(listClass);
    
    cfsMatrix = zeros(numberClass);
    
    for i = 1 : length(Ytrain)
       cfsMatrix(Ytrain(i), Ypredict(i)) = cfsMatrix(Ytrain(i),Ypredict(i)) + 1 ;
    end
end