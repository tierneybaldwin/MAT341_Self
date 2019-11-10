
function N = Newtons_1D_Opt(tol)

    Xn = 0.25; % Given initial value from part a
    % Xn = 1.5; % Given initial value from part b
    
    err = 1;
    
    N = 0;
    
    while err > tol
        Xtemp = Xn; % store the curr value of Xn
        Xn = Xn - f1(Xn)/f2(Xn); % Calculate Xn using Newton's Method
        
        err = abs(Xtemp - Xn); % calculate err
        N = N + 1;
    end
    % min = Xn % checking to make sure my min is correct
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

function val0 = f(x)
    val0 = 0.5 - x*exp(-x^2); % original function
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val1 = f1(x)
    val1 = 2*(x^2)*exp(-x^2) - exp(-x^2); % first derivative
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val2 = f2(x)
    val2 = -4*(x^3)*exp(-x^2) + 6*x*exp(-x^2); % second derivative
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
Answers:
2a) It took N = 5 iterations to achieve 1e-8 accuracy when x1 = 0.25.

2b) It took N = 736 iterations to achieve 1e-8 accuracy when x1 = 1.5.
    Also, the min it found was NaN.
%}
    