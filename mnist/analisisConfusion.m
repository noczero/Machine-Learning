function [ Accuracy Error Precision Recall F1 ] = analisisConfusion( hasilCfsMatrix )
  %Accuracy, Recall, Precision dari confusion matrix
 
  hasilCfsMatrix = cfsPrototype;
  TruePositive = zeros(10,1); 
   TrueNegative = zeros(10,1);
   FalsePositive = zeros(10,1);
   FalseNegative = zeros(10,1);

   
   for i=1:10,
    TruePositive(i) = hasilCfsMatrix(i,i);
    TrueNegative(i) = sum(sum(hasilCfsMatrix)) - sum(FalsePositive)-sum(FalseNegative)-TruePositive(i);
    FalsePositive(i) = sum(hasilCfsMatrix(:,i)) - TruePositive(i);
    FalseNegative(i) = sum(hasilCfsMatrix(i,:)) - TruePositive(i);
   end
   
   Accuracy = (sum(TruePositive) + sum(TrueNegative)) /  (sum(TruePositive) + sum(TrueNegative) + sum(FalsePositive) + sum(FalseNegative));
   Error = (sum(FalsePositive) + sum(FalseNegative)) / (sum(TruePositive) + sum(TrueNegative) + sum(FalsePositive) + sum(FalseNegative));
   Precision = sum(TruePositive) / (sum(TruePositive) + sum(FalsePositive));
   Recall = sum(TruePositive) / (sum(TruePositive) + sum(FalseNegative));
   F1 = (2*Precision*Recall) / (Precision+Recall);
   
end

