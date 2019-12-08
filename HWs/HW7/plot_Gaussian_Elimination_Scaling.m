
function plot_Gaussian_Elimination_Scaling()

NVec = 2:1:100; % given N vector

for i = 1: length(NVec)
    % Calculate the number of operations it takes to get rref for each N 
    OpCounts(i) = go_Go_Gaussian_Elimination(NVec(i));
end

% Plotting attributes
fs = 14; % Font Size
lw = 5; % Line Width

% Plotting graph 1
figure(1); loglog(NVec, OpCounts, 'b', 'LineWidth', lw);
           
xlabel('Size of Matrix, N'); % labeling the x
ylabel('Operation Count'); % labeling the y axis
legend('OpCount');
set(gca, 'FontSize', fs); % setting the font size

% Plotting graph 2
figure(2); plot(NVec, OpCounts, 'b', 'LineWidth', lw); 

xlabel('Size of Matrix, N'); % labeling the x
ylabel('Operation Count'); % labeling the y axis
legend('OpCount');
set(gca, 'FontSize', fs); % setting the font size

%{
    Answers: 
    4a) As the number of N increases, there appears to be a cubic
        relationship between the number of the operations needed and the
        number of N. For example, when N = 5, it takes 125 operations to
        get rref.
%}