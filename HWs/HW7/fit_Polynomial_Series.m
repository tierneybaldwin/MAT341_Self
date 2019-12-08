
function fit_Polynomial_Series()

N = 50; % we will be drawing 50 points
xData = linspace(-2*pi,2*pi,N); % make the x-values evenly spaced between -2pi and 2pi
yData = cos(xData)'; % apostrophe will make it a column vecto

for i = 1:length(xData)        
    for j = 0: 11         
        mat_A(i,j+1) = (xData(i))^j; % create of matrix of the function     
    end
end

% calculate Beta
Beta = inv(transpose(mat_A) * mat_A) * transpose(mat_A)* yData; % find B using the psuedo inverse

% calculate and print the residual
residual = sqrt( transpose(yData - mat_A*Beta) * (yData - mat_A*Beta)) % print the residual

% plot all the x and y coors as points
plot(xData, yData, 'bo', 'LineWidth', 6);  hold on;
    
% plot the line of best fit
for i = 1: length(xData)
   sum = 0;
   for j = 1: 12
       sum = sum + Beta(j) * xData(i).^(j-1);
   end
   y(i) = sum;
end

plot(xData, y, 'r', 'LineWidth', 4);


xlabel('X');
ylabel('Y');
legend('Data','Best Poly Fit'); % add a legend


%{
    Answers:
        1a) The residual when N = 10 is 0.5221. When N = 50, the residual
            is 0.0088. When N = 250, the residual is 0.0186. When N <= 11 
            the residual (error with finding a line of best fit) is increasing.
            Then the residual drastically decreases when N = 12, but starts
            to increase again after that.
        1b) We've seen cosine written as a polynomial before in Taylor
            series. The coefficients are (-1)^n / (2n)! 
        1c) Beta is the vector of coefficients. The coeffecients when N =
            250 are
            Beta =
               0.998592101840499
              -0.000000000000832
              -0.497178329131463
               0.000000000000233
               0.040752516215900
              -0.000000000000015
              -0.001279849085494
               0.000000000000000
               0.000018785542680
               0.000000000000000
              -0.000000112341413
              -0.000000000000000
        1d) They appear to fit the coefficients for the Taylor Series with
            some minor variations (most likely due to the inaccuracy in
            calculating a best fit). The zeroes come from how there are
            only even powers in the Taylor series for cosine (it does not
            have an x^1, x^3, x^5, etc term)
%}
