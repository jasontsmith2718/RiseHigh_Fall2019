a = csvread('BPM_Test1 (Raw).csv');

signal = a(:,2)'; 
if mod(length(signal),2) == 1
  signal(end) = [];
  end

fs = 500; %Hz
t = 0:1/fs:(length(signal)-1)/fs;

%%Find Frequency Spectrum:
freq = fft(signal);
n = length(freq);
f = linspace(0,fs-1/n,n);
x = f(1:round(end/2));
y = abs(freq(1:round(end/2)));
xlabel('Time (seconds)');
ylabel('Relative Amplitude');

%%Plot
subplot(2,1,1);
plot(t,signal);
title('Signal')
subplot(2,1,2);
plot(x,y)
axis([0 f(round(end/2))]);
title('Frequency Domain');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');

%%Filter
fc = 59;  %Select frequency cutoff(s)
signal = do_filter(signal, fs, 'lowpass', fc); %select type of filter

%%Find Frequency Spectrum Again:
freq = fft(signal);
n = length(freq);
f = linspace(0,fs-1/n,n);
x = f(1:round(end/2));
y = abs(freq(1:round(end/2)));
xlabel('Time (seconds)');
ylabel('Relative Amplitude');

%%Plot Again
subplot(2,1,1);
plot(t,signal);
title('Signal')
subplot(2,1,2);
plot(x,y)
axis([0 f(round(end/2))]);
title('Frequency Domain');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');



