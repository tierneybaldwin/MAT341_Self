
function prob = estimate_Triangle_Center_Circle_Probability(N)
% NOTE TO MYSELF: we can do this by focusing on the y-intercepts 
% NOTE TO MYSELF, how i'm going to solve this: find the slopes of the lines
% between AB, BC, and CA, then find their y intercepts. if one line has a
% y-int such that it is >= 0 but <= 2, and another has a y-int < 0 and >= -2, 
% then (0,0) should be in the triangle

counter = 0; % initializing the counter

for i=1:N 
    
  % randomizing point A
        x_Coor1 = 4 * rand() - 2; % will randomize the X coordinate 
                                  % to be somewhere between [-2,2]
        
        % formula for a circle is x^2 + y^2 = r^2
        % in this case y = +/- sqrt(4 - x^2)  
        y_Coor1 = sqrt(4 - (x_Coor1)^2);
        
        % randomizing the sign on y_Coor1  
        sign1 = -1;
        neg_Or_Pos1 = rand();
        if (neg_Or_Pos1 <= 0.5)
            sign1 = 1; 
        end
        y_Coor1 = y_Coor1 * sign1;
        
        
  % randomizing point B
        x_Coor2 = 4 * rand() - 2; % will randomize the X coordinate 
                                  % to be somewhere between [-2,2]  
        y_Coor2 = sqrt(4 - (x_Coor2)^2);
        
        % randomizing the sign on y_Coor2
        sign2 = -1;
        neg_Or_Pos2 = rand();
        if (neg_Or_Pos2 <= 0.5)
            sign2 = 1; 
        end
        y_Coor2 = y_Coor2 * sign2;
  
        
  % randomizing point C
        x_Coor3 = 4 * rand() - 2; % will randomize the X coordinate 
                                  % to be somewhere between [-2,2]  
        y_Coor3 = sqrt(4 - (x_Coor3)^2);
        
        % randomizing the sign on y_Coor3
        sign3 = -1;
        neg_Or_Pos3 = rand();
        if (neg_Or_Pos3 <= 0.5)
            sign3 = 1; 
        end
        y_Coor3 = y_Coor3 * sign3;

        
  % Calculating the slope for line AB
     m1 = (y_Coor2 - y_Coor1)/(x_Coor2 - x_Coor1);
  % Calculating the y-int for the line AB
  % NOTE TO MYSELF: y = mx + b, so b = y - mx
     y_Int_AB = y_Coor1 - (m1 * x_Coor1);
     
  % Calculating the slope for line BC
     m2 = (y_Coor3 - y_Coor2)/(x_Coor3 - x_Coor2);
  % Calculating the y-int for the line BC
     y_Int_BC = y_Coor2 - (m2 * x_Coor2);
     
   % Calculating the slope for line CA
     m3 = (y_Coor1 - y_Coor3)/(x_Coor1 - x_Coor3);
   % Calculating the y-int for the line BC
     y_Int_CA = y_Coor3 - (m3 * x_Coor3);
  
     
   % Determining if any of the y-ints are >= 0 and <=2
     pos_y_Int = 0; % initializing the variable. 0 = false, 1 = true
   
     if (((y_Int_AB >= 0) && (y_Int_AB <= 2)) || ((y_Int_BC >= 0) && (y_Int_BC <= 2)) || ((y_Int_CA >= 0) && y_Int_CA <= 2))   
        pos_y_Int = 1; % at least one of the y-intercepts is >= 0 and <= 2
     end
   
   % Determining if any of the y-ints are < 0 and >= -2
     neg_y_Int = 0; % initializing the variable. 0 = false, 1 = true
   
     if (((y_Int_AB < 0) && (y_Int_AB >= -2)) || ((y_Int_BC < 0) && (y_Int_BC >= -2)) || ((y_Int_CA < 0) && (y_Int_CA >= -2)))
        neg_y_Int = 1; % at least one of the y-intercepts is < 0 and >= -2
     end 
   
    
    % Checking to see if at least one of the y-ints is >= 0 and at least
    % one is < 0
    if ((pos_y_Int == 1) && (neg_y_Int == 1))
        counter = counter + 1; % because one y-int was >= 0 / <= 2 and another was < 0 / >= -2
                               % (0,0) will be included in the triangle
    end
    
    
 %{ 
 % This is what we did in office hours, I didn't want to delete it just in
 % case I want to refer back to anything in the future...
    
  counter % prints counter  
            
  % test plot
  xV=-2:0.025:2;
  yV= sqrt(4-xV.^2);
  plot(xV,yV,'r-'); hold on; % plots the top half of the circle
  plot(xV,-yV,'r-'); hold on; % plots the bottom half of the circle
  plot(x_Coor1,y_Coor1,'b*','MarkerSize',5); hold on; % plots point A
  plot(x_Coor2,y_Coor2,'b*','MarkerSize',5); hold on; % plots point B
  plot(x_Coor3,y_Coor3,'b*','MarkerSize',5); hold on; % plots point C
  axis square; % makes the axis square
  pause(); % pauses a while loop until u tell it to keep going
  clf;
   %} 
    
end   
    

prob = counter / N; % calculating the probability
                