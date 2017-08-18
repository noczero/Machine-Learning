%menjalankan fungsi loadmnist
%5000 data image diextract ke vector
[X y] = loadmnist(5000);

%plot digitalhandwiring sebanyak 100 image
VariableTest = X(1:100,:);
[rows col] = size(VariableTest);
visual(VariableTest);
kolom = ceil(sqrt(size(VariableTest,1)));

yinvers = y(1:rows,:)';
baris = ceil(size(yinvers,2)/kolom);
newmatriks = reshape(yinvers,[kolom baris]);

%membuat text pada plot untuk memverifikasi data 
%apakah sudah sesuai dengan label
for i=0:baris-1
    for j = 0 :kolom-1       
       temp= mat2str(newmatriks(i+1,j+1))
        text(30*i,30*j,temp);
    end
end