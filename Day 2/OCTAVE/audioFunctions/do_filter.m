function filtered_signal = do_filter (signal, fs, ftype, fc)
%%Filtering Functions
signal = fft(signal);
n = length(signal);
f = linspace(0,fs-1/n,n);
%Low Pass
if strncmp(ftype, 'lowpass', 60)
  if length(fc) == 1
    ffilter = f(1:end/2+1)<fc;
    ffilter = [ffilter, flip(ffilter(2:end-1))];
    filtered_signal = real(ifft(signal .* ffilter));
  else
    disp('Only one cutoff allowed for lowpass option')
  end
%Highpass
elseif strncmp(ftype, 'highpass', 60)
  if length(fc) == 1
    ffilter = f(1:end/2+1)>fc;
    ffilter = [ffilter, flip(ffilter(2:end-1))];
    filtered_signal = real(ifft(signal .* ffilter));
  else
    disp('Only one cutoff allowed for highpass option')
  end
%Bandpass  
elseif strncmp(ftype, 'bandpass', 60)
  if length(fc) == 2
      ffilter = f(1:end/2+1)>min(fc) & f(1:end/2+1)<max(fc);
    ffilter = [ffilter, flip(ffilter(2:end-1))];
    filtered_signal = real(ifft(signal .* ffilter));
  else
    disp('Two cutoffs must be specified for bandpass option')
  end  
%Bandstop  
elseif strncmp(ftype, 'bandstop', 60)
  if length(fc) == 2
    ffilter = f(1:end/2+1)>min(fc) & f(1:end/2+1)<max(fc);
    ffilter = ~ffilter;
    ffilter = [ffilter, flip(ffilter(2:end-1))];
    filtered_signal = real(ifft(signal .* ffilter));
  else
    disp('Two cutoffs must be specified for bandpass option')
  end
else
  disp('Filter keyword must be lowpass, highpass, bandpass, or bandstop');
end
endfunction
