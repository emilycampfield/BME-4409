% Set parameters
T = 100; % total time in seconds
dt = 0.025; % time step in seconds
tau = 10; % time constant for attention decay (in seconds)

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
plot(t, att);
xlabel('Time (s)');
ylabel('Attention level');
