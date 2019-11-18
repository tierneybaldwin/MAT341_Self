
function N = Gradient_Descent_2(tol)

x = [1; 1.5]; % given initial (x,y)
gamma = 0.5; % given initial value for gamma

err = 1; % initialize error

N = 0; % initialize counter

while err > tol
   
    if (N >= 1)
        % find a better gamma step during each iteration using Barzilai-Borwein 
        gamma = abs(transpose(x-xPrev) * (g(x)-g(xPrev)));
        gamma = gamma/ (transpose(g(x)-g(xPrev)) * (g(x)-g(xPrev)));
    end
    
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
    3a) It took N = 6 iterations to get within 1e-6 accuracy.
    3b) It took N = 7 iterations to get within 1e-10 accuracy.
%}    