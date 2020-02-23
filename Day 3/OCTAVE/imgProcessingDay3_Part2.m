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


%% Section #2: Automated edge detection
% It is also quite easy to, for many images, retrieve the edges very quickly. Here
% is an example with Jake.

% Load image
Jake = imread('misc\jakeDog.JPG');
% Use Canny edge detector on the third
jakeEdge = imManipulate(Jake, 'edge', 1);
figure;
subplot(1,2,1);
subimage(Jake);
title ("Jake Original RGB");
hold on;
subplot(1,2,2);
subimage(jakeEdge);
title ("Jake Edges B&W");


% The edges on Jake came out nicely, but what happens if there is some noise added
% first?
noisyJake = imnoise(Jake, "gaussian", 0, 0.02); % Add gaussian noise
figure; imshow(noisyJake);
title ("Jake w/ Gaussian Noise");

% Get edges of image with Gaussian noise.
noisyJakeEdge = imManipulate(noisyJake, '______', 1); % Edge detection
figure; imshow(noisyJakeEdge);
title ("Jake Edges w/ Noise");

% Eh... \(o.O)/

% % % % % 
% **Now, looks what happens when we use a denoising technique from earlier!
% Gaussian blur for denoise
smoothJake = imManipulate(noisyJake, '______', 1); % Gaussian denoise
figure; imagesc(smoothJake);

% Get edges of denoised image!
smoothEdgeJake = imManipulate(smoothJake, '______', 1); % Edge detection
figure; imshow(smoothEdgeJake);
title ("Jake's Edges after denoising*");

% % % % Side-by-side % % % % 
figure;
subplot(1,2,1);
subimage(jakeEdge);
title ("Jake Original Edges");
hold on;
subplot(1,2,2);
subimage(smoothEdgeJake);
title ("De-Noised Jake Edges");

% A little better, eh'? :P. 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% ** Rubix cube edge detection (???) ** (!! Show non-B&W example first !!)

% Load image
rubixCube = imread('misc/rubixCube.jpg');
figure; imshow(rubixCube);
title ("Rubix Cube");

% Now, make Gray-Scale and try again!
rubixCube = imManipulate(rubixCube, 'black & white', 1);
figure; imshow(rubixCube);
title ("Rubix Cube Black & White");

% Gaussian smooth B&W image
rubixCubeEdge = imManipulate(rubixCube,'_______',1);
% Now try edge detection!
rubixCubeEdge = imManipulate(rubixCubeEdge,'_______',1);
figure; imshow(rubixCubeEdge);
title ("Rubix Cube Edge Detect (B & W)");

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%
% EDGES ARE NOT THE ONLY THING THAT CAN BE DETECTED WITH EASE!
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %