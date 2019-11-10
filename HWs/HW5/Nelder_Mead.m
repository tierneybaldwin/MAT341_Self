function N = Nelder_Mead(tol)

% Setting initial values
    xVec(1) = 0.35; % given initial x1
    yVec(1) = 2.8; % given initial y1
    % solve for f based on these x and y
    fVec(1) = f(xVec(1),yVec(1)); 
    
    %   xVec(2) = -0.25; % given initial x2 in part a
    %   yVec(2) = 0.3; % given initial y2 in part a
    %   xVec(2) = 1.75; % given initial x2 in part c
    %   yVec(2) = 0.1; % given initial y2 in part c
    xVec(2) = 4; % given initial x2 in part d
    yVec(2) = 4; % given initial y2 in part d
    % solve for f based on these x and y
    fVec(2) = f(xVec(2),yVec(2)); 

    %   xVec(3) = 1.5; % given initial x3 in part a
    %	yVec(3) = 0.5; % given initial y3 in part a
    xVec(3) = 4.5; % given initial x3 in part a
    yVec(3) = 4.5; % given initial y3 in part a
    % solve for f based on these x and y
    fVec(3) = f(xVec(3),yVec(3)); 


N = 0; % initialize counter

err = 1;

while err > tol

    [fNew, indsVec] = sort(fVec); % sort the fvec in terms of least to greatest
    
    x1 = xVec(indsVec(1)); % Because we are looking for a min, the smallest f
    y1 = yVec(indsVec(1)); % will be the 'best' approximation

    
    x2 = xVec(indsVec(2));
    y2 = yVec(indsVec(2));

    
    x3 = xVec(indsVec(3)); % the largest f is the 'worst' approx
    y3 = yVec(indsVec(3));

    
    
    Xm = 0.5 * ([x1 + x2; y1 + y2]); % Compute midpoint between vector x1 and x2
    Xr = 2*Xm - [x3; y3]; % Computing a reach vector
    
    if f(Xr(1), Xr(2)) < f(x3, y3)
        % If the endpoint reach vector is a better approx
        x3 = Xr(1);
        y3 = Xr(2);
    elseif f(Xr(1), Xr(2)) >= f(x3, y3)
        % If the endpoint of the reach vector is worse, compute a shorter
        % reach vector
        Xc = 0.5 * (Xm + [x3,y3]);
       
       if f(Xc(1), Xc(2)) < f(x3, y3)
           % If this shorter reach vector is a better approx
           x3 = Xc(1);
           y3 = Xc(2);
       else 
           % Shrink triangle in direction of x1
           x2 = 0.5 * (x1 + x2);
           y2 = 0.5 * (y1 + y2);
           x3 = 0.5 * (x1 + x3);
           y3 = 0.5 * (y1 + y3);
       end
    end
    
    % Reset all values of x, y and f now that we have new points
    fVec(1) = f(x1, y1);
    xVec(1) = x1;
    yVec(1) = y1;
    
    fVec(2) = f(x2, y2);
    xVec(2) = x2;
    yVec(2) = y2;

    fVec(3) = f(x3, y3);
    xVec(3) = x3;
    yVec(3) = y3;
    
    err = abs(fVec(1) - fVec(3)); % calculate error
    N = N + 1;
end
point = [xVec(1), yVec(1)] % the point that it converges to

output = [sin(xVec(1)), cos(yVec(1))] % local minima should occur when sinx = 1 and cosy = 1
                                        % this is to check my work

                          

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x,y)

  val = -(sin(x)+ cos(y)); % the function we are working with
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
Answers:
1a) It took N = 268 iterations to achieve 1e-8 accuracy.

1b) It converges to the point (1.5689, 0.0093), which is around (pi/2, 0).
    This doesn't look like 1e-8 accuracy though because 0.0093 is not
    within 8 decimal accuracy of 0.

1c) It took N = 828 iterations to achieve 1e-8 accuracy. It located the
    minima at (x,y) = (1.5721, 0.0010). I think that the number of
    iterations increased drastically because it probably used less
    effective step measures (maybe it had to shrink all points in the
    direction of x1 more often than it did with (a))

1d) The algorithm finds the minima at the point (-4.7123, -0.0001)
%}