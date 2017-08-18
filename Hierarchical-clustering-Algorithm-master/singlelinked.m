
function singlelinked

disp('....Single Linkage Agglomarative Algorithm....');
N=[4 4; 8 4; 15 8;24 4; 24 12]
 %N=[0 0; .5 0;0 2; 2 2;2.5 8; 6 3; 7 3]
% N=[ 1 1; 1.5 1.5;5 5; 3 4;4 4 ; 3 3.5]
    [m,n]= size(N);
    for i=1:m 
           for j=1:m
                mini_dist =(N(i,1)-N(j,1))^2 +(N(i,2)-N(j,2))^2; % finding minimum distant each point
                 mini_dist = sqrt(mini_dist);
                    ty(i,j)=mini_dist;
           end
    end
    disp(' Euclidean Distance');
    disp(ty);
        
   while 1

        [l,z]=min_dist(ty);
        [ty,z] = mini_swap(ty,l,z);

          if(l>z) te=l;
                l=z;
                z=te;
          end
        [d,e]=size(ty);  
        for b=2:d
            for f=1:b
              ty(b,f) = ty(f,b);
            end
        end
        disp('After Reducing Dimension:');
        [ty]=  ngdelete(ty,z);
        disp(ty);
        [d,e]=size(ty);
        disp(' Dsl = ');
        disp(ty);
        if d==2 && e==2
          break;
        end
   end
 
end








