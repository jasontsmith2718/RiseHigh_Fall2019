% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Image Processing Tutorial (Octave)
% 
% Authors: Jason T. Smith
% Spring 2020
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

pkg load image

%% Image De-Noising

I = imread('brain-mri-images-for-brain-tumor-detection/ex/1 no.jpeg');
gaussNoise = imnoise (I, "gaussian", 0, 0.02); % Add gaussian noise
figure, imshow (gaussNoise);
title("Image with added Gaussian noise");
medFilt3 = medfilt2 (gaussNoise, [3 3]);
figure, imshow (medFilt3);
title("Image with noise reduced by median filtering [3 3]");
medFilt7 = medfilt2 (gaussNoise, [7 7]);
figure, imshow (medFilt7);
title("Image with noise reduced by median filtering [7 7]");

% View all in one subplot by highlighting and de-commenting (Ctrl+Shift+R)
figure;
subplot(2,2,1);
subimage(I);
title ("Regular MRI Image");
hold on;
subplot(2,2,2);
subimage(gaussNoise);
title ("Image with added Gaussian noise");
hold on;
subplot(2,2,3);
subimage(medFilt3);
title ("Image with noise reduced by median filtering [3 3]");
hold on;
subplot(2,2,4);
subimage(medFilt7);
title ("Image with noise reduced by median filtering [7 7]");

%% % % % % % % Problem #1: % % % % % % 
% - What differences can you see between the "raw" (noisy) image and the two attempts
% at denoising? Which image is the best? Try a few more filters to see if you can denoise
% this next image.

Jake = imread('jakeDog.JPG');
noisyJake = imnoise(Jake(:,:,1), "gaussian", 0, 0.05);
figure; imshow(Jake(:,:,1));
title ("Normal Gray-Scale");

figure; imshow(noisyJake);
title ("Noisy Gray-Scale");

medianFilter = medfilt2(noisyJake, [7 7]);
figure; imshow(medianFilter);
title ("Median Filter");

averageFilter = imsmooth(noisyJake, 'Average', [7 7]);
figure; imshow(averageFilter);
title ("Average Filter");

gaussianFilter = imsmooth(noisyJake, 'Gaussian', 3);
figure; imshow(gaussianFilter);
title ("Gaussian Filter");

figure;
subplot(2,2,1);
subimage(noisyJake);
title ("Noisy Gray-Scale");
hold on;
subplot(2,2,2);
subimage(medianFilter);
title ("Median Filter");
subplot(2,2,3);
subimage(averageFilter);
title ("Average Filter");
subplot(2,2,4);
subimage(gaussianFilter);
title ("Gaussian Filter");

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% It is common for colored images to be 'RGB', or, characterized by a mixture of
% RED, GREEN & BLUE in order to give off the various tones we see. This can easily
% be inverted just by inverting the color scheme to 'BGR' (upside-down) or any other
% order! Here is an example:

figure; imshow(Jake);
title("Normal Jake");
figure; imshow(cat(3,Jake(:,:,3),Jake(:,:,2),Jake(:,:,1)));
title ("Jake Reversed (BGR)");

% It is also quite easy to, for many images, retrieve the edges very quickly. Here
% is an example with Jake.

[bw, ~] = edge(Jake(:,:,1), "Canny");
subplot(1,2,1);
subimage(Jake);
title ("Jake Original RGB");
hold on;
subplot(1,2,2);
subimage(bw);
title ("Jake Edges B&W");


% The edges on Jake came out nicely, but what happens if there is some noise added
% first?

[bw, ~] = edge(noisyJake, "Canny");
figure; imshow(bw);
title ("Jake Edges w/ Noise");

% Now, looks what happens when we use a denoising technique from earlier!
smoothJake = imsmooth(noisyJake, 'Gaussian', 3);
bwDeNoise = edge(smoothJake, "Canny");
figure; imshow(bwDeNoise);
title ("Jake's Edges after denoising*");

% A little better, eh'? :P. 

%% % % % % % % Problem #2: % % % % % % 
%Copy the lines below to load a chessboard picture into OCTAVE
% and apply some noise. Use whatever filtering technique you think is best to retrieve
% the lines & edges of the checkerboard.

chessBoard = imread('chessBoard.JPG');
chessBoardNoisy = imnoise(chessBoard(:,:,1), "gaussian", 0, 0.02);
figure; imshow(chessBoardNoisy);

%% % % % % % % Problem #3: % % % % % % 
% - Load the image 'eye.JPG' and show it in OCTAVE.
% - Use any technique you can think of to make the picture as unique as you can.
% After you're satisfied, call a teaching assistant over to check out what you've
% come up with***

% Have user select different images!
[fname, fpath, fltidx] = uigetfile ();
imC = imread([fpath fname]);
figure; imshow(imC);


%% Waldo Normalized Cross-Correlation

% % % % % % Waldo Image # 1 % % % % % %
% Load RGB images
waldoImg = imread('waldoImagesForFinding/waldoImgEasy.jpg');
waldo = imread('waldoImagesForFinding/useThisWaldoImgEasy.jpg');

% normalized cross correlation
cc = normxcorr2 (waldo(:,:,1), waldoImg(:,:,1));

figure; imshow(cc); % Waldo's position is at the maximum!
figure; imshow(waldoImg);

% retrieve (x, y) position of maximum!
[r, c] = find (cc == max (cc(:)));

% Show Waldo was found on the RGB
figure; imshow(waldoImg(r-75:r,c-75:c,:));

% % % % % % Waldo Image # 2 % % % % % %
% Load RGB images
waldoImg = imread('waldoImagesForFinding/useThis.jpeg');
waldo= imread('waldoImagesForFinding/waldoUseThis2.jpeg');



% normalized cross correlation
cc = normxcorr2 (waldo(:,:,1), waldoImg(:,:,1));

figure; imshow(cc); % Waldo's position is at the maximum!

% display (x, y) of maximum
[r, c] = find (cc == max (cc(:)));

figure; imshow(cc); % Waldo's position is at the maximum!
figure; imshow(waldoImg);

% Show Waldo was found on the RGB
figure; imshow(waldoImg(r-100:r+50,c-100:c+50,:));

%% **Video** 'waldoAutomated.mp4'

%% Computers are fast at finding Waldo... So what? (Biomedical relevance)

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Retinal blood vessel segmentation?

% Read in RGB retinal image.
eye = imread('retinopathy.TIF');
figure; imshow(eye);
title ("Retinopathy Image");
edges = edge(eye(:,:,1), "Canny");
figure; imshow(edges)
title('Not very good blood vessels');

edges = edge(imsmooth(eye(:,:,2),'Gaussian',3), "Canny");
figure; imshow(edges)
title('Much better!');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Continued...

