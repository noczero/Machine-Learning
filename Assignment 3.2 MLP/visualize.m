function visualize(X , Y)
    % Y is label class
    rowsToSetBlue = Y == 1;
    rowsToSetRed = Y == 2;
    rowsToSetYellow = Y == 3;
    rowsToSetMagenta = Y == 4;
    rowsToSetGreen = Y == 5;
    rowsToSetBlack = Y == 6;

    % Set colormap to blue for the blue rows.
    myColors(rowsToSetBlue, 1) = 0;
    myColors(rowsToSetBlue, 2) = 0;
    myColors(rowsToSetBlue, 3) = 1;
    % Set colormap to red for the red rows.
    myColors(rowsToSetRed, 1) = 1;
    myColors(rowsToSetRed, 2) = 0;
    myColors(rowsToSetRed, 3) = 0 ;
    % Set colormap to red for the yellow rows.
    myColors(rowsToSetYellow, 1) = 1;
    myColors(rowsToSetYellow, 2) = 1;
    myColors(rowsToSetYellow, 3) = 0;
    % Set colormap to red for the Magenta rows.
    myColors(rowsToSetMagenta, 1) = 1;
    myColors(rowsToSetMagenta, 2) = 0;
    myColors(rowsToSetMagenta, 3) = 1;
    % Set colormap to red for the green rows.
    myColors(rowsToSetGreen, 1) = 0;
    myColors(rowsToSetGreen, 2) = 1;
    myColors(rowsToSetGreen, 3) = 0;
    % Set colormap to red for the black rows.
    myColors(rowsToSetBlack, 1) = 0;
    myColors(rowsToSetBlack, 2) = 0;
    myColors(rowsToSetBlack, 3) = 0;
    
    % show scatter
    scatter(X(:,1) , X(:,2) , 20 , myColors);
end