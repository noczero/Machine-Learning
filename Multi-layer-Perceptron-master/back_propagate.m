% Implement the back-propagation algorithm to train the MLP
%
% BACK_PROPAGATE( MLP object, sample, label, result )
%
% result is the output of the MLP with the given sample
%
% Returns: An MLP with updated weights
%

function this = back_propagate(self, sample, label, result)
  this = self;
  new_weights = cell(1,this.num_layers);

  %output layer --> d(E)/d(result) * d(result)/d(netSum) * d(netSum)/d(weight)
  dEdW = (...
    repmat((label - result).* ...
    result.*(1 - result),this.hidden_nodes + 1,1).* ...
    repmat([this.layer_output{this.num_layers - 1},1]',1,this.output_nodes)...
         )';

  % UPDATE new weight = learning rate * d(E)/d(Weight) * input pair of weight
  new_weights{this.num_layers} = this.learning_Rate.*dEdW ...
                                + this.layer_w{this.num_layers};


  %for each hidden layer except first backpropagate the derivative
  for layer = this.num_layers - 1 : -1 : 2
    dsum = sum(dEdW.*this.layer_w{layer + 1},1);
    dsum = dsum(1:this.hidden_nodes); % remove d(E)/d(Bias Weight)
    dEdW = (...
      repmat((1 - this.layer_output{layer}).*dsum,this.hidden_nodes + 1,1).*...
      repmat([this.layer_output{layer - 1},1]',1,this.hidden_nodes)...
           )';

    new_weights{layer} = this.learning_Rate.*dEdW + this.layer_w{layer};
  end

  % first layer
  dsum = sum(dEdW.*this.layer_w{2},1);
  dsum = dsum(1:this.hidden_nodes); % remove d(E)/d(Bias Weight)
  dEdW = (...
    repmat((1 - this.layer_output{1}).*dsum,this.feature_length + 1,1).*...
    repmat([sample,1]',1,this.hidden_nodes)...
         )';
  
  new_weights{1} = this.learning_Rate.*dEdW + this.layer_w{1};

  this.layer_w = new_weights;
end