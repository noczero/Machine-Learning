function errors = total_error(result, label)
  errors = sum((result - label).^2);
end