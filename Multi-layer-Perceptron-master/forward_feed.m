% Pass a sample to the MLP for it to be classified
%
% FORWARD_FEED( MLP object, sample )
%
% Returns: An MLP with outputs of the given sample set
%
% NOTE the probability of each class is the output from the output layer
%
function this = forward_feed(self, sample)
  %first layer
  this = self;
  this.layer_output{1} = logsig(sum(this.layer_w{1} .* repmat([sample,1],this.hidden_nodes,1), 2))';

  % hidden layers
  for layer = 2 : this.num_layers - 1
    % w = this.layer_w{layer}
    this.layer_output{layer} = logsig(sum(this.layer_w{layer} .* repmat([this.layer_output{layer - 1},1],this.hidden_nodes,1), 2))';
  end
  % output layer applies softmax
  % w = this.layer_w{this.num_layers}
  final_outputs = exp(sum(this.layer_w{this.num_layers} .* repmat([this.layer_output{this.num_layers - 1},1],this.output_nodes,1), 2))';
  normalizer = sum(final_outputs);
  this.layer_output{this.num_layers} = final_outputs ./ normalizer;
end