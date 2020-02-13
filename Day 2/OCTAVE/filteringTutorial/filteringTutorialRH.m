% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Signal Processing Tutorial (Octave)
%
% Path to '.../audioFunctions/' must be added [addpath('.../audioFunctions/')]
%
% Authors: Jason T. Smith, Chris Wiedeman & Robert Culibrk (RPI)
% Spring 2020 - **THIS VERSION FOR RH USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Sampling

% % Load Octave's "statistics" & "signal" packages
pkg load statistics 
pkg load signal 


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% SAMPLING RATE ** Insert Rob's part **


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Noise Filtering - **ROLLING AVERAGE FILTER**

t = (0:.1:10); % 101 values between [0,10]
data = normrnd(10,.75,[size(t) 1]); % y-values w/ noise (centered around 10)

% Rolling average filter length = 5;
f = 1/___*ones(___,1); % Fill in blanks to set up filter with length 10
dataFiltered = filter(f,1,data); % Apply filter


% Plot overlay of rolling average filter (length = 5)
figure; plot(t(25:75), data(25:75));
hold on; plot(t(25:75), dataFiltered(25:75));
hold on; plot(t(25:75), ones(size(t(25:75))).*10, '--k', 'LineWidth', 2.5);
ylim([8 12]);
legend('Original','Smoothening = 10', 'Baseline');

%% % % % % % % Discussion #1: % % % % % % 
% - What happens to the noisy data when the length of the filter increases?
% - Do you think there is an upper limit to how long an average filter should be?
% If so, why?
% - Plot the data with a filter of length 20. Explain what you see in words.


%% Biosignal Filtering - **ROLLING AVERAGE FILTER**

load 'bioData'

f = 1/5*ones(5,1);
out1 = filter(f,1,val);
f = 1/10*ones(10,1);
out2 = filter(f,1,val);

figure; plot((25:1025), val(25:1025), 'LineWidth', 2.5);
hold on; plot((25:1025), out1(25:1025), '--', 'LineWidth', 2.5);
hold on; plot((25:1025), out2(25:1025), '-.', 'LineWidth', 2.5);
legend('Original','Filter (length = 5)', 'Filter (length = 10)');
xlim([25 1000])
ylabel('intensity')

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Filtering Signals Part #2: Waves

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 10;
freq2 = 5; % value lower than freq1
% Two sinusoids...
signal1 = sin(freq1*(2*pi)*t);
signal2 = sin(freq2*(2*pi)*t);
signalTotal = signal1 + signal2; % Sum of two waves!
figure; plot(t,signalTotal,'r','LineWidth', 1.5);
xlim([0 1])
legend('Combined Signal');

freq = fft(signalTotal); % Go from sinusoid to frequency!
n = length(freq);
f = linspace(0,fs-1/n,n);
figure()
plot(f(1:end/2+1),abs(freq(1:end/2+1)), 'k', 'LineWidth', 2.5)
axis([0 25]);
title('Frequency Domain of Audio');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');

%% % % % % % % DISCUSSION: % % % % % % 
% Why does frequency representation of signals matter for filtering?

%% HIGHPASS SIMPLE

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 3; % signal #1 frequency
freq2 = 10; % signal #2 frequency
signal1 = sin(freq1*(2*pi)*t);
signal2 = sin(freq2*(2*pi)*t);
signalTotal = signal1 + signal2; % Add both signals together

fc = ___; % filter cutoff point (fill this in to let only 'signal2' through!)
filtered_signal = do_filter(signalTotal, fs, '____', fc); % 'highpass' filter

% Plot total and filtered signals
figure; plot(t,signalTotal,'-k','LineWidth', 2.5);
hold on; plot(t,filtered_signal,'--r','LineWidth', 2);
xlim([0 1])
title('Highpass Filter Example');
xlabel('time (s)');
ylabel('Amplitude');
legend('Combined Signal','Filtered Signal');

%% BANDPASS (QUADRI-SIGNAL)

fs = 20000;
t = 0:1/fs:5-1/fs; % sampling

freq1 = 8;
freq2 = 10;
freq3 = 18;
freq4 = 25;
signal1 = sin(freq1*(2*pi)*t);
signal2 = sin(freq2*(2*pi)*t).*.25;
signal3 = sin(freq3*(2*pi)*t).*.5;
signal4 = sin(freq4*(2*pi)*t).*.5;
signalTotal = signal1 + signal2 + signal3 + signal4;

n = length(audio);
f = linspace(0,fs-1/n,n);

% fc = [freqL freqH];
fc = [ ____  ______ ]; % Replace blanks & isolate 'signal3'
filtered_signal = do_filter(signalTotal, fs, '_______', fc ); % 'bandpass' filter

figure; plot(t,signalTotal,'-k','LineWidth', 2.5);
hold on; plot(t,filtered_signal,'--r','LineWidth', 2);
xlim([0 1])
title('Bandpass Filter Example');
xlabel('time (s)');
ylabel('Amplitude');
legend('Combined Signal','Filtered Signal');

%% % % % % % % DISCUSSION: DIFFERENT TYPES OF FILTERS % % % % % % 


% Next: Sound waves

