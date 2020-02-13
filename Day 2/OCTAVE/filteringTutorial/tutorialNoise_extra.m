%% Lowpass w/ noise

fs = 20000;
t = 0:1/fs:5-1/fs;

f1 = 2;
f2 = 10;
f3 = 25;
S1 = sin(f1*2*pi*t) + ;
S1N = normrnd(0,.25,[size(S1) 1]);
S2 = sin(f2*2*pi*t).*.25;
S3 = sin(f3*2*pi*t).*.5;
audio = S1 + S1N + S2 + S3;

n = length(audio);
f = linspace(0,fs-1/n,n);

filtered_signal = do_filter(audio, fs, 'lowpass', 7);
##figure; plot(f,S3,'-.m','LineWidth', 1.5);
##hold on; plot(f,S2,'--b','LineWidth', 1.5);
hold on; plot(f,audio,'-.k','LineWidth', 1);
hold on; plot(f,S1,'-m','LineWidth', 4.5);
hold on; plot(f,filtered_signal,'--r','LineWidth', 5);
xlim([0 2500]);

%% Bandpass w/ noise

fs = 20000;
t = 0:1/fs:5-1/fs;

f1 = 2;
f2 = 10;
f3 = 25;
S1 = sin(f1*2*pi*t) + ;
S2 = sin(f2*2*pi*t).*.25;
S3 = sin(f3*2*pi*t).*.5;
S3N = normrnd(0,.25,[size(S1) 1]);
audio = S1 + S2 + S3 + S3N;

n = length(audio);
f = linspace(0,fs-1/n,n);


filtered_signal = do_filter(audio, fs, 'bandpass', [7 12]);
##figure; plot(f,S3,'-.m','LineWidth', 1.5);
##hold on; plot(f,S1,'--b','LineWidth', 1.5);
hold on; plot(f,audio,'-.k','LineWidth', 1);
hold on; plot(f,S2,'-m','LineWidth', 4.5);
hold on; plot(f,filtered_signal,'--r','LineWidth', 5);
xlim([0 2500]);

%% Highpass w/ noise

fs = 10000;
t = 0:1/fs:5-1/fs;

f1 = 4;
f2 = 10;
f3 = 25;
S1 = sin(f1*2*pi*t);
S1N = normrnd(0,.15,[size(S1) 1]);
S2 = sin(f2*2*pi*t).*.25;
S3 = sin(f3*2*pi*t).*.5;

audio = S1 + S1N + S2 + S3;

n = length(audio);
f = linspace(0,fs-1/n,n);

filtered_signal = do_filter(audio, fs, 'highpass',  15);
figure; plot(f,audio,'-.k','LineWidth', 1);
hold on; plot(f,filtered_signal,'--r','LineWidth', 5);
hold on; plot(f,S3,'-b','LineWidth', 4.5);
xlim([0 2500]);
legend('Noisy signal', 'Filtered Signal', 'Original High-Frequency')

%% Problem #???
% - Why does the highpass filter not get rid of the added signal noise "S1N"?
% - Describe the filtered signal you see. How would you isolate the high-frequency
% signal?