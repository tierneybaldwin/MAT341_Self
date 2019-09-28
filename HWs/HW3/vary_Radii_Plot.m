
function vary_Radii_Plot()
% this function will see how the likelihood of the coin landing in the
% square changes as r changes

rVec= [0.01:0.005:0.10  0.1:0.01:0.5];
% the radii we will be testing

for i=1:length(rVec)
    
    prob_i = estimate_Coin_In_Square_Probability(rVec(i), 1e5); 
    % calculate the probability of the coin landing at the ith index of the vector
    
    coin_Landed_Inside(i) = prob_i;
    % store the probability of the coin landing fully inside the square
    
end

% Plotting
plot(rVec, coin_Landed_Inside, 'r.');
xlabel('Radius, r'); % labeling the x
ylabel('Prob of Coin Landing in Square'); % labeling the y axis
set(gca, 'FontSize', 14); % setting the font size


% Q: Approximately what values of r give estimated probabilities of 0.5, 0.1, and 0.01?
% when r = 0.14, the prob is about 0.5
% when r = 0.34, the prob is about 0.1
% when r = 0.45, the prob is about 0.01
