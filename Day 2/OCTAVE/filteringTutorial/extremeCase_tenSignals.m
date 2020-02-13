% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% RISE HIGH Data Science: Ten-signal example for driving home fft() concept.
%
% Path to '.../audioFunctions/' must be added [addpath('.../audioFunctions/')]
%
% Authors: Jason T. Smith, Chris Wiedeman & Robert Culibrk (RPI)
% Spring 2020 - **THIS VERSION FOR EA USE**
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

fs = 20000;
t = 0:1/fs:5-1/fs; % sampling

% Ten frequencies
freq1 = 2;
freq2 = 5;
freq3 = 11;
freq4 = 15;
freq5 = 18;
freq6 = 22;
freq7 = 26;
freq8 = 30;
freq9 = 34;
freq10 = 39;

% Ten signals with differing frequency and amplitude
signal1 = sin(freq1*(2*pi)*t).*(10/10);
signal2 = sin(freq2*(2*pi)*t).*(9/10);
signal3 = sin(freq3*(2*pi)*t).*(8/10);
signal4 = sin(freq4*(2*pi)*t).*(7/10);
signal5 = sin(freq5*(2*pi)*t).*(6/10);
signal6 = sin(freq6*(2*pi)*t).*(6/10);
signal7 = sin(freq7*(2*pi)*t).*(7/10);
signal8 = sin(freq8*(2*pi)*t).*(8/10);
signal9 = sin(freq9*(2*pi)*t).*(9/10);
signal10 = sin(freq10*(2*pi)*t).*(10/10);
% Sum all signals
signalTotal = signal1 + signal2 + signal3 + signal4 + signal5 + signal6 + signal7 + signal8 + signal9 + signal10;

% Plot combined signal
figure; plot(t, signalTotal, '-b', 'LineWidth', 3.5);
xlim([0 1])
title('Ten Signals Combined');
ylabel('Amplitude');

% Use fft() to look at 'signalTotal' frequencies
n = length(signalTotal);
f = linspace(0,fs-1/n,n);
freq = fft(signalTotal);
n = length(freq);
f = linspace(0,fs-1/n,n);
figure()
plot(f(1:end/2+1),abs(freq(1:end/2+1)),'-r', 'LineWidth', 2.5)
axis([0 40]);
title('Frequency Domain of Audio');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');

% Lowpass for illustration...
##filtered_signal = do_filter(signalTotal, fs, 'lowpass', 3 );
##
##figure; plot(t,filtered_signal,'-.m','LineWidth', 2.5);
##hold on; plot(t,signal1,'--b','LineWidth', 1.5);
##hold on; plot(f,S3,'-g','LineWidth', 1.5);
##hold on; plot(f,audio,'-k','LineWidth', 4);
##hold on; plot(f,filtered_signal,'--r','LineWidth', 2.5);
##xlim([0 2500]);