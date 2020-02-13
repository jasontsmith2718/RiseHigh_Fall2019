% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Signal Processing Tutorial (Octave)
%
% Path to '.../audioFunctions/' must be added [addpath('.../audioFunctions/')]
%
% Authors: Jason T. Smith, Chris Wiedeman & Robert Culibrk (RPI)
% Spring 2020 - **THIS VERSION FOR EA USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Sampling

% % Load Octave's "statistics" & "signal" packages
pkg load statistics 
pkg load signal 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% SAMPLING RATE ** Insert Rob's part **


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Noise Filtering - **ROLLING AVERAGE FILTER**

t = (0:.1:10); % 101 values between [0,10]
data = normrnd(10,.75,[size(t) 1]); % y-values w/ noise (centered around 10)

% Rolling average with filter length = 5;
f = 1/5*ones(5,1);
dataFiltered = filter(f,1,data); % Apply filter with 'filter()' function

% Plot overlay of rolling average filter (length = 5)
figure; plot(t(25:75), data(25:75));
hold on; plot(t(25:75), dataFiltered(25:75));
hold on; plot(t(25:75), ones(size(t(25:75))).*10, '--k', 'LineWidth', 2.5);
ylim([8 12]);
legend('Original','Smoothening = 5', 'Baseline');

%% % % % % % % Problem #2: % % % % % % 
% - What happens to the noisy data when the length of the filter increases?
% - Do you think there is an upper limit to how long an average filter should be?
% If so, why?
% - Plot the data with a filter of length 20. Explain what you see in words.

%% Waveform Filtering - **ROLLING AVERAGE FILTER**

x1 = (0:.1:30); % 301 values between [0,10]
yN = normrnd(0,.25,[size(x1) 1]); % Random noise
freq = .75;
y1 = sin(x1.*freq); %
y1N = y1+yN;
figure; plot(x1(25:end-25),y1(25:end-25), '-k', 'LineWidth', 2.5);
hold on;
plot(x1(25:end-25),y1N(25:end-25), '--r', 'LineWidth', 1.5);
f = 1/5*ones(5,1);
out1 = filter(f,1,y1N);
hold on; plot(x1(25:end-25),out1(25:end-25), '-.b', 'LineWidth', 2.5);
legend('Original','Noisy Signal','Average-Filtered');
xlim([5 25]);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% Placeholder of sorts. This section is an example of using the above concept
% for biosignal data (NIH, open source). We should discuss how to bring biosignals
% into this in the most engaging way and when in the module it should be done.

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

##% Filtering a noisy sinusoid
##x1 = (0:.1:30); % 301 values between [0,10]
##yN = normrnd(0,.25,[size(x1) 1]); % Random noise
##freq = .75;
##y1 = sin(x1.*freq); %
##y1N = y1+yN;
##figure; plot(x1(25:end-25),y1(25:end-25), '-k', 'LineWidth', 2.5);
##hold on;
##plot(x1(25:end-25),y1N(25:end-25), '--r', 'LineWidth', 1.5);
##f = 1/5*ones(5,1);
##out1 = filter(f,1,y1N);
##hold on; plot(x1(25:end-25),out1(25:end-25), '-.b', 'LineWidth', 2.5);
##legend('Original','Noisy Signal','Average-Filtered');
##xlim([5 25]);


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Filtering Signals Part #2: Waves

% Example: Single sinusoid

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 10;
signal1 = sin(freq1*(2*pi)*t);
signalTotal = signal1;
figure; plot(t,signal1,'r','LineWidth', 1.5);
xlim([0 1])

freq = fft(signalTotal); % Go from sinusoid to frequency!
n = length(freq);
f = linspace(0,fs-1/n,n);
figure()
plot(f(1:end/2+1),abs(freq(1:end/2+1)), 'k', 'LineWidth', 2.5)
axis([0 25]);
title('Frequency Domain of Audio');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');

% % % % % % % % Contribution example % % % % % % % % %

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 10;
freq2 = 15; % value lower than freq1
% Two sinusoids...
signal1 = sin(freq1*(2*pi)*t);
signal2 = sin(freq2*(2*pi)*t).*0.25; % *MULTIPLY BY 1/4*
signalTotal = signal1 + signal2; % Sum of two waves!
figure; plot(t,signalTotal,'r','LineWidth', 1.5);
xlim([0 1])

freq = fft(signalTotal); % Go from sinusoid to frequency!
n = length(freq);
f = linspace(0,fs-1/n,n);
figure()
plot(f(1:end/2+1),abs(freq(1:end/2+1)), 'k', 'LineWidth', 2.5)
axis([0 25]);
title('Frequency Domain of Audio');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');

%% **Use ten-signal example here**

% % % % % % % DISCUSSION: % % % % % % % %
% Why does frequency representation of signals matter for filtering?


% % % % % % % FILTERING WITH FREQUENCY! % % % % % 
%% LOWPASS SIMPLE EXAMPLE

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 3; % signal #1 frequency
freq2 = 10; % signal #2 frequency
signal1 = sin(freq1*(2*pi)*t);
signal2 = sin(freq2*(2*pi)*t);
signalTotal = signal1 + signal2; % Add both signals together

fc = 5; % filter cutoff point
filtered_signal = do_filter(signalTotal, fs, 'lowpass', fc ); % 'lowpass' filter

% Plot total and filtered signals
figure; plot(t,signalTotal,'-k','LineWidth', 2.5);
hold on; plot(t,filtered_signal,'--r','LineWidth', 2);
xlim([0 1])
% hold on; plot(t,signal1,'-b','LineWidth', 1.5);


%% BANDPASS (TRI-SIGNAL)

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 2;
freq2 = 10;
freq3 = 25;
signal1 = sin(freq1*(2*pi)*t);
signal2 = sin(freq2*(2*pi)*t).*.75;
signal3 = sin(freq3*(2*pi)*t).*.5;
signalTotal = signal1 + signal2 + signal3;

n = length(audio);
f = linspace(0,fs-1/n,n);

fc = [8 12]; % Isolate 'signal2'
filtered_signal = do_filter(signalTotal, fs, 'bandpass', fc);
figure; plot(t,signalTotal,'-.m','LineWidth', 1.5);
hold on; plot(t,filtered_signal,'--b','LineWidth', 1.5);
##hold on; plot(t,signal2,'-g','LineWidth', 3.5); % Uncomment and plot to compare
xlim([0 1]);


%% BANDSTOP (TRI-SIGNAL)

fs = 20000;
t = 0:1/fs:5-1/fs;

freq1 = 1;
freq2 = 3;
freq3 = 5;
signal1 = sin(freq1*(2*pi)*t).*.25;
signal2 = sin(freq2*(2*pi)*t);
signal3 = sin(freq3*(2*pi)*t).*.25;
signalTotal = signal1 + signal2 + signal3;

n = length(signalTotal);
f = linspace(0,fs-1/n,n);

fc = [2 4];
filtered_signal = do_filter(signalTotal, fs, 'bandstop', fc);
figure; plot(t,signalTotal,'-.m','LineWidth', 1.5);
hold on; plot(t,filtered_signal,'--b','LineWidth', 1.5);
##hold on; plot(t,signal1 + signal3,'-g','LineWidth', 3.5); % Uncomment and plot to compare
xlim([0 1]);


%% % % % % % % DISCUSSION: DIFFERENT TYPES OF FILTERS % % % % % % 


% Next: Sound waves






