function obj = MLP(learning_Rate, num_layers, hidden_nodes, feature_length, epoch)
  % this function is to create model of JST from the variable that we need
  % learning_Rate is the move of weight
  % num_layers is number of implement layers eg; 2 : 1 Hidden - 1 Output
  % hidden_nodes is number of hidden nodes in hidden layers
  % feature_length is number of coloumn in data
  % epoch is maximum iteration of learning
  if num_layers < 2
    error('Number of layers must be at least 2');
  end
  obj.num_layers        = num_layers;   
  obj.hidden_nodes      = hidden_nodes;
  obj.feature_length    = feature_length;
  obj.output_nodes      = 6;
  obj.layer_w           = cell(1, num_layers);
  obj.layer_output      = cell(1, num_layers);
  obj.learning_Rate     = learning_Rate;
  obj.epoch             = epoch;

  % give random value weight to w1 
  obj.layer_w{1} = randn(feature_length , hidden_nodes).*0.1;

  % this for more than 2 layers
  for layer = 2 : num_layers - 1
    obj.layer_w{layer} = randn(hidden_nodes,hidden_nodes ) .* 0.1;
  end
  
  % this weight is last weight layer before output layer
  obj.layer_w{num_layers} = randn(hidden_nodes,obj.output_nodes) .* 0.1;

end