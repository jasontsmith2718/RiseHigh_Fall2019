% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% Generating noisy data for a linear trend & perform a model-based fit.
% Generate points for y = x, while adding some normally distributed noise
pkg load statistics

x = (1:3:60);
y = x + normrnd(.5,3,[size(x)]); % look up normrnd() function for details
figure; scatter(x,y);

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
legend('generated','y=x','linear fit');

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