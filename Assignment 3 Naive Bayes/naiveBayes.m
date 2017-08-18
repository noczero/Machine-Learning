% NAIVE BAYES CLASSIFIER

clear
tic
disp('--- start ---')

distr='normal';
distr='kernel';

% read data
Aggr = csvread('Classification_datasets\Aggregation.csv');
X = double(Aggr(:,1:2));
Y = double(Aggr(:,3));

% Create a cvpartition object that defined the folds
c = cvpartition(Y,'holdout',.2);

% Create a training set
x = X(training(c,1),:);
y = Y(training(c,1));
% test set
u=X(test(c,1),:);
v=Y(test(c,1),:);

yu=unique(y);
nc=length(yu); % number of classes
ni=size(x,2); % independent variables
ns=length(v); % test set

% compute class probability
for i=1:nc
    fy(i)=sum(double(y==yu(i)))/length(y);
end

switch distr
    
    case 'normal'
        
        % normal distribution
        % parameters from training set
        for i=1:nc
            xi=x((y==yu(i)),:);
            mu(i,:)=mean(xi,1);
            sigma(i,:)=std(xi,1);
        end
        % probability for test set
        for j=1:ns
            fu=normcdf(ones(nc,1)*u(j,:),mu,sigma);
            P(j,:)=fy.*prod(fu,2)';
        end

    case 'kernel'

        % kernel distribution
        % probability of test set estimated from training set
        for i=1:nc
            for k=1:ni
                xi=x(y==yu(i),k);
                ui=u(:,k);
                fuStruct(i,k).f=ksdensity(xi,ui);
            end
        end
        % re-structure
        for i=1:ns
            for j=1:nc
                for k=1:ni
                    fu(j,k)=fuStruct(j,k).f(i);
                end
            end
            P(i,:)=fy.*prod(fu,2)';
        end

    otherwise
        
        disp('invalid distribution stated')
        return

end

% get predicted output for test set
[pv0,id]=max(P,[],2);
for i=1:length(id)
    pv(i,1)=yu(id(i));
end

% compare predicted output with actual output from test data
confMat=myconfusionmat(v,pv);
disp('confusion matrix:')
disp(confMat)
conf=sum(pv==v)/length(pv);
disp(['accuracy = ',num2str(conf*100),'%'])

toc