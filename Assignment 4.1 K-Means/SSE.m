function  resultSSE  = SSE( result , finalCentroids )
% calculate the SSE of the final Centroids to every data points
%   result is data testing
%   finalCentroids is final centroids after calculate the means
%   resultSSE is the measure total of distance, smaller is better

  listSSE = [];
  for i = 1:length(finalCentroids)
    % find same label in result
    condition = result(:, 3) == i;
    dataCondition = result(condition,1:2);
    
    for j=1:length(dataCondition)   
        sub = dataCondition(j,:) - finalCentroids(i,:);
        euclidean = sqrt(sum(sub.^2));
    end
    listSSE = [listSSE ; euclidean];
    
  end
  % calculate total of every SSE  
  resultSSE = sum(listSSE);

end

