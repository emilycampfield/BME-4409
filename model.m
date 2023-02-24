clc
clear
B = 0.5; %brightness in candela
[d,a] = PupilDiameterFromLum(B);
%Keeping constant brightness B
x = [0:1:4000]; %milliseconds
y = ((x).^(10.1)).*exp(((-10.1).*(x))/930); %From Pupillary dilation as a measure of attention: A quantitative system analysis
%yy = ((x).^(10.1)).*exp(((-10.1).*(x))/930);
X = [0:1:3999];
% yF = fft(y);
% sys = 1./y;
shift = 0;
impulse = x==(0+shift);
impulse(1300) = 1;
impulse(3500) = 1;
%plot(yF)
%impulse = 8*10^23*impulse;
%plot(impulse)
YC = conv(y,impulse+shift);

t = linspace(0.2,2*pi,8001);
yn = sin(t);
an = 8*10^23; %noise amplitude
noise = an*(rand(size(yn))-0.5);
%plot(y+noise)
plot(YC+noise)
% 
% ycat = cat(2,zeros(1,2000),y);
% ycat2 = cat(2,zeros(1,1000),ycat);
% ycat2(6002:end) = [];
% %plot(YC)
% figure(1)
% hold on
% plot(ycat)
% plot(impulse*(max(y)))
% 
% figure(2)
% plot(ycat2)
% 
% figure(3)
% plot(X,(ycat+ycat2)+noise)