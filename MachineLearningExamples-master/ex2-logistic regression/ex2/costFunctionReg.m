function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
sz = size(X);
n = sz(2);

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

thetaX = X * theta;
pred = sigmoid(thetaX);

J = (-1/m) * (((log(pred))' * y) + ((log(1-pred))'*(1-y)));

sqTheta(1) = theta(1);
for i = 2:n
sqTheta(i) = theta(i)*theta(i);
end;

sumTheta=0;

for i = 2:n
sumTheta = sumTheta + sqTheta(i);
end;

sqTheta = (lambda/(2*m)) * sumTheta;

disp(sqTheta);

J = J + sqTheta;
disp(J);

grad = X'*(pred - y) ;

grad = (1/m) * grad ;

for i = 2:n
grad(i) = grad(i) + ((lambda/m) * theta(i));
end;


% =============================================================

end
