function model = gaussianNaiveBayesFit( X , Y);
% this function fits a Gaussian Naive Bayes model
% X is data
% Y is the class label of the x

searchLabel = unique(Y);
numberClass = length(yu); %number of classes

    for i=1:numberClass
        sameClass = double(Y==searchLabel(i)); % search same value of class i..numberClass in label Y
        priorProb(i) = sum(sameClass)/length(Y); % calculate sum of sameClass divide by number of data.
    end

    % gaussian distribution
    % likelihood from training set
    for i=1:numberClass
       Xi = X((Y==searchLabel(i)),:); %get data train from every class
       avgXi(i,:) = mean(Xi,1); %get average from each coulmn feature in Xi
       sigma(i,:)=std(Xi,1); %get standart deviation
    end


end