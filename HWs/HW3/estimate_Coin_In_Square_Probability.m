
function prob = estimate_Coin_In_Square_Probability(r,N)
 % input = the radius r and the number of times the coin is flipped N
 % NOTE TO MYSELF: we can do this by checking if random - r > 0 and if random + r < 1 for both x and y

 count_Fully_In = 0; % initialize the counter that will be used to count how many times
                     % the coin lands in the square

for i=1:N
    % simulate "tossing a coin"
    toss_Coin = where_Did_It_Land(r); 
    
    if (toss_Coin == 1)
        % if toss_Coin = 1, then the coin has landed fully in the square
        count_Fully_In = count_Fully_In + 1; % increasing the counter
    end
    
end

prob = count_Fully_In / N; % calculating the probability


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function val = where_Did_It_Land(R)
% this will be used to "randomize" where the coin lands
% the input R is equal to the radius, ie R = r

x_Coordinate = rand(); % randomizing the x coordinate
y_Coordinate = rand(); % randomizing the y coordinate

if (((x_Coordinate + R) < 1) && ((x_Coordinate - R) > 0)) 
    % if the coin is within the x boundaries
    
    if (((y_Coordinate + R) < 1) && ((y_Coordinate - R) > 0))
        % if the coin is also within the y boundaries      
        val = 1; % val = 1 means the coin was fully in the square            
    else      
        val = 0; % val = 0 because it was outside one of the y boundaries      
    end
    
else   
    val = 0; % val = 0 because it was outside one of the x boundaries    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Testing and Answering Questions

% for input r = 0.1, N = 1e5, the prob is 0.6408
% for input r = 0.1, N = 1e2, the prob is 0.6600
% for input r = 0.1, N = 1e4, the prob is 0.6453
% for input r = 0.1, N = 1e7, the prob is 0.6400
% for input r = 0.1, N = 1e8, the prob is 0.6401


% Q: does N = 1e5 seem like a reasonable amount?
   % A: Yes, I think N = 1e5 seems like a reasonable amount because the
   % probability seems to start being around the same number (ie ~0.640_) after 1e5
   % tosses
 
   
% Q: What makes this more difficult than the coin flip case we did in class?
   % The region that the coin can land in is bounded, and instead of just being one
   % single point (like with the dart problem) this coin is an area
