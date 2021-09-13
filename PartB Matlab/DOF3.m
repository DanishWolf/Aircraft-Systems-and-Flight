function [t, X] = DOF3(tf, dt)
%% Parameters
% Time
g = 9.80665;
m = 7990.0;
V = 100;
epsilon = 0;
mu = 0;
T = m*g;
L = m*g;
W = m*g;
sys = {m,g,T,L,W};

% Time vector
t = 0:dt:tf-dt;
samples = length(t);

% Aircraft initial parameters
init = struct('x', 0, ...        % Structure array of initial parameters
              'y', 0, ...
              'z', 0);
init.v_forward = 100;            % Forward speed [m/s]
init.v_vertical = 1000;             % Climb speed [m/s] 
init.heading = 0;                % Airplane heading (yaw angle) [rad]

[X, u] = DOF3_init(t, init);

% Initial state vector (first column of the state matrix)
x0 = X(1,:);

% Initial input vector (V, angle of attack, side slip)
u0 = u(1,:);

%% Simulation (Euler integration)
opts = odeset('RelTol',1e-6,'AbsTol',1e-5);
[t2,X] = ode45(@dynamics,[0:dt:tf-dt],x0,opts,sys,u0);
    
disp('Visualizing...')

vp = 2*[500, 500, 50]; % field of view
plot_flight(t2, X, vp);
disp('Done!')

end

