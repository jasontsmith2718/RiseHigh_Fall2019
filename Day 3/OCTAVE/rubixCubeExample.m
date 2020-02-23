% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Image Processing Tutorial (Octave)
%
% Path to '.../imFunctions/' must be added [addpath('.../imFunctions/')]
%
% Authors: Jason T. Smith (RPI)
% Spring 2020 - **THIS VERSION FOR RH USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% Rubix cube with a red and green side...

rubixCube = imread('misc/rubixCube.jpg');
figure; imshow(rubixCube);
title ("Rubix Cube");

% Gaussian smooth
rubixCubeEdge = imManipulate(rubixCube,'gaussian',1);
% Edge detect
rubixCubeEdge = imManipulate(uint8(rubixCubeEdge),'edge',1);
figure; imshow(rubixCubeEdge);
title ("Rubix Cube Edge Detect");