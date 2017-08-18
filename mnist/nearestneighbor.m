function hasil = nearestneighbor( dataTestiing_label , dataTrain_label )

cfsMat = zeros(10);
for i = 1:length(dataTestiing_label);
    vectorEuclidean = [];

    %mencari nilai jarak euclidean dengan membandingkan setiap data Testing oleh
    % setiap data Training
    for j = 1:length(dataTrain_label);
        jarakEuclidean = norm(dataTestiing_label(i,1:end-1)-dataTrain_label(j,1:end-1));
        vectorEuclidean = [vectorEuclidean ; jarakEuclidean dataTestiing_label(i,end)];
    end

    [M idx] = min(vectorEuclidean);
    posisi = vectorEuclidean(idx(1),2);
    %membuat confusion matrix
    cfsMat(dataTestiing_label(i,end)+1 , posisi+1) = cfsMat(dataTestiing_label(i,end)+1 , posisi+1) + 1;
end

    hasil = cfsMat;
end

