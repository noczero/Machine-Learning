function result = agglomerative(Y, method)
% this function is hierarchical clustering implementation 
% Y is distance from pdist function
% method is alogrithm approach to merge cluster

n = size(Y,2);       % length of Y (pdist)
m = ceil(sqrt(2*n)); % total of class  
result = zeros(m-1,3);    % allocate the output matrix.

N = zeros(1,2*m-1); % N how many points are contained in each cluster.
N(1:m) = 1;
n = m; % since m is changing, we need to save m in n.
R = 1:n; % is a index of class

% Square the distances so updates are easier.
if any(strcmp(method,'centroid'))
   Y = Y .* Y; % only on centroids method
end

    % repeat until cluster = 1
    for s = 1:(n-1)
       [v, k] = min(Y); % search the smallest values and return the index and its disimillarity

       i = floor(m+1/2-sqrt(m^2-m+1/4-2*(k-1))); % Search the row to merge from index
       j = k - (i-1)*(m-i/2)+i; % Search the coloumn to merge from index

       result(s,:) = [R(i) R(j) v]; % get the class from index of i and j and also the disimilarity.

       % Update Y. 
       I1 = 1:(i-1);
       I2 = (i+1):(j-1); 
       I3 = (j+1):m; % these are temp variables
       U = [I1 I2 I3]; % remaining point not yet clustered.
       I = [I1.*(m-(I1+1)/2)-m+i i*(m-(i+1)/2)-m+I2 i*(m-(i+1)/2)-m+I3]; %index row from Y to calculate using the methods besides the merge
       J = [I1.*(m-(I1+1)/2)-m+j I2.*(m-(I2+1)/2)-m+j j*(m-(j+1)/2)-m+I3]; %index coloumn from Y to calculate using the methods besides the merge

       switch method
       case 'single' % single linkage
         Y(I) = dSingleLink(Y(I),Y(J));
       case 'complete' % complete linkage
          Y(I) = dCompleteLink(Y(I),Y(J));
       case 'average' % weighted average linkage
          Y(I) = dAverage(Y(I), Y(J));
       case 'centroid' % centroid linkage
          Y(I) = dCentroid(Y(I),Y(J),N,R,i,j,v);
       end
       J = [J i*(m-(i+1)/2)-m+j];
       Y(J) = []; % no need for the cluster information about j.

       % update m, N, R
       m = m-1;
       N(n+s) = N(R(i)) + N(R(j));
       R(i) = n+s;
       R(j:(n-1))=R((j+1):n);
    end

if any(strcmp(method,'centroid'))
   result(:,3) = sqrt(result(:,3));
end

result(:,[1 2])=sort(result(:,[1 2]),2); % sort from dissmilarity 
end