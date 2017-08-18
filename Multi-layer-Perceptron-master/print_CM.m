function print_CM(this)
  accuracy = trace(this.confusion_matrix)./ ...
              sum(sum(this.confusion_matrix(2:end,2:end)));
  this.confusion_matrix
  fprintf('Accuracy : %.2f%%\n\n', accuracy*100);
end