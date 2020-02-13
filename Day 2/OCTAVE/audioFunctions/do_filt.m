## Copyright (C) 2020 cwied
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} do_filter (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: cwied <cwied@DESKTOP-O6DJ20J>
## Created: 2020-01-20

function filtered_signal = do_filt (signal, fs, ftype, fc)
%%Filtering Functions
n = length(signal);
f = linspace(0,fs-1/n,n);
signal = fft(signal);
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