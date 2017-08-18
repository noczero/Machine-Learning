function [my]= ngdelete(my,z)
      my([z],:) = [];
      my(:,[z])=[];
end