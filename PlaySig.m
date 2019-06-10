% play demodulated signal 

clear all
% read in demodulated signal; each value on new line 
fileID = fopen('SigOut2.txt','r');
formatSpec = '%f';
sig1in = fscanf(fileID,formatSpec);

% downsample to get to a reasonable sample rate 
sig1 = 0;
for i = 1:size(sig1in)
    if mod(i, 390) == 0
        sig1 = [sig1; sig1in(i)]; % toss out some samples 
    end  
end
soundsc(sig1, 10^5); % output signal at a realistic rate  



