
load ('ex5data1.mat');

% m = Number of examples
m = size(X, 1);
X = [ones(m, 1) X];
theta = [1 ; 1];
lambda = 0;

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
h = X*theta;
l = (lambda/(2*m))*(theta(2:end).^2);
J = (1/(2*m))*(sum((h-y).^2)) + sum(l);

t = theta;
t(1) = 0;
l1 = (lambda/m)*t;
l2 = lambda*(1/m)*(t);
grad = (1/m)*(h-y)'*X;
fprintf(['grad = [%f; %f]\n'],grad(1),grad(2));
fprintf(['l1 = [%f; %f]\n'],l1(1),l1(2));
grad = (1/m)*((h-y)'*X)' + l1;
fprintf(['grad = [%f; %f]\n'],grad(1),grad(2));
fprintf(['t = [%f; %f]\n'],t(1),t(2));
fprintf(['l1 = [%f; %f]\n'],l1(1),l1(2));
fprintf(['lambda = [%f]\n'],lambda);

fprintf(['Gradient at theta = [1 ; 1]:  [%f; %f] '...
         '\n(this value should be about [-15.303016; 598.250744])\n'], ...
         grad(1), grad(2));




% =========================================================================

grad = grad(:);

