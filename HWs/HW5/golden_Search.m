
function N = golden_Search(tol)
 % the output N will be the counter, will say how many iterations it takes
 % to get within a specific error tolerance
 
T = (sqrt(5) - 1) / 2;  % Golden Search algorithm

a = 0; % initialize a
b = 2; % initialize b

err = b - a; % initialize err

N = 0; % initialize the counter

while err > tol
 
 x1 = a + (1-T)*(b-a); % set x1 to be some distance h from the lower bound
 x2 = a + T*(b-a); % set x2 to be the same distance h from the upper bound

 if f(x1) > f(x2)
        a = x1; % reset the lower bound as whatever x1 is
    else
        b = x2; % reset the upper bound as whatever x2 is
 end
    
    err = b-a; % recalculate error
    N = N + 1; % increase the count 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function eqn = f(x)
   eqn = 0.5 - x * exp(-(x^2)); % decide what your eqn is
   

   
% 1a) It takes 40 iterations to achieve 1e-8 accuracy.

   