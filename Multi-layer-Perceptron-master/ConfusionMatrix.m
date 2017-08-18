function obj = ConfusionMatrix(labels)
  obj.num_of_classes = size(labels,2);
  obj.confusion_matrix = ones(1 + obj.num_of_classes) .* (-1);
  obj.confusion_matrix(1,2:obj.num_of_classes + 1) = labels;
  obj.confusion_matrix(2:obj.num_of_classes + 1,1) = labels';

  obj = class(obj,'ConfusionMatrix');
end