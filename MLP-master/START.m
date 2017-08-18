% ------------------------------------------------------------------------
%  This script sets up all the parameters needed to run a simple MLP.
%  The code is currently constrained to a single hidden layer, but the
%  training scripts can be edited for further flexibility.
% ------------------------------------------------------------------------

% initialize the search path
clear;close;clc;
addpath([pwd '/utils/']); 
compound 

% initialize network design and set parameters
model =  struct;
	model.numblocks = 200; % number of runs through the training set
	model.numinitials = 10; % number of randomized models to be averaged across
	model.weightrange = 1; % range of initial weight values
	model.numhiddenunits = 3; % # hidden units
	model.learningrate = .25; % learning rate for gradient descent
	model.outputrule = 'sigmoid'; % options: 'linear', 'sigmoid'

	
% 	inputs and targets will be XOR
model.inputs = [-1 -1
				 1  1
				-1  1
				 1 -1];

model.targets = [1 0
                 1 0
                 0 1
                 0 1];

result = MLP(model);

plot(result.training)
