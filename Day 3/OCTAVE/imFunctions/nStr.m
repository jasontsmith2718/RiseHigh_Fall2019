

function n = nStr(nV)

if(nV >= 1 && nV < 10)
  nV = ['0' num2str(nV)];
else
  nV = num2str(nV);
endif

n = nV;

endfunction
