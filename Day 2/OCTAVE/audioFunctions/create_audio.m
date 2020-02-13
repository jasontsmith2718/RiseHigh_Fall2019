%Record Audio and Store
fs = 20000; %Hz
duration = 10; %seconds
recObj = audiorecorder(fs, 8, 1);
disp('Start speaking.');
recordblocking(recObj, duration);
disp('End of Recording.');
play(recObj);

signal = getaudiodata(recObj);
signal = signal';
duration = 10;
t = linspace(0,duration-1/fs,length(signal));



%% save
save('clue.mat', 't', 'signal', 'fs');

%% upload .MP3 files for save in correct OCTAVE/MATLAB format

% fN = '.mp3';
% [y,Fs] = audioread(fN);
% 
% signal = y(:,1)';
% fs = Fs;
% t = linspace(0,duration-1/fs,length(signal));
% save([fN(1:end-4) .mat], 't', 'signal', 'fs'); 
