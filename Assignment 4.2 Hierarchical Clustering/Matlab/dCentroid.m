function distance = dCentroid( X,Y,N,R,i,j,v )
% this function is to calculate the distance using centroids approach

 K = N(R(i))+N(R(j));
 distance = (N(R(i)).*X+N(R(j)) .*Y - (N(R(i)).*N(R(j))*v) ./K) ./K;

end

