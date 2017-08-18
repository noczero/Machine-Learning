function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

J = 0;
for i = 1:num_movies
    for j = 1:num_users
       if (R(i,j) == 1)
          err =  X(i,:)*Theta(j,:)' - Y(i,j);
          sqerr = err * err;
          J = J + sqerr;
       end
    end
end 

J = (1/2) * J;

theta_reg = Theta .^ 2;
sum_theta = sum(theta_reg);
sum_theta = sum(sum_theta);

X_reg = X .^ 2;
sum_X = sum(X_reg);
sum_X = sum(sum_X);

J = J + ((lambda/2) * (sum_X + sum_theta));

% X --> movies
for i = 1:num_movies
    for k = 1:num_features
        gradX = 0;
        j = find(R(i,:) == 1);
        sz = size(j);
        if(sz > 0)
        for jn = 1: sz
          err =  (X(i,:)*Theta(j(jn),:)') - Y(i,j(jn));
           err = err * Theta(j(jn),k);
          gradX = gradX + err;
        end
        end
       X_grad(i,k) = gradX;
    end
end 

% theta --> users
for j = 1:num_users
    for k = 1:num_features
        gradTheta = 0;
        i = find(R(:,j) == 1);
        sz = size(i);
        if(sz > 0)
        for in = 1: sz
          err =  (X(i(in),:)*Theta(j,:)') - Y(i(in),j);
           err = err * X(i(in),k);
          gradTheta = gradTheta + err;
        end
        end
       Theta_grad(j,k) = gradTheta;
    end
end 

pred = X * Theta';
error = pred - Y;
error = error .* R;
X_grad = error * Theta;
lambda_x = lambda * X;
X_grad = X_grad + lambda_x;

Theta_grad = error' * X ;
lambda_theta = lambda * Theta;
Theta_grad = Theta_grad + lambda_theta;
% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
