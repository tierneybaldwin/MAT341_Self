
function perform_NonLinear_Least_Squares()

N = 2500; % initialize N, the number of data points

% put the data in a matrix
data_Matrix = give_NonLinear_Least_Squares_Data(N);

B = [1 0.5 0.3]'; % given initial Beta
tol = 1e-2; % initialize tol
err = 1; % initialize err

while err > tol
    
 %{ 
   1) form J
      J should be matrix with 3 colms and N rows
   2) form delta(y^k)
       delta(y^k) = y() - f(x(i), B^k)
 %}
   for i = 1: N
    % getting the Jacobian
      x = data_Matrix(i,1);
      expy = exp( (-(x - B(2))^2 )/ (2 * B(3)^2));
      J(i,1) = expy;
      J(i,2) = B(1)*((x - B(2)) / B(3)^2 ) * expy;
      J(i,3) = B(1)*( ((x - B(2))^2) / (B(3)^3 ) ) * expy;
      
     % finding delta y 
      y(i,1) = data_Matrix(i,2) - f(data_Matrix(i,1), B);
   end
   
 % 3) Calculate the psuedo inverse
    delB = inv(transpose(J) * J) * transpose(J) * y;
    
 % 4) Calculate B^k+1. B^k+1 = B^k + delta(B)^k
    Bnext = B + delB;
 
 % 5) Calculate error
    err = sqrt( transpose(Bnext - B) * (Bnext - B) );
   
 % 6) Reset Beta, B^k = B^k+1 for next iteration
    B = Bnext;
end

for i = 1:length(data_Matrix(:,1))
    % calculate the y values corresponding to each x in the eqn
    yVal(i) = B(1) * exp((-(data_Matrix(i,1) - B(2))^2) / (2*B(3)^2));
end

% calculate and print the L2Norm
L2Norm = sqrt(transpose(data_Matrix(:,2) - y) * (data_Matrix(:,2) - y))


plot(data_Matrix(:,1), data_Matrix(:,2), 'b.', 'MarkerSize', 20); hold on;
plot(data_Matrix(:,1), yVal, 'r', 'LineWidth', 6); hold off;
leg = legend('Data', 'Model Fit');
xlabel('X');
ylabel('Y');

fs = 18; % FontSize
set(gca,'FontSize',fs);
set(leg,'FontSize',fs);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x,B)
val = B(1) * exp(-(x - B(2)).^2 / (2*(B(3)^2)));

