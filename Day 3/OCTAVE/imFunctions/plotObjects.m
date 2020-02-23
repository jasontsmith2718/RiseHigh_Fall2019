% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Rise High Data Science - Overlay contours onto original image (brain scan for 
% tumor detection). The function iterates between six different colors as it overlays
% each edge.
%
% Author: Jason Smith, RPI, 2020
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

function plotObjects (edges, im)
se = strel('square',2);
edges = imclose(edges, se);
bounds = bwboundaries (edges);

c = [{'r'} {'b'} {'g'} {'y'} {'m'} {'c'}]';
j = 1;
figure; imshow(im)
hold on;
for k = 1:numel (bounds)
  plot (bounds {k} (:, 2), bounds {k} (:, 1), c{j}, 'linewidth', 3.5);
  j = j+1;
  if (mod(j,6)==0)
    j = 1;
  endif
endfor
hold off

endfunction
