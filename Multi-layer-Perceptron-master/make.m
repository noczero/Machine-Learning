function this = make(self, labels, predictions)
  this = self;
  if size(labels) ~= size(predictions)
    error('Number of prediction do not equal the number of labels');
  end
  for index=1:size(labels,1)
    row = find(this.confusion_matrix(:,1) == labels(index));
    column = find(this.confusion_matrix(1,:) == predictions(index));
    this.confusion_matrix(row,column) = this.confusion_matrix(row,column) + 1;
  end
  this.confusion_matrix(2:end,2:end) = this.confusion_matrix(2:end,2:end) + 1;
  this.confusion_matrix(1,1) = this.confusion_matrix(1,1) + 1;
end