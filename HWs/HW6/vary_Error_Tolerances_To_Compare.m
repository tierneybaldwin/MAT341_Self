
function vary_Error_Tolerances_To_Compare()

errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11];

% bestGamma = 1; % tested in part 4a
bestGamma = 0.5; % tested in part 4b

for i = 1: length(errTolVec)
    gradient1_N(i) = Gradient_Descent_1(errTolVec(i), bestGamma);
    gradient2_N(i) = Gradient_Descent_2(errTolVec(i));
end

% Plotting attributes
fs = 14; % Font Size
lw = 5; % Line Width

% Plotting graph 1
figure(1); semilogx(errTolVec, gradient1_N, 'b', 'LineWidth', lw); hold on;
           semilogx(errTolVec, gradient2_N, 'r', 'LineWidth', lw);
           
xlabel('Gamma StepSize'); % labeling the x
ylabel('Number of Iterations, N'); % labeling the y axis
legend('Fixed Step', 'Barzilai-Borwein');
set(gca, 'FontSize', fs); % setting the font size

% Plotting graph 2
figure(2); loglog(errTolVec, gradient1_N, 'b', 'LineWidth', lw); hold on;
           loglog(errTolVec, gradient2_N, 'r', 'LineWidth', lw);

xlabel('Gamma StepSize'); % labeling the x
ylabel('Number of Iterations, N'); % labeling the y axis
legend('Fixed Step', 'Barzilai-Borwein');
set(gca, 'FontSize', fs); % setting the font size

%{
Answers:
    4a) The Fixed Step algorithm converges faster to the minimum, since it 
        requires less iterations to get there.
    4b) The Barzilai-Borwein algorithm converges faster to the minimum when
        the gamma used in the fixed step algorithm is gamma = 0.5;
    4c) The advantage to using the Barzilai-Borwein method is that it is
        less dependent on what gamma is initialized as because it will be
        recalculating gamme every step.
    4d) I would choose the Barzilai-Borwein method. If I wanted to use the 
        fixed step size method with a different function, I would first
        have to find what the best gamma to use is. With the Barzilai-Borwein
        method, I don't have to do that.
%}