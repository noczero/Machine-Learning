function binaryLabel = makeTarget(label)
  binaryLabel = zeros(1,6); % 0 0 0 0 0 0
  if label == 0
    binaryLabel(6) = 1;
  else
    binaryLabel(label) = 1;
  end
end