
function vary_StepSize_Gamma_To_Optimize()

tol = 1e-10; % we want to find accuracy within 1e-10

gamVec = [0.5:0.02:1.5]; % part a used gamma = 0.5, part c used gamma = 1.5

for i = 1: length(gamVec)
    % calculate the number of iterations N it takes to get within 1e-10
    % accuracy for the given gamma
    numberN(i) = Gradient_Descent_1(tol,gamVec(i)); % calculate the number of iterations
end

% Plotting attributes
fs = 14; % Font Size
lw = 5; % Line Width

% Plotting
semilogx(gamVec, numberN, 'b', 'LineWidth', lw);
xlabel('Gamma StepSize'); % labeling the x
ylabel('Number of Iterations, N'); % labeling the y axis
legend('Fixed Step');
set(gca, 'FontSize', fs); % setting the font size

%{
    2a) The best step size seems to be gamma = 1
%}