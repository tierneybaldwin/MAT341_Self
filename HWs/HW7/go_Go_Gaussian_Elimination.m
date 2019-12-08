
function OpCount = go_Go_Gaussian_Elimination(N)

OpCount = 0; % initialize OpCount

A = rand(N,N); % randomize an NxN matrix

R = 2; % we will want to start by replacing the 2nd row
C = 1; % we will start with focusing on the first column

divideBy = A(1,1); % figure out what the number in the first row, first col is
for r = 1:N
    % scale the first row so that it is of the form [1 x1 x2 x3 ... xn]
    A(1,r) = A(1,r) / divideBy; 
    OpCount = OpCount + 1;
end

for k = 1:(N-1) % picks column to make all 0, ie we want all the terms in the 
                % first column to be zero after the first row so that we
                % will have something of the form [1 x12 x13 ... x1n
                                                 % 0 x22 x23 ... x2n
                                                 % ...
                                                 % 0 xn2 xn3 ... xnn ]
    
    for i = R: N % picks row we will start replacing
        scaleA = A(i,k); % finds what we should scale the
                         % previously specified row by when we are adding
                         
        
        for j = C:N
            % start replacing each element in the row by this value
            A(i,j) = A(i,j) - scaleA * A((R-1),j);
            OpCount = OpCount + 2;
        end
        
    end
    
    %  if the term on the diagonal is nonzero, we want to scale it so that
    %  it is a 1
    %  ie want to have [1 x12 ... x1n
                      % 0  1  ... x2n
                      % 0 0 1 ...
                      % ...
                      % 0 0 0 ... 1 ]
    divideBy = A(R,(k+1));
    for h = 1: N
        A(R,h) = A(R,h) / divideBy;
        OpCount = OpCount + 1;
    end
    R = R + 1; % from now on, we only need to focus on the rows that haven't been replaced
    C = C + 1; % we only need to focus on the columns that are nonzero

end
A; % print the matrix to check


whatRow = N-1; % we will only need to replace the rows up until the Nth row.
               % ie in the ith column, we want the element in A(i,i) = 1, but
               % everything else in the column to = 0
               % so when we are focused on the ith column, we only need to
               % change the first i-1 rows to 0

for column = N:-1:2
    for row = whatRow:-1:1
        getItToZero = A(row, column); % find out what the value of the element is in this row,col
        A(row,column) = A(row,column) - getItToZero*A(whatRow+1,column); % replace this row,col with row,col - row,col*1
        OpCount = OpCount + 2;
    end
    whatRow = whatRow-1; % reduce the last row counter
end

A; % print the matrix to check

