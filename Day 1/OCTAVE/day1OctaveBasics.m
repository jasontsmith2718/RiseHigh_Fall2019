% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% The first tutorial will focus on:
% 1) Basic OCTAVE syntax for data visualization and manipulation.
% 2) Techniques for fitting simple data relationships using OCTAVE's built in 
% tools.

% **IMPORTANT**: Copy and paste certain sections into the terminal instead 
% of running all at once.

% Jason T. Smith, RPI - September 29, 2018.
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%% General OCTAVE
% There are many different ways to generate an array of numbers. For
% example:

nums = (0:1:10); % 0-10 in increments of one
display(nums);
nums = (0:.5:10); % 0-10 in increments of 0.5
display(nums);

% The function "linspace()" also does this.

nums = linspace(0,10,11); % 0-10 in increments of one
display(nums);
nums = linspace(0,10,21); % 0-10 in increments of 0.5
display(nums);

%% % % % % % % Problem #A: % % % % % % 
% - What is the difference between creating numerical arrays using the first
% approach versus using the second technique (using "linspace()")?


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% Plotting
% To plot a line, one can use the function "plot(x,y)" with the number of
% elements in "x" being equal to that of "y". For example:

m = 2; % Slope
b = -3; % y-intercept
x = (0:1:10); % x-values

y = m.*x + b; % y = mx + b (straight line)

figure; plot(x,y); 
xlabel('x-axis');
ylabel('y-axis');

% For a scatter plot, one can use "scatter(x,y)" in the same way as we used
% "plot()" before! For example:

hold on; % "hold on;" allows you to plot onto existing plot windows.
scatter(x,y); 

% You should see red circles overlaid onto the previous blue line!

%% % % % % % % Problem #B: % % % % % % 
% - Plot a red line with slope of -3 and y-intercept of 2 along with a blue
% scatter plot with the same values.
x = (0:.1:10);
figure; plot(x,sin(x.*3) + sin(x.*5).*.5, '-m','LineWidth', 3);
hold on; plot(x,sin(x.*3), '-.b','LineWidth', 2.5);
##hold on; plot(x,sin(x.*8).*.5, '--r','LineWidth', 2.5);
hold on; plot(x, zeros([length(x), 1])', '--k', 'LineWidth', 3);
legend('sin(x)_1 + sin(x)_2','sin(x)_1','sin(x)_2','Baseline');


x = (0:.05:10);
##figure; plot(x,sin(x.*3) + sin(x.*5).*.5, '-m','LineWidth', 3);
figure;; plot(x,sin(x.*3), '-.b','LineWidth', 2.5);
hold on; plot(x,sin(x.*3 + pi), '--r','LineWidth', 2.5);
hold on; plot(x,sin(x.*3 + pi) + sin(x.*3), '-m','LineWidth', 3);
hold on; plot(x, zeros([length(x), 1])', '--k', 'LineWidth', 3);
legend('sin(x)_1 + sin(x)_2','sin(x)_1','sin(x)_2','Baseline')
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% Generating noisy data for a linear trend & perform a model-based fit.
% Generate points for y = x, while adding some normally distributed noise
pkg load statistics

x = (1:3:60);
y = x + normrnd(.5,3,[size(x)]); % look up normrnd() function for details
figure; scatter(x,y)

% So, if one were to fit a line-of-best-fit to this, it'd probably look
% similar to plotting the following.
hold on; plot(x,x, '-m', 'LineWidth', 3);

% But, what if we didn't have the function used to generate the data beforehand? 
% How would we choose a "best" slope, or a "best" y-intercept?
% Since, in the previous scatter plot, we can see that the trend is linear 
% it makes sense to try a linear fit. This is done as follows:

yP = polyfit(x,y,1); % (x values, y values, polynomial order)

% Now type yP into the command line. Not quite m = 1 and b = 0, eh'? How
% does this look compared to the previous line?

hold on; plot(x,x.*yP(1) + yP(2), '--r', 'LineWidth', 3);
legend('generated','y=x','linear fit')

% This displays the values for comparison.
disp(['Ground Truth: [1 0]'])
disp(['Predicted: [' num2str(yP) ']'])

% Quite close. As the name suggest, polyfit can be used to fit other
% larger order polynomials as well. Therefore...

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

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %