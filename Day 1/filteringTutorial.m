% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Signal Processing Tutorial (Octave)
% 
% Authors: 
% Fall 2019
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Sampling

% Two sine waves 'y = sin(kx + theta)' overlapping

% First, copy and paste lines (#1-#2) into the terminal to plot two sine
% waves
x1 = (0:.1:10); % 101 values between [0,10]
y1 = sin(x1.*3+1/2);
x2 = (0:.5:10); % 20 values between [0,10]
y2 = sin(x2.*3+1/2);
x3 = (0:.75:10); % 15 values between [0,10]
y3 = sin(x3.*3+1/2);
figure; plot(x1,y1, '-b', 'LineWidth', 2); 
hold on; plot(x2,y2, '-.r', 'LineWidth', 2);
hold on; plot(x3,y3, '--k', 'LineWidth', 2);
legend('100-sampled','20-sampled','15-sampled');
% 1) What is the difference between the two plotted sine waves?

%% Filtering

x1 = (0:.1:10); % 101 values between [0,10]
y1 = normrnd(10,.75,[size(x1) 1]); % Random values obtained at 10 +/- some number (normal distribution).

% Plot original values overlaid with the "baseline" y = 10;
figure; plot(x1(25:75),y1(25:75));
hold on; plot(x1(25:75),ones(size(x1(25:75))).*10, '--k', 'LineWidth', 2.5);
ylim([0 15]);

% Rolling average filter length = 5;
f = 1/5*ones(5,1);
out1 = filter(f,1,y1);

% Rolling average filter length = 10;
f2 = 1/10*ones(10,1);
out2 = filter(f2,1,y1);

% Plot overlay of rolling average filter (length = 5)
figure; plot(x1(25:75), y1(25:75));
hold on; plot(x1(25:75), out1(25:75));
hold on; plot(x1(25:75), ones(size(x1(25:75))).*10, '--k', 'LineWidth', 2.5);
ylim([8 12]);
legend('Original','Smoothening = 5', 'Baseline');

% Plot overlay of rolling average filter (length = 10)
figure; plot(x1(25:75), y1(25:75));
hold on; plot(x1(25:75), out2(25:75));
hold on; plot(x1(25:75), ones(size(x1(25:75))).*10, '--k', 'LineWidth', 2.5);
ylim([8 12]);
legend('Original','Smoothening = 10', 'Baseline');

%% Band-pass filtering explained

% Band-pass
% Rolling average

x = (0:.1:4*pi);
y1 = sin(3.*x + 1);
figure; plot(x,y1);
y2 = sin(10.*x + 2);
figure; plot(x,y2);
figure; plot(x,(y1+y2)./2);
y = bandpass(x,[0 5], k);

%% Bandpass with well-known song example

fs = 2e3;
t = 0:1/fs:0.3-1/fs;

l = [0 130.81 146.83 164.81 174.61 196.00 220 246.94];
m = [0 261.63 293.66 329.63 349.23 392.00 440 493.88];
h = [0 523.25 587.33 659.25 698.46 783.99 880 987.77];
note = @(f,g) [1 1 1]*sin(2*pi*[l(g) m(g) h(f)]'.*t);

mel = [3 2 1 2 3 3 3 0 2 2 2 0 3 5 5 0 3 2 1 2 3 3 3 3 2 2 3 2 1]+1;
acc = [3 0 5 0 3 0 3 3 2 0 2 2 3 0 5 5 3 0 5 0 3 3 3 0 2 2 3 0 1]+1;

song = [];
for kj = 1:length(mel)
    song = [song note(mel(kj),acc(kj)) zeros(1,0.01*fs)];
end
song = song/(max(abs(song))+0.1);

% To hear, type sound(song,fs)

pspectrum(song,fs,'spectrogram','TimeResolution',0.31, ...
    'OverlapPercent',0,'MinThreshold',-60);

%%%%%%%%%%%%%%%%

pong = bandpass(song,[230 450],fs);

% To hear, type sound(pong,fs)

bandpass(song,[230 450],fs);



%% Sound decoder game



