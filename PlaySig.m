clear all
% read in signal; each value on new line 
% SigOut1.txt 
fileID = fopen('SigOut1.txt','r');
formatSpec = '%f';
sig1in = fscanf(fileID,formatSpec);

sig1 = 0;
%downsample by 390 to get to a reasonable sample rate 

for ii = 1:100 %repeat bc its too short
for i = 1:size(sig1in)
    if mod(i, 390) == 0
        sig1 = [sig1; sig1in(i)]; %= decimate(sig1in, 39)
    end  
end
end
soundsc(sig1, 10^5); % output signal at system sample clock 
% plays 500 hz signal 


