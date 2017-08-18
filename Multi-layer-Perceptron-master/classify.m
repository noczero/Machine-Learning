%
% Classify the given sample
% 
% CLASSIFY( MLP object, sample )
%
% Returns: The class with the highest probablity given by forward-feeding
%           the sample.
%
function result = classify(this, sample)
  output = forward_feed(this, sample);
  [~,index] = max(output.layer_output{output.num_layers});
  if index == 10
    result = 0;
  else
    result = index;
  end
end