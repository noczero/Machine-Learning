% Configure the label to match output of the MLP
%
% FORMAT_LABEL( MLP object, label )
%
% Returns: formatted label

function formatted_label = format_label(label)
  formatted_label = zeros(1,6);
  if label == 0
    formatted_label(6) = 1;
  else
    formatted_label(label) = 1;
  end
end