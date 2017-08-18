function  hasil  = prototype( dataTraining , dataLabel)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%dataTraining = X;
%dataLabel = y;
dataTrain_label = [dataTraining(1:2500,:) dataLabel(1:2500)]; 
dataTestiing_label = [dataTraining(2501:5000,:) dataLabel(2501:5000)];


%membuat prototype
class0 = []; class1 = []; class2 = []; class3 = []; class4 = [];
class5 = [];class6 = [];class7 = []; class8 = []; class9 = [];
% membuat kelas dari dataTraining dengan label
    %mengelompokkan data & menyesuaikan class dengan label 
    for j = 1:length(dataTrain_label)
       switch dataTrain_label(j,end)
           case 0
               class0 = [class0; dataTrain_label(j,:)];
           case 1
                class1 = [class1; dataTrain_label(j,:)];
           case 2 
               class2 = [class2; dataTrain_label(j,:)];
           case 3
               class3 = [class3 ; dataTrain_label(j,:)];
           case 4
               class4 = [class4 ; dataTrain_label(j,:)];
           case 5
               class5 = [class5; dataTrain_label(j,:)];
           case 6
               class6 = [class6; dataTrain_label(j,:)];
           case 7
               class7 = [class7; dataTrain_label(j,:)];
           case 8
               class8 = [class8; dataTrain_label(j,:)];
           case 9
               class9 = [class9; dataTrain_label(j,:)];
       end
    end
    %hitung rata rata dari setiap class
    hasil = sum(class0) / length(class0);
    hasil = [hasil ; sum(class1) / length(class1)];
    hasil = [hasil ; sum(class2) / length(class2)];
    hasil = [hasil ; sum(class3) / length(class3)];
    hasil = [hasil ; sum(class4) / length(class4)];
    hasil = [hasil ; sum(class5) / length(class5)];
    hasil = [hasil ; sum(class6) / length(class6)];
    hasil = [hasil ; sum(class7) / length(class7)];
    hasil = [hasil ; sum(class8) / length(class8)];
    hasil = [hasil ; sum(class9) / length(class9)];
    
    %hapus kolom terakhir (label);
    hasil(:,end) = [];
end

