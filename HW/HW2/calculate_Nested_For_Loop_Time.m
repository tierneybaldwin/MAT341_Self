
% tic/toc commands test how long it takes a snippit of code to run
function time = calculate_Nested_For_Loop_Time(N)

tic
k=0;
  for i1 = 1:N
     for i2 = 1:N
         for i3 = 1:N
            for i4 = 1:N
               k = k+1;
            end
         end
     end
end
time = toc
% It takes 0.0049 seconds to do 10 terms
%          0.1750 secs to do 100 terms
%          1.8996 secs to do 200 terms