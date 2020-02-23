% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Rise High Data Science - Blood vessel segmentation using retinal images.
%
% Author: Jason Smith, RPI, 2020
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function eyeImBotH = vesselSeg (eyeIm, channel, sigma, vH)

eyeIm = imsmooth(eyeIm(:,:,channel), 'Gaussian', sigma, vH);
se = strel('disk',8,0);
eyeImBotH = imbothat(eyeIm,se);
eyeImBotH(eyeImBotH<vH) = 0;

endfunction
