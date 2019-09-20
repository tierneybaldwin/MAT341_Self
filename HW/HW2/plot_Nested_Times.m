
function plot_Nested_Times()

N = [1:1:10 20:10:100 125 150 175 200 225 250]; 
L = length(N); % figuring how many entries are in the vector N

for i = 1:L    
   t(i) = calculate_Nested_For_Loop_Time(N(i)); 
       % testing how long it takes to run through the for loops, and adding the
       % time to a new vector t
end

% Plotting attributes
lw = 3; % line width
fs = 14; % font size

% Graphing
loglog(N, t, 'm', 'lineWidth', lw);
xlabel('N'); % changing the x axis to say "N"
ylabel('Time'); % changing the y axis to say "Time"
set(gca, 'FontSize', fs); % setting the font size


