% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Image Processing Tutorial (Octave)
%
% Path to '.../imFunctions/' must be added [addpath('.../imFunctions/')]
%
% Authors: Jason T. Smith (RPI)
% Spring 2020 - **THIS VERSION FOR RH USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% % % % OBJECTIVE: % % % %
% Repair the image assigned to your group using imManipulate().
% imManipulate(image, action, channel)

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % **HOW TO USE** % % %
% 'switch': Switches two channels (example: [1 3] switches R and B channels)
% ** EXAMPLE:
% im = imManipulate(im, 'switch', [1 3]);

% 'median': Uses median filter on specific channel of image
% ** EXAMPLE:
% im = imManipulate(im, 'median', 2);

% 'gaussian: Uses gaussian filter on specific channel of image
% ** EXAMPLE:
% im = imManipulate(im, 'gaussian', 1);

% % % % % % % %
% For both 'gaussian' and 'median', the 'amount' can be changed.
% ** EXAMPLE: Median filter on 'R' channel with size [2 2]
% im = imManipulate(im, 'median', 1, 2);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% Load original noisy image and check it out!
imNoisy = imread('noisyIm#1.tif');
figure; imagesc(imNoisy)
title ("Original Image");

% % % % Figure out the processing steps needed to repair the image! % % % %
% First action
step1 = imManipulate(imNoisy, '____', ____ ); % Fill in 'action' and channel(s)
figure; imagesc(step1);
title ("Image Repair: Step #1");
% Second action
step2 = imManipulate(step1, '____', ____ ); % Fill in 'action' and channel(s)
figure; imagesc(step2);
title ("Image Repair: Step #2");
% Third action
step3 = imManipulate(step2, '____', ____ ); % Fill in 'action' and channel(s)
figure; imagesc(step3);
title ("Image Repair: Step #3");
% Fourth action
step4 = imManipulate(step3, '____', ____ ); % Fill in 'action' and channel(s)
figure; imagesc(step4);
title ("Image Repair: Step #4");

% % % % 
% Once your group thinks the image is repaired, call an EA over to check!
% % % %

