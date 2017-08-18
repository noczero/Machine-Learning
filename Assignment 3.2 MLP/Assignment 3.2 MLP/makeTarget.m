function binaryLabel = makeTarget(label)
   % convert the class label to formatted label
   % for example if 1 then return 1 0 0 0 0 0 
  binaryLabel = zeros(1,6); % 0 0 0 0 0 0
  binaryLabel(label) = 1;
end