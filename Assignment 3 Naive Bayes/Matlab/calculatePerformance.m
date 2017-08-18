function [ result ] = calculatePerformance( confusionMatrix , param )
% Calculate classifier performance from confusion matrix
% param 1 to display F1 Micro, Calculate metrics globally by counting the total true positives, false negatives and false positives.
% param 2 to display F1 Macro, Calculate metrics for each label, and find their unweighted mean. This does not take label imbalance into account.
% param 3 to display Accuracy
    TruePositive = zeros(length(confusionMatrix),1); 
    TrueNegative = zeros(length(confusionMatrix),1);
    FalsePositive = zeros(length(confusionMatrix),1);
    FalseNegative = zeros(length(confusionMatrix),1);
    Precision = zeros(length(confusionMatrix),1);
    Recall = zeros(length(confusionMatrix),1);
    
    for i=1:length(confusionMatrix),
        TruePositive(i) = confusionMatrix(i,i);
        TrueNegative(i) = sum(sum(confusionMatrix)) - sum(FalsePositive)-sum(FalseNegative)-TruePositive(i);
        FalsePositive(i) = sum(confusionMatrix(:,i)) - TruePositive(i);
        FalseNegative(i) = sum(confusionMatrix(i,:)) - TruePositive(i);
        Precision(i) = TruePositive(i)/ (TruePositive(i)+FalsePositive(i));
        Recall(i) = TruePositive(i) / (TruePositive(i)+FalseNegative(i));
    end
    
    if param == 1
        MicroAvgPrec = sum(TruePositive) / (sum(TruePositive)+sum(FalsePositive));
        MicroAvgRec = sum(TruePositive) / (sum(TruePositive)+sum(FalseNegative));
        result = 2 / ((1/MicroAvgPrec) + 1/(MicroAvgRec)); %Calculate harmonic mean of F1Micro
    elseif param == 2
        MacroAvgPrec = sum(Precision) / length(confusionMatrix);
        MacroAvgRec = sum(Recall) / length(confusionMatrix);
        result = 2 / ((1/MacroAvgPrec) + 1/(MacroAvgRec)); %Calculate harmonic mean of F1Macro
    elseif param == 3
        result = (sum(TruePositive) + sum(TrueNegative)) /  (sum(TruePositive) + sum(TrueNegative) + sum(FalsePositive) + sum(FalseNegative));
    end

end

