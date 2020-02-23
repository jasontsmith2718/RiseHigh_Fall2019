% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Rise High Data Science - DESCRIPTION HERE
%
% Author: Jason Smith, RPI, 2020
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


function imM = imManipulate (im, action, channel, amount)

val = nargin;

switch(val)
  case 3
    if(isequal(action,'switch')==1)
      imR = im(:,:,1);
      imG = im(:,:,2);
      imB = im(:,:,3);
      if(channel == [1 2])
        im = cat(3,imG,imR,imB);
      elseif(channel == [1 3])
        im = cat(3,imB,imG,imR);
      elseif(channel == [2 3])
        im = cat(3,imR,imB,imG);
      endif
    endif

    if(isequal(action,'gaussian')==1)
      imG = im(:,:,channel);
      imG = imsmooth(imG, 'Gaussian', 2);
      im(:,:,channel) = imG;
    endif

    if(isequal(action,'median')==1)
      imSaP = im(:,:,channel);
      imSaP = medfilt2(imSaP,[3 3]);
      im(:,:,channel) = imSaP;
    endif
    
    if(isequal(action,'edge')==1)
      imE = im(:,:,channel);
      [imE, ~] = edge(imE, "Canny");
      im = imE;
    endif    
    
    if(isequal(action,'black & white')==1)
      imBW = uint8(mean(im,3));
      im = imBW;
    endif    

    imM = im;
  case 4
    if(isequal(action,'switch')==1)
      imR = im(:,:,1);
      imG = im(:,:,2);
      imB = im(:,:,3);
      if(channel == [1 2])
        im = cat(3,imG,imR,imB);
      elseif(channel == [1 3])
        im = cat(3,imB,imG,imR);
      elseif(channel == [2 3])
        im = cat(3,imR,imB,imG);
      endif
    endif

    if(isequal(action,'gaussian')==1)
      imG = im(:,:,channel);
      imG = imsmooth(imG, 'Gaussian', amount);
      im(:,:,channel) = imG;
    endif

    if(isequal(action,'median')==1)
      imSaP = im(:,:,channel);
      imSaP = medfilt2(imSaP,[amount amount]);
      im(:,:,channel) = imSaP;
    endif
    
    if(isequal(action,'edge')==1)
      imE = im(:,:,channel);
      [imE, ~] = edge(imE, "Canny", amount);
      im = imE;
    endif
    
    if(isequal(action,'black & white')==1)
      imBW = uint8(mean(im,3));
      im = imBW;
    endif   

    imM = im;
endswitch

endfunction
