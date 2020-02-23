% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Rise High Data Science - Blood vessel segmentation using retinal images.
%
% Author: Jason Smith, RPI, 2020
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function eyeImBotH = vesselSegment (eyeIm, channel)

eyeIm = imsmooth(eyeIm(:,:,channel), 'Gaussian', .75, 10);
se = strel('disk',8,0);
eyeImBotH = imbothat(eyeIm,se);
eyeImBotH(eyeImBotH<10) = 0;

endfunction
