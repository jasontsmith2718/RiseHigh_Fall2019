Jake = imread('marioLuigi.png');
##noisyJake1 = imnoise(Jake(:,:,1), "speckle",.05);
noisyJake1 = Jake(:,:,1);
noisyJake2 = imnoise(Jake(:,:,2), "gaussian",0,.025);
noisyJake3 = imnoise(Jake(:,:,3), "salt & pepper",.1);
nJake = cat(3,noisyJake2,noisyJake1,noisyJake3);
figure; imshow(nJake);

##smoothJake1 = imsmooth(noisyJake1, 'Gaussian', .05);
smoothJake1 = noisyJake1;
smoothJake2 = imsmooth(noisyJake2, 'Gaussian',3);
smoothJake3 = medfilt2(noisyJake3, [3 3]);
sJake = cat(3,smoothJake1,smoothJake2,smoothJake3);
figure; imshow(sJake)

nJake = imread('noisyIm#1.tif');
figure; imagesc(nJake)
m1 = imManipulate(nJake, 'switch', [1 2]);
##m1 = imManipulate(nJake, 'median', 3, 3);
figure; imagesc(m1);
m2 = imManipulate(m1, 'median', 3);
figure; imagesc(m2);
m3 = imManipulate(m2, 'gaussian', 2, 3);
figure; imagesc(m3);

##imwrite(nJake, 'noisyIm#4.tif')