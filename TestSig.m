% generate sample frequency modulated signal 

%fs = 39*10^6*10; % sampling rate (Hz) 
fs = 39*10^6; 
%fc = 87.1*10^6;  % carrier signal frequency (Hz) 
fc = 9.1*10^6; 
t = (0:1/fs:2*10^-4)';
x = 0.5*sin(2*pi*10000*t) + 0.5*sin(2*pi*5000*t);


fDev = 75*10^3; % frequency deviation 

y = fmmod(x,fc,fs,fDev); % frequency modulate 

ts = (0:1/fs:2*10^-4)';       % mix signal
xsin = sin(2*pi*fc*ts);
ymix = y.*xsin;

z = fmdemod(y,fc,fs,fDev); % Demodulate both channels.

figure(); 
%plot(t,x,'c',t,z,'b--');
plot(t,y,'b',t,x,'r');
xlabel('Time (s)')
ylabel('Amplitude')
xlim([0 2*10^-4])
hold on;
plot(ts, ymix); 

% sample signal 
legend('Modulated Signal', 'Original Signal','Mixed')

fs1 = 39*10^6; % sampling rate (Hz) 
t1 = (0:1/fs1:10^-4)';
% under-sample y (every 10th sample)

% ys = zeros(3901, 1); %(d(1)-1)/10 + 1, 1); 
% for i = (1:3901)
%     ys(i) = y(10*(i-1)+1); 
% end

hold on; 
%stem(t1, ys); 

% generate 13.3 MHz sine, sampled
fs2 = 39*10^6; % sampling rate (Hz) 
f2 = 13.3*10^6; % signal frequency 
t2 = (0:1/fs2:10^-4)';
x2 = sin(2*pi*500*t2 + 0.3);
%stem(t2, x2)

y2 = fmmod(x2,f2,fs2,fDev); % frequency modulate 

figure(); 
plot(t2, y2, 'b')

hold on; 
plot(t2, x2, 'r')

ts2 = (0:1/fs2:10^-4)';       % mix signal
xsin2 = sin(2*pi*f2*t2);
ymix2 = y2.*xsin2;

hold on; 
plot(ts2, ymix2)

xlabel('Time (s)')
ylabel('Amplitude')
xlim([0 10^-4])
legend('Modulated Signal', 'Original Signal','Mixed')
 