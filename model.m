clc
clear
B = 0.5; %brightness in candela
[d,a] = PupilDiameterFromLum(B);
%Keeping constant brightness B

% Set parameters
T = 100; % total time in seconds
dt = 0.025; % time step in seconds
tau = 20; % time constant for attention decay (in seconds)

% Initialize attention level
a = 0.5;

% Generate random fluctuations in attention level
noise = randn(1, T/dt)*0.1;

% Simulate attention level over time
for i = 1:T/dt
    % Update attention level using a simple decay model
    da = -a/tau*dt;
    a = a + da + noise(i)*dt;
    a = max(min(a, 1), 0); % restrict attention level to range [0, 1]
    
    % Store attention level
    att(i) = a;
end

% Plot attention level over time
t = linspace(0, T, T/dt);
figure(1)
plot(t, att);
xlabel('Time (s)');
ylabel('Attention level (0-1)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = [0:1:4000]; %milliseconds
y = ((x).^(10.1)).*exp(((-10.1).*(x))/930); %From Pupillary dilation as a measure of attention: A quantitative system analysis
X = [0:1:3999];
x = x./1000;
y = y./(10^26);
shift = 0;
impulse = x==(0+shift);
impulse(1300) = 1;
impulse(3500) = 1;
figure(2)
plot(x,y)
xlabel('Time (s)');
ylabel('Change in pupil diameter (mm)');
hold on
figure(3)
YCC = conv(y,att);
X = 1:1:8000;
X = X./80;
YCC = YCC./100;
plot(X,YCC)
xlabel('Time (s)');
ylabel('Change in pupil diameter (mm)');
