% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% The first tutorial will focus on:
% 1) Basic OCTAVE syntax for data visualization and manipulation.
% 2) Techniques for fitting simple data relationships using OCTAVE's built in 
% tools.

% **IMPORTANT**: Copy and paste certain sections into the terminal instead 
% of running all at once.

% Jason T. Smith, RPI - September 29, 2018.
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
shift = pi;
%% General OCTAVE
% There are many different ways to generate an array of numbers. For
% example:

numbers = []; % 0-10 in increments of one
display(numbers);
numbers = []; % 0-10 in increments of 0.5
display(numbers);

% You can create arrays like this! (Easier way)
numbers = [] ; % 0-10 in increments of one
display(numbers);
numbers = []; % 0-10 in increments of 0.5
display(numbers);


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Plotting
% To plot a line, one can use the function "plot(x,y)" with the number of
% elements in "x" being equal to that of "y". For example:


%% % % % % % % Problem #A: % % % % % % 
% Plot y = 2x + 3 from zero to ten!

m = ___ ; % Slope
b = ___ ; % y-intercept
x = ___ ; % x-values (from 0-10 in increments of one)

y = m.*x + b; % y = mx + b (straight line)

figure; plot(x,y); 
xlabel('x-axis');
ylabel('y-axis');


%% % % % % % % Problem #B: % % % % % % 
% - Plot a line with slope of 3 and y-intercept of 1
% with the same values. Use x-values between -10 to 10.



% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% The sinusoid function in OCTAVE is called as follows: 
% y(x) = sin(frequency*x + phase)

x = (0:.05:10);
freq =  ___ ;
figure; plot(x,sin(x.*freq), '-.b','LineWidth', 2.5); % phase = 0

% Now plot a sine wave out of phase with the first.
hold on; plot(x,sin(x.*freq + ____), '--r','LineWidth', 2.5); % Frequency = 3, phase = pi
% If you sum the above two sine waves, they should cancel out completely. This is
% referred to as the waves being completely "out of phase".
hold on; plot(x,sin(x.*freq + ____) + sin(x.*freq), '-m','LineWidth', 3);
legend('sin(x)_1','sin(x)_2', 'sin(x)_1 + sin(x)_2');

