% Multi-layer Perceptron class
%
% MLP( learning_Rate, num_of_layers, num_of_hiddenNodes, num_of_features )
%
% Arguments: 
%  'learning_Rate' a real number controlling how large changes to weights when training.
%               usually set 0 > lR < 1.
%  'num_of_layers' the number of layers the MLP has. Should be an integer > 2 
%               (1 hidden + 1 output).
%  'num_of_hiddenNodes' the number of nodes within each hidden layer.
%
%  'num_of_features' The number of features used for each sample
%
% Returns: MLP object with 10 output nodes
function obj = MLP(learning_Rate, num_layers, hidden_nodes, feature_length, epoch)
  if num_layers < 2
    error('Number of layers must be at least 2');
  end
  obj.num_layers = num_layers;
  obj.hidden_nodes = hidden_nodes;
  obj.feature_length = feature_length;
  obj.output_nodes = 6;
  obj.layer_w = cell(1, num_layers);
  obj.layer_output = cell(1, num_layers);
  obj.learning_Rate = learning_Rate;
  obj.epoch = epoch;

  %bias weight is last ,Assumes 7 features
  obj.layer_w{1} = randn(feature_length , hidden_nodes).*0.1;

  for layer = 2 : num_layers - 1
    obj.layer_w{layer} = randn(hidden_nodes,hidden_nodes ) .* 0.1;
  end

  obj.layer_w{num_layers} = randn(hidden_nodes,obj.output_nodes) .* 0.1;

end