% modulate audio signal 
clear all
% read in (shortened) audio file
[x, fs] = audioread('dontstopbelieving3.m4a');
info = audioinfo('dontstopbelieving3.m4a');
t = 0:1/fs:info.Duration; 
t = t(1:end-19);
sound(x, fs); % default sample rate of 44100

tup = 0:1/(fs*884):info.Duration; 
tup = tup(1:end-16531); % not sure why the size doesn't match up 
xup = interp(x(:,1), 884); % interpolate to higher sample rate of ~39 MHz 

% plot audio signals 
figure();
plot(t, x)
x = x(:,1);
t = t.'; 

figure();
plot(tup, xup)
xup = xup(:,1);
tup = tup.'; 

f = 10.1*10^6; % carrier signal frequency 
fs3 = fs*884; %get to sampling rate of ~39*10^6;
%stem(t2, x2)
fDev = 60*10^3; % frequency deviation 
y = fmmod(xup,f,fs3,fDev); % frequency modulate 

 % quantize modulated signal from [-1,1] to 16 bits 
 for i=1:size(y)
     z(i) = y(i)*((2^15) - 1) + ((2^15) - 1);
 end
 
% output modulated signal to file 
fileID = fopen('DSBOut1.txt','w');
fprintf(fileID,'%.0f\n',round(z));
fclose(fileID);

% plot modulated, mixed, original signals 
figure(); 
plot(tup, y, 'b')

%ts2 = 0:1/fs3:t(size(t));       % mix signal
xsin = sin(2*pi*(f-.1*10^6)*tup);
ymix = y.*xsin;


hold on; 
plot(tup, ymix) %mixed 

hold on; 
plot(tup, xup, 'r') %original 

xlabel('Time (s)')
ylabel('Amplitude')
legend('Modulated Signal', 'Mixed', 'Original Signal')