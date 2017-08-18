function [ class ] = myknn( X_train,Y_train,q,k)

[row_train col_train]=size(X_train);
distance = zeros(row_train,1);
% find k nearest neighbor
for i=1:row_train
    distance(i)=norm(X_train(i,:)-q);
    
end

[Dsorted DIdx]=sort(distance);
smallestKIdx=DIdx(1:k);
% disp(smallestKIdx);
class = mode(Y_train(smallestKIdx));

end