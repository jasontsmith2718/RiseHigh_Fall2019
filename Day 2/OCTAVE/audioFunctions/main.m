
dM = 'C:\Users\jason\Desktop\RISE-HIGH\day2\mainDir4Game\mainDirectory';
cd [dM clue];

load('audio_sample.mat');
audio = signal;
Play_audio(audio,fs)

%%Filtering Functions
fc = [7000, 8000];
new = do_filter(audio, fs, 'bandstop', fc);
Play_audio(new,fs)

