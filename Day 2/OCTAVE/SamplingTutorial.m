% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% The second OCTAVE tutorial will focus on:
% OCTAVE syntax for basic one-dimensional signal processing, including:
% 1) Overview of sampling frequency
% 2) Basic moving average filter for smoothing datasets
% 3) Lowpass filters
% 4) Highpass filters
% 5) Bandpass filters
% 6) Notch filters

% IMPORTANT: Copy and paste certain sections into terminal instead of
% running all at once.

% Robert A. Culibrk, RPI - February 10, 2020.
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% In ANALOG technology, a wave is recorded in its original form. Heard of
% casette tapes? Vinyl? In both cases, sound waves are taken straight from a
% mic and physically laid into the tape/vinyl. The sound wave from the mic
% is an analog wave, and therefore the wave on the tape is analog as well.

% But what if you want to store that sound on a computer? In DIGITAL
% technology, the analog wave is "sampled" at some interval, and then turned
% into numbers that can be stored on a digital device.

% On most MP3 players - and music apps like "Spotify" - the sampling rate is
% 44 kilohertz (kHz), or 44,000 samples per second. So on Spotify, there are
% 44,000 arrays of numbers stored per second of music! Lots of data, yeah?

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


% % % PROBLEM 1A % % %
% Generate an array with x values from 0 to 2. Start with 100 samples.
begin_num = 0;   % Define your starting number
end_num = 2;   % Define your ending number
samples = 100;   % Define the number of samples
increment = abs(begin_num - end_num)/samples;
array1 = (begin_num:increment:end_num);   % Define the array

cntl_array = (begin_num:increment/10^2.:end_num);
disp(array1);
disp("The size of the increment is:"); disp(increment);   % Read out increment

% Now let's make a wave! Some important things to define first...
freq = 2;   % Frequency - How many complete waves in 1 second (Hz)
amp = 5;   % Amplitude - The max "reach" of the wave
hz = 2*pi.*freq;
x1 = array1; x_cntl = cntl_array;
y1 = amp*cos(x1.*hz); y_cntl = amp*cos(x_cntl.*hz);

% Plotting your signal
figure(1); plot(x1,y1);
xlim([begin_num end_num]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on; title('Your signal');

% Plotting the original signal
figure(2); plot(x_cntl, y_cntl);
xlim([begin_num end_num]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on; title('Original signal');



% % % PROBLEM 1B % % %
% Now try and plot the same wave with fewer samples (start with 30). What do
% you notice? Experiment with other sample numbers. 10? 5?
begin_num = ___;   % Define your starting number
end_num = ___;   % Define your ending number
samples = ___;   % Define the number of samples
increment = abs(begin_num - end_num)/samples;
array1 = (begin_num:increment:end_num);   % Define the array

cntl_array = (begin_num:increment/10^2.:end_num);
disp(array1);
disp("The size of the increment is:"); disp(increment);   % Read out increment

freq = ___;   % Frequency - How many complete waves in 1 second (Hz)
amp = ___;   % Amplitude - The max "reach" of the wave
hz = 2*pi.*freq;
x1 = array1; x_cntl = cntl_array;
y1 = amp*cos(x1.*hz); y_cntl = amp*cos(x_cntl.*hz);


figure(3); plot(x1,y1,'-b','Linewidth',2);
hold on; plot(x_cntl,y_cntl,'-.r','Linewidth',2);
xlim([begin_num end_num]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on; legend('Your signal','Original signal');



% % % Problem 2 % % %
% % % % % % % % % % % % % % % % Smoothing Filtering % % % % % % % % % % % % %
% "Smoothing" filters, like moving average filters and the Savitsky-Golay
% filters, are great for removing high-frequency "jaggies" from signals.

% Generate a wave that oscillates from -3 to 3, and goes through 2 complete
% cycles per second.

% Let's start by defining our x-values. If we want to see a 5-second window of
% this wave, what numbers should go here? Do 1000 samples.
clear all;
begin_num = 0;   % Define your starting number
end_num = 5;   % Define your ending number
samples = 1000;   % Define the number of samples
increment = abs(begin_num - end_num)/samples;
array1 = (begin_num:increment:end_num);   % Define the array

% Now place the correct numbers into the parameters below:
freq = 2;   % Frequency
amp = 3;   % Amplitude 
hz = 2*pi.*freq;
x1 = array1;
y1 = amp*cos(x1.*hz);

% Now plot the resulting wave. Does it fulfill the requirements above?
figure(4); plot(x1,y1);
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on; title('Your signal');

% Zounds! You've got noise! Copy and paste the following code into your
% terminal to give your waveform "jaggies", or noise:
amp_noise = 1
y_noise = amp*cos(x1.*hz) + amp_noise*rand(1,length(y1)) - amp_noise*rand(1,length(y1));
figure(5); plot(x1,y_noise);
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on; title('Noisy signal');

% But wait! We have filters! The first one we'll use is called a moving average
% filter. This one takes the average of all numbers in a 10-number window and
% makes a single point. Try a window of 10 first, then try others. What window
% length makes the best-looking plot?
wndw = 10;   % Window size
y_filt = filter(ones(wndw,1)/wndw,1,y_noise)   % Filter function
figure(6); plot(x1,y_filt,'.-k');   % Plot filtered signal
hold on; plot(x1,y_noise,'--b');
legend('Filtered','Noisy');
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Now compare your filtered signal to the original. What do you notice?
figure(7); plot(x1,y_filt,'.-k');   % Plot filtered signal
hold on; plot(x1,y1,'-b');
legend('Filtered','Original');
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Let's try a Savitsky-Golay filter.
pkg load signal;
y_sgolay = sgolayfilt(y_noise,9,69);
figure(7); plot(x1,y_sgolay,'.-k');   % Plot filtered signal
hold on; plot(x1,y_noise,'--b');
legend('Filtered','Noisy');
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Now compare your filtered signal to the original. What do you notice?
figure(8); plot(x1,y_sgolay,'.-k');   % Plot filtered signal
hold on; plot(x1,y1,'-b');
legend('Filtered','Original');
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Now compare the moving average filter to the "sgolay" filter. Which do
% you think works better for this application? Why?
figure(9); plot(x1,y_filt,'.-k');
hold on; plot(x1,y_sgolay,'--b');
hold on; plot(x1,y1,'-r');
legend('Moving Average','Sgolay','Original');
xlim([begin_num end_num]);
ylim([-amp-0.25*amp amp+0.25*amp]);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% It's important to note that different filters are needed for different
% applications... and that too much filtering can be a bad thing!