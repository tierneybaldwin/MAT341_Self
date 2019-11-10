
function N = Newtons_2D_Opt(tol)

 % Xn = [-0.25; 0.25]; % Initial Vector, given in part a
 Xn = [-4.5; 4.5]; % Initial Vector, given in part b
 
 err = 1; % initialize err to be greater than tol

 N = 0; % initialize counter
 
 while err > tol
    Xtemp = Xn; % Store the curr value of Xn
    Xn = Xn - inv(hession_f(Xn)) * gradient_f(Xn); % Calculate Newton's Method
                                                       % Xn - hession * gradient
       
    err = sqrt(transpose(Xn - Xtemp) * (Xn-Xtemp)); % recalculate err
    N = N + 1;
 end
    
min = Xn % output the min found
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

function val = f(x)
 val = -(sin(x(1)) + cos(x(2))); % original function
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function G = gradient_f(x)
 df_dx = -cos(x(1));
 df_dy = sin(x(2));
    
 G = [ df_dx; df_dy ]; % output is the gradient
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function H = hession_f(x)
 df_dx2 = sin(x(1));
 df_dydx = 0;
 df_dxdy = 0;
 df_dy2 = cos(x(2));
    
 H = [df_dx2  df_dxdy; df_dydx  df_dy2]; % output is the hession

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Answers:
4a) It took N = 5 iterations to find the minima (x,y) = (-4.7124, 0)

4b)It took N = 4 iterations to find the minima (x,y) = (-4.7124, 0), which
   is the same min as found in part a
%}