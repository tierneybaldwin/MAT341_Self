
function val = square_Root_Sequence(m,n)
% m will be the value in the sqrt, n is the amount of terms in the sequence

Tn = sqrt(m); % initialize Tn

for i=n : -1 : 0  % count backwards!
    Tn = (Tn) * (-1)^(i-1); % makes the term negative/positive
    Tn = sqrt(m + Tn); 
end

Tn % output the final sum

% when (m,n) = (13, 31), the output Tn = 3
% when (m,n) = (13, 43), the output Tn = 3
% the limit appears to be 3