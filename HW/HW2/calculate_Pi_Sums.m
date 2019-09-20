
function calculate_Pi_Sums()

tol = 10^-6; % We want to see how many terms it will take to get within this much error of pi

% Variables used in calculating the first summation:
errA = 1; % initializing the error for the first summation, A
sumA = 0; % initializing the variable I will use to calulate the summation
nA = -1; % set nA = -1 because nA = nA + 1 once you enter the while loop

% Variables used in calculating the second summation:
errB = 1; % initializing the error for the second summation, B
sumB = 0; % initializing the variable I will use to calulate the summation
nB = -1; % set nB = -1 because nB = nB + 1 once you enter the while loop


while errA > tol 
    nA = nA + 1; % increase nA by 1 every time the loop is repeated
    
    sumA = sumA + (6 / (sqrt(3)) ) * ( (-1)^nA / ((3^nA) * (2*nA + 1)) ); % the formula for the first sequence
    
    errA = abs(pi - sumA); % calculate the difference between pi and the current sum  
end

nA % print the number of terms it takes to get the first sequence within 10^-6 decimals of pi
   % After running, it will take 10 terms (nA = 10)


   
while errB > tol
     nB = nB + 1; % increase nB by 1 every time the loop is repeated
     
     % the formula for the second sequence, I split it into two lines so
     % that it would be easier to read
     sumB = sumB + 16 * ( (-1)^nB / ((5^(2*nB + 1))*(2*nB + 1)) );
     sumB = sumB - 4 * ( (-1)^nB / ((239^(2*nB + 1))*(2*nB + 1)) );
     
     errB = abs(pi - sumB); % calculate the difference between pi and the current sum 
end

nB % print the number of terms it takes to get the second sequence within 10^-6 decimals of pi
   % It will take 3 terms (nB = 3)
