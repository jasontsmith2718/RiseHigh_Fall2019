%% Solutions to day #1 problems!

%% % % % % % % Problem #A: % % % % % % 
% - What is the difference between creating numerical arrays using the first
% approach versus using the second technique (using "linspace()")?

% ANSWER: linspace() requires you to type in the number of values you wish to
% obtain.


%% % % % % % % Problem #B: % % % % % % 
% - Plot a red line with slope of -3 and y-intercept of 2 along with a blue
% scatter plot with the same x-values.

m = -3; % Slope
b = 2; % y-intercept
x = (0:1:10); % x-values

y = m.*x + b; % y = mx + b (straight line)

% Blue defaults as first, so in order to plot a "red line" the plot() function must 
% be used after the scatter function.
figure; scatter(x,y);
xlabel('x-axis'); 
ylabel('y-axis');
hold on; 
plot(x,y); 

% You should see red circles overlaid onto the previous blue line!


%% % % % % % % Problem #1: % % % % % % 
% a) Generate a dataset with y(x) = x^2 + 4 using x values ranging from -20 to 20.
% b) Use polyfit to fit a second order function to y.
% c) Plot the original data along with the two plots (with legend).
% *Hint #1* remember the equation for a second order polynomial! 
% (y = Ax^2 + Bx + C)

% *Hint #2* polyfit(x,y,n) takes three arguments:
% 1) x values
% 2) y values
% 3) the order of the function you wish to fit! 

% Type your solution here!

x = (-20:1:20);
y = x.^2 + 4;
figure; scatter(x,y)
% So, if one were to fit a line-of-best-fit to this, it'd probably look
% similar to plotting the following.
hold on; plot(x,y, '-g', 'LineWidth', 3)

% But, what if we didn't have the function used to generate the data beforehand? 
% How would we choose a "best" slope, or a "best" y-intercept?
% Since, in the previous scatter plot, we can see that the trend is linear 
% it makes sense to try a linear fit. This is done as follows:

yP = polyfit(x,y,2); % (x values, y values, polynomial order)

% Now type yP into the command line. Not quite m = 1 and b = 0, eh'? How
% does this look compared to the previous line?

hold on; plot(x,(x.^2).^yP(1) + x.*yP(2) + yP(3), '--r', 'LineWidth', 3);
legend('generated','y=x','linear fit')
