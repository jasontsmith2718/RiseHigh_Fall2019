% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Image Processing Tutorial (Octave)
%
% Path to '.../imFunctions/' must be added [addpath('.../imFunctions/')]
% 
% % Load Octave's "image" package
% pkg load image
%
% Authors: Jason T. Smith (RPI)
% Spring 2020 - **THIS VERSION FOR RH USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% Section #3: Object detection

% **Take some time and find Waldo on the printout #1**

%% Automated Waldo Detection

% % % % % % Waldo Image # 1 % % % % % %
% Load RGB images
waldoImg = imread('waldoImagesForFinding/waldoImgEasy.jpg');
waldo = imread('waldoImagesForFinding/useThisWaldoImgEasy.jpg');

% Find Waldo!
waldoPosition = normxcorr2(waldo(:,:,1), waldoImg(:,:,1));

figure; imagesc(waldoImg);
title ("Original Waldo Image");
figure; imagesc(waldoPosition); % Waldo's position is at the maximum!
colormap(jet); caxis([.3 1]);
title ("Waldo Position (at Maximum Intensity)");


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% **Take some time and find Waldo on the printout #2**

% % % % % % Waldo Image # 2 % % % % % %
% Load RGB images
waldoImg = imread('waldoImagesForFinding/useThis.jpeg');
waldo= imread('waldoImagesForFinding/waldoUseThis2.jpeg');

% Find Waldo!
waldoPosition = normxcorr2(waldo(:,:,1), waldoImg(:,:,1));

figure; imagesc(waldoImg);
title ("Original Waldo Image");
figure; imagesc(waldoPosition); % Waldo's position is at the maximum!
colormap(jet); caxis([.3 1]);
title ("Waldo Position (at Maximum Intensity)");

%% **Video** 'waldoAutomated.mp4'

%% Computers are fast at finding Waldo... So what? (Biomedical relevance)

% % % % % % % % ** Video ** % % % % % % % %
% **Video**: 'countingPassesVideo.mp4'
% 'https://www.npr.org/sections/health-shots/2013/02/11/171409656/why-even-radiologists-can-miss-a-gorilla-hiding-in-plain-sight'


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Automated brain tumor segmentation

brainIm = imread('brain-mri-images-for-brain-tumor-detection/ex/Y107.jpg');
% 'imadjust()' increase image contrast
adjBrainIm = imadjust(brainIm, [.2, .8], [0 1]);
% Gaussian smooth to get rid of edge noise
adjBrainIm = imManipulate(adjBrainIm, 'gaussian', 1, 3);
% Get edges of new image!
edgeBrainIm = imManipulate(adjBrainIm, 'edge', 1, .3);
% Function for drawing tumor edges. plotObjects( edges, original image )
plotObjects(edgeBrainIm, brainIm); % Different colors do not mean anything!


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Retinopathy: blood vessel segmentation

% %
% Read in RGB retinal image.
n = ___; % Replace with value between 1 and 20 (only 20 images)
n = 1;
n = nStr(n);

eye = imread(['retinal-images/' n '_test.TIF']);
% Segment blood vessels. Figure out which channel is best!
eyeVessels = vesselSegment(eye, ____); % Replace channel number!
figure; imshow(eye);
title('Original Retinopathy Image');
figure; imshow(eyeVessels.*(255/max(eyeVessels(:))));
title('Automated Vessel Segmentation');


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% Show videos about AI doing these things awesomely. Explain "deep learning" and 
% AI, along with the basic concepts behind how they are able to leverage training towards
% ground-truth to obtain their infamous performance.
