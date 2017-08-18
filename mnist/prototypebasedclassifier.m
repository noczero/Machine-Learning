function hasil = prototypebasedclassifier( dataTestiing_label , dataPrototype )
%dataTrain = dataTestiing_label; %sample
%dataPrototype = hasil;
cfsMat = zeros(10);
for i = 1:length(dataTestiing_label);
    vectorEuclidean = [];

    %mencari nilai jarak euclidean dengan membandingkan setiap data oleh
    %data prototype
    for j = 1:10
        jarakEuclidean = norm(dataTestiing_label(i,1:end-1) - dataPrototype(j,:));
        vectorEuclidean = [vectorEuclidean ; jarakEuclidean];
    end

    [M idx] = min(vectorEuclidean);
    posisi = idx;
    %membuat confusion matrix
    cfsMat(dataTestiing_label(i,end)+1 , posisi) = cfsMat(dataTestiing_label(i,end)+1 , posisi) + 1;
end

    hasil = cfsMat;
end

