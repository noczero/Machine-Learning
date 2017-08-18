function [ty,z] = mini_swap(ty,l,z)
 [o,p] = size(ty);
    for j=1:o
      if(ty(l,j)> ty(z,j))  
          ty(l,j)=ty(z,j);
      end
    end
 end