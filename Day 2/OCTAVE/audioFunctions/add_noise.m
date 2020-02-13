%%******* Load file
##load('audio_sample.mat');

%% Add noise
% fc = [7000, 8000]; %Select frequency cutoffs for bandlimited gaussian noise
##fc = [5000, 6000];
##fc = [7500, 8000];

fc = [100, 300];
% fc = [5500, 6500];
##fc = [9000, 9050];
##fc = 7000;

p = 7.5; %This scales the power spectral density of the noise
noise = sqrt(p)*do_filter(randn(size(t)), fs, 'bandpass', fc);
signal = signal + noise;

Play_audio(signal,fs);

fS = do_filter(signal,fs,'bandpass', [300 5000]);
Play_audio(fS,fs);



%%Save new file
save('clueF_noisy.mat', 't', 'signal', 'fs');