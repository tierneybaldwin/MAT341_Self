
function fit_Sine_Series()
    
N = 500;
xData = linspace(-pi,pi,N);
yData = ((0.25*xData.^2).*cos(xData).^4.*sin(xData).^7)'; % apostrophe will make it a column vector 
                                                          % ?.? will perform component wise multiplication

M = 20; % the number of terms in the  model function

for i = 1:length(xData)        
    for j = 1: M         
        mat_A(i,j) = sin(j*xData(i)); % create of matrix of the function     
    end
end

% calculate beta
Beta = inv(transpose(mat_A) * mat_A) * transpose(mat_A)* yData; % find B using the psuedo inverse

% calculate and print the residual
residual = sqrt( transpose(yData - mat_A*Beta) * (yData - mat_A*Beta)) % print the residual

% plot all the x and y coors as points
plot(xData, yData, 'bo');  hold on;
    
% plot the line of best fit
for i = 1: length(xData)
   sum = 0;
   for j = 1:M
       sum = sum + Beta(j) * sin(j*xData(i));
   end
   y(i) = sum;
end

plot(xData, y, 'r', 'LineWidth', 4);

legend('Data','Best Sine Series Fit'); % add a legend

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
    Answers:
        2a) When N = 500, and M = 5, the residual is 0.0813.
            When M = 10, the residual is 0.0096.
            When M = 20, the residual is 2.1412e-06.
            When M = 40, the residual is 3.9199e-09.
        2b) The name of this series/functon is called the Fourier Sine
            Series.
%}