

function vary_Error_Tolerances_To_Compare()

% vector of different error tolerances
errTolVec= [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11  1e-12];

for i = 1: length(errTolVec)
    % find N given by golden search for each error, store it in a new vector
    golden_N(i) = golden_Search(errTolVec(i)); 
    
    % find N given by parabolic iteration for each error, store it in a new vector
    parabolic_N(i) = successive_Parabolic_Interpolation(errTolVec(i));  
    
end

% Plotting Golden and Successive Parabolic, with semilogx

figure; semilogx(errTolVec, golden_N, 'b', 'lineWidth', 5); hold on; semilogx(errTolVec, parabolic_N, 'r', 'lineWidth', 3);

xlabel('error tolerance, tol'); % labeling the x axis
ylabel('# of Iterations, N'); % labeling the y axis
legend('Golden Search', 'Succ. Para. Interp.');
set(gca, 'FontSize', 14); % setting the font size



% Plotting Golden and Successive Parabolic, with loglog
figure; loglog(errTolVec, golden_N, 'b', 'lineWidth', 5); hold on; loglog(errTolVec, parabolic_N, 'r', 'lineWidth', 3);

xlabel('error tolerance, tol'); % labeling the x
ylabel('# of Iterations, N'); % labeling the y axis
legend('Golden Search', 'Succ. Para. Interp.');
set(gca, 'FontSize', 14); % setting the font size


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
3a) The successive parabolic interpolation algorithm converges to the
minimum faster for less accurate tolerances. It takes less iterations to
get within the error tolerance.

3b)When you increase the accuracy threshold, the number of iterations required
to get within the error tolerance increases for both methods.
As the error tolerance decreases, the succ. para. interp. becomes less
effective, and requires more iterations in order to get within the error
tolerance. This is because it's difficult to accurate invert a matrix after
a certain point.
The golden search has a more 'constant' or 'linear' speed across
all tolerances. 

%}
