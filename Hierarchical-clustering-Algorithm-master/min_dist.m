function [l,z] = min_dist(ty)
[m,n]=size(ty);
l=0;
z=0;
mino=999999999999999;
     for i=1:m
        for j=1:m
          if  ty(i,j)<mino && ty(i,j)>0
                        mino=ty(i,j);
                        l=i;
                        z=j;
              
           end
        end
    end
disp('Minimum value between cluster: ');
  disp(l);
  disp(z);
end