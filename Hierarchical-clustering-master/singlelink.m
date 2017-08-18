function distance = singlelink( point1 , point2 )
% this function is to calculate distance between 2 point
%   Detailed explanation goes here
    
    sub = point1 - point2;
    distance = sqrt(sum(sub.^2));

end

