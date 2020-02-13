% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Pre-game tutorial of loading/filtering audio files.
%
% Authors: Chris Wiedeman, Jason T. Smith & Robert Culibrk (RPI)
% Spring 2020 - **THIS VERSION FOR RH USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% ** CLIP #1 **

% Load sound file #1 into OCTAVE
load 'noisyClip_#1'

% Play original audio (*BE CAREFUL WITH YOUR VOLUME!*)
Play_audio(signal,fs);

% Where does the noise seem to be?
% *hint* look at frequency plot

% fc = [freqLow freqHigh];
fc = [____ ____]; % Replace blanks with low and high frequency values!

% Filter signal using 'bandstop' option!
filteredSignal = do_filter(signal,fs,'bandstop', fc);
Play_audio(filteredSignal,fs);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% ** CLIP #2 **

% Load sound file #2 into OCTAVE
load 'noisyClip_#2'

% Play original audio (*BE CAREFUL WITH YOUR VOLUME!*)
Play_audio(signal,fs);

% How about now? Would the bandstop filter from last example work?
% Perhaps another filter would be more suitable...?
% *hint* FREQUENCY PLOT!!!

fc = ____; % Replace blank with frequency value!

% Filter signal using 'lowpass' option!
filteredSignal = do_filter(signal,fs,'_____', fc);
% Play your filtered audio to check!
Play_audio(filteredSignal,fs);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % **Add information about changing directories for clues here** % % %