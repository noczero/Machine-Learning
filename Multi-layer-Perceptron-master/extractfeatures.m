%
% EXTRACTFEATURES( sample_data )
%
% Arguments: 'sample_data' is a 1-d vector, size 1x256.
%
% Process the supplied vector to generate a lower dimensional
% feature vector, to be used in a learning algorithm.
%
%
% Note: This MUST return a 1-d array
%
function x = extractfeatures( sample_data )

% Identify each element as 1 or 0 depending on the shade of grey
digdata = reshape(sample_data,16,16);

blackAndWhite = idivide(uint16(digdata),128);
%   /////-1-////
%   //        //
%   2         6
%   //        //
%   /////-7-////
%   3         5
%   //        //    
%   /////-4-////

% Remove surronding dark area 'Zeros' to make a frame-fit on the digit
blackAndWhite(~any(blackAndWhite,2), :) = [];
blackAndWhite(:, ~any(blackAndWhite,1)) = [];
[num_rows,num_columns] = size(blackAndWhite);
% divide the shape

% first quarter vertically
q1_num_rows = idivide(uint16(num_rows), 4, 'round');
% second quarter vertically (half)
q2_num_rows = idivide(uint16(num_rows), 2, 'round'); 
% third quarter vertically
q3_num_rows = idivide(uint16(num_rows * 3), 4, 'round'); 
% second quarter horizontally (half)
q2_num_columns = idivide(uint16(num_columns), 2, 'round'); 

if(num_rows > 1 && num_columns > 1)

    segments = ...
    [sum(sum(blackAndWhite(1:q1_num_rows,:),1))                           %seg1
     sum(sum(blackAndWhite(1:q2_num_rows,...
                                      1:q2_num_columns),2))               %seg2
     sum(sum(blackAndWhite(q2_num_rows + 1:num_rows,...
                                      1:q2_num_columns),2))               %seg3
     sum(sum(blackAndWhite(q3_num_rows:num_rows,:),1))                    %seg4
     sum(sum(blackAndWhite(q2_num_rows + 1:num_rows,...
                                      q2_num_columns + 1:num_columns),2)) %seg5
     sum(sum(blackAndWhite(1:q2_num_rows,...
                                      q2_num_columns + 1:num_columns),2)) %seg6
     sum(sum(blackAndWhite(q1_num_rows:q3_num_rows,:),1))];               %seg7

else
    segments = zeros(7,1);
end

x = segments';