function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

pred = X * theta;
err = pred - y;
sqerr = err .^ 2;
sumerr = sum(sqerr);

theta_new = theta;
theta_new(1) = 0;
sqTheta = theta_new .^ 2;
reg = lambda * (sum(sqTheta));

J =  (1/(2*m)) * (sumerr +reg);

grad = (1/m) * ((X' * err ) + (lambda * theta_new));


% =========================================================================

grad = grad(:);

end
