
function N = successive_Parabolic_Interpolation(tol)

x1 = 0; % initial x1, given
x2 = 0.6; % initial x2, given
% x3 = 0.9; % initial x3, given in 2a
% x3 = 2; % initial x3, given in 2b
 x3 = 1.2; % initial x3, given in 2b

err = 1;

N = 0;

while err > tol
    A = [(x1)^2 x1 1; (x2)^2 x2 1; (x3)^2 x3 1]; % create matrix of system of equations to find 
                                                  % what a,b,c should be
                                                  % for ax^2 + bx +c
    coeffs = inv(A) * [f(x1); f(x2); f(x3)]; % find a,b,c
                                             % ie :     [(x1)^2  x1  1  * [a     [f(x1)       
                                             %     A =   (x2)^2  x2  1     b  =   f(x2)   
                                             %           (x3)^2  x3  1]    c]     f(x3)]
                                             % so inv(A) * f(x_) = [a; b; c]
    
    a = coeffs(1);
    b = coeffs(2);
    c = coeffs(3);
    
    vertex = -b/(2*a); % formula for vertex
    
    x3 = x2; % move x3 in
    x2 = x1; % move x2 in
    x1 = vertex; % set x1 to the vertex
    
    err = abs(x3 - x1); % find err
    
    N = N + 1; % increase the counter
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)
  val = 0.5 - x*exp(-x^2); % given funtion
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{ 
2a) N = 84. It took 84 iterations to achieve 1e-8 accuracy

2b) N = 38. It took 38 iterations to achieve 1e-8 accuracy. MatLab
issued the warning "Matrix is singular to working precision". This means
that we can't accurately compute the matrix because it goes beyond
computer's 15-decimal limit.


%}
 
 