
function N = Gradient_Descent_1(tol,gamma)

x = [1; 1.5]; % given initial (x,y)

err = 1; % initialize error

N = 0; % initialize counter

while err > tol
    
    xPrev = x; % store the curr value of x
    x = x - gamma*g(x); % calculate x_n+1
      
    err = sqrt(transpose(x-xPrev) * (x-xPrev)); % calculate the error
    N = N + 1;
    
end

% minX = sin(x(1)) % output the x val of the min, just to check
% minY = cos(x(2)) % output the y val of the min, just to check


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = f(x)
    val = -sin(x(1)) - cos(x(2)); % the given function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function grad = g(x)
    grad = [-cos(x(1)); sin(x(2))]; % calculate the gradient
  
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Answers:
    1a) It took N = 35 iterations to get within 1e-10 accuracy using a step 
        size of gamma = 0.5
    1b) It took N = 12 iterations to get within 1e-10 accuracy using a step 
        size of gamma = 0.9
    1c) It took N = 34 iterations to get within 1e-10 accuracy using a step 
        size of gamma = 1.5
%}