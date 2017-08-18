%i.do the transpose of vector x
dataTranspose = X';

%ii. Zero Centered, search mean and substract to every element based on
%coloumn
jumlahTotal = sum(dataTranspose);
rata_rata = jumlahTotal / length(dataTranspose(:,1));

zeroCentered  = [];
for i = 1 : length(dataTranspose(:,1))
   zeroCentered = [zeroCentered ; dataTranspose(i,:) - rata_rata];    
end

%iii. Covariance Matrix C of the zero-centered data
C = cov(zeroCentered);

%iv. eigen vector and eigen values
%V for eigen values
%D for eigen vector
[ V , D ] = eig(C);

%v. sort descending eigen value and vector
lrdescD = fliplr(D); %flip left to right eigen vector
descD = flipud(lrdescD); %flip up to down eigen vector
descV = fliplr(V); %flip left to right eigen value

%vi. display
visual(descV(1:64,1:64));

%vii. transform to PCA
Vrow = descV(:,1:64)';
yPCA = Vrow *  X;

%viii. 64 x 784

%c. reconstruction data
xRev = Vrow' * yPCA;
visual(xRev(1:100,:));

%d. correct reconstruction

%%LAMA
sumEigValue_PCA = sum(descV(:,1:64)); 
sumEigValue_PCA = sum(sumEigValue_PCA');%total element of eigen value 1:64

totalEigValue = sum(descV);
totalEigValue = sum(totalEigValue');%total element of all eigen value

correctRecons = (sumEigValue_PCA / totalEigValue) * 100 ; %variance of proportional


listCorrect = [];
for i = 1 : 784
   sumEigValue_PCA = sum(descV(:,1:i)); 
    sumEigValue_PCA = sum(sumEigValue_PCA');%total element of eigen value 1:64

    totalEigValue = sum(descV);
    totalEigValue = sum(totalEigValue');%total element of all eigen value

    correctRecons = (sumEigValue_PCA / totalEigValue) * 100 ; %variance of proportional
    listCorrect = [listCorrect;  correctRecons];
end

%e.
plot(1:784,listCorrect);

%f.
A = [];
missRate = [];
miss = [0];
for i = 1:200
   vFullPCA = descV(:,1:1000)';
   prePCA = vFullPCA * X;
   trainXPCA = vFullPCA' * prePCA; 
   if (mod(i,5)==0)
    %Transform to PCA Domain
    Vrow = descV(:,1:i)';
    yPCA = Vrow *  X;
    xRev = Vrow' * yPCA;
    %training 
    Mdl = fitcknn(trainXPCA,y,'NumNeighbors', 15);
    %predict label 
    label = predict(Mdl, xRev);
    
        for j= 1:1000
           if (label(j,1) ~= y(j,1))
            miss = miss + 1;
           end
        end
    missRate = [missRate ; miss/1000];
   end
end

%g.
plot(5:5:200,missRate);






