Compound = csvread('Classification_datasets\Compound.csv');
X = Compound(:,1:2);
Y = Compound(:,3);
visualize(X,Y);
addpath([pwd '/utils/']); 


yTarget = [];
for i = 1:length(Y)
    yTarget = [yTarget ; format_label(Y(i))];
end

% initialize network design and set parameters
% initialize network design and set parameters
model =  struct;
	model.numblocks = 20000; % number of runs through the training set
	model.numinitials = 10; % number of randomized models to be averaged across
	model.weightrange = 1; % range of initial weight values
	model.numhiddenunits = 6; % # hidden units
	model.learningrate = 0.000025; % learning rate for gradient descent
	model.outputrule = 'sigmoid'; % options: 'linear', 'sigmoid'

	
% 	inputs and targets will be XOR
model.inputs = X;

model.targets = yTarget;

result = MLP(model);


plot(result.training)
