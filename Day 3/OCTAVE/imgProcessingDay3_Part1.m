% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Image Processing Tutorial (Octave)
%
% Path to '.../imFunctions/' must be added [addpath('.../imFunctions/')]
%
% Authors: Jason T. Smith (RPI)
% Spring 2020 - **THIS VERSION FOR RH USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% % Load Octave's "image" package
pkg load image

%% Image De-Noising

% Gaussian Noise
brain = imread('misc\brain.jpeg');
gaussNoise = imnoise (brain, "gaussian", 0, 0.03); % Add gaussian noise
figure; imshow (gaussNoise);
title("Image with added Gaussian noise");
% Gaussian filter
gaussianFilter = imsmooth(gaussNoise, 'Gaussian', 1); % Gaussian noise filter
figure; imshow (gaussianFilter);
title("Image after Gaussian filter");

% Salt & Pepper noise
figure; imshow(brain);
title("Original brain image");
SaPNoise = imnoise (brain, "salt & pepper");
figure; imshow (SaPNoise);
title("Image with added Salt & Pepper noise");
gaussianFilter = imsmooth(SaPNoise, 'Gaussian', 1); % Gaussian filter
figure; imshow (gaussianFilter);
title("Image after Gaussian filter");
medFiltIm = medfilt2 (SaPNoise, [3 3]); % Median filter
figure; imshow (medFiltIm);
title("Image after Median filter");

% % % % Try larger median filters! % % % %

n = ___; % Replace blank with larger value (but not insane)
medFiltIm = medfilt2 (SaPNoise, [n n]); % Make filter large
figure, imshow (medFiltIm);
title("Image after Median filter");
figure, imshow (brain);
title("Original Image");


% % % % % % % DISCUSSION % % % % % % % %


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% It is common for colored images to be 'RGB', or, characterized by a mixture of
% RED, GREEN & BLUE in order to give off the various tones we see. This can easily
% be inverted just by inverting the color scheme to 'BGR' (upside-down) or any other
% order! Here is an example:

% Read in original image of Jake
Jake = imread('misc\jakeDog.JPG');
figure; imshow(Jake);
title("Normal Jake");

% Switch the first (R) and third (B) channels.
jakeBGR = imManipulate(Jake, 'switch', [ ___  ,  ___ ]); % Fill in the blanks
figure; imshow(jakeBGR);
title ("Jake Reversed (BGR)");

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% ** OPEN 'imageRepairRH.m' **
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
