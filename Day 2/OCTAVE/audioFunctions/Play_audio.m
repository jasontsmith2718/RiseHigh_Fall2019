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
## @deftypefn {} {@var{retval} =} Play_audio (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: cwied <cwied@DESKTOP-O6DJ20J>
## Created: 2020-01-20

function retval = Play_audio (audio, fs)
%%Play Audio Functions
player = audioplayer(audio, fs);
play(player)
t = linspace(0,(length(audio)-1)/fs,length(audio));

c = player.CurrentSample;
while -1<c && c<length(audio)
    c = player.CurrentSample;
    plot(t,audio);axis([c/fs-1 c/fs+1 min(audio) max(audio)]);
    ylabel('Sound Amplitude');
    xlabel('Time (seconds)');
    drawnow
    pause(.01)
  end
  
  
 
freq = fft(audio);
n = length(freq);
f = linspace(0,fs-1/n,n);
figure()
plot(f(1:end/2+1),abs(freq(1:end/2+1)))
axis([0 f(end/2+1)]);
title('Frequency Domain of Audio');
xlabel('Frequency(Hz)');
ylabel('Relative Amplitude');
endfunction
