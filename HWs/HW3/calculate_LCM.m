
function lcm_val = calculate_LCM(x,y)
% finds the LCM between two numbers

N = x*y; % one common multiple will always be x*y, but it will only sometimes be the LCM

for i=1:N
    if (mod(i,x) == 0) && (mod(i,y) == 0) 
        % check to see if both remainders = 0, ie if both x and y divide i evenly
        lcm_val = i; % stores the LCM as whatever i currently is
        break % breaks out of the loop and ends code, we've found the LCM
    end
end

